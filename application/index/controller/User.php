<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use fast\Random;
use think\Config;
use think\Cookie;
use think\Db;
use think\exception\PDOException;
use think\Hook;
use think\Session;
use think\Validate;

/**
 * 会员中心
 */
class User extends FrontendBase
{

    protected $layout = '';
    protected $noNeedLogin = ['loginPage', 'login', 'register', 'third','emailLogin'];
    protected $noNeedRight = ['*'];

    public function _initialize()
    {
        parent::_initialize();
        $auth = $this->auth;

        if (!Config::get('fastadmin.usercenter')) {
            $this->error(__('User center already closed'));
        }

        $ucenter = get_addon_info('ucenter');
        if ($ucenter && $ucenter['state']) {
            include ADDON_PATH . 'ucenter' . DS . 'uc.php';
        }

        //监听注册登录注销的事件
        Hook::add('user_login_successed', function ($user) use ($auth) {
            $expire = input('post.keeplogin') ? 30 * 86400 : 0;
            Cookie::set('uid', $user->id, $expire);
            Cookie::set('token', $auth->getToken(), $expire);
        });
        Hook::add('user_register_successed', function ($user) use ($auth) {
            Cookie::set('uid', $user->id);
            Cookie::set('token', $auth->getToken());
        });
        Hook::add('user_delete_successed', function ($user) use ($auth) {
            Cookie::delete('uid');
            Cookie::delete('token');
        });
        Hook::add('user_logout_successed', function ($user) use ($auth) {
            Cookie::delete('uid');
            Cookie::delete('token');
        });
    }

    /**
     * 空的请求
     * @param $name
     * @return mixed
     */
    public function _empty($name)
    {
        $data = Hook::listen("user_request_empty", $name);
        foreach ($data as $index => $datum) {
            $this->view->assign($datum);
        }
        return $this->view->fetch('user/' . $name);
    }

    /**
     * 会员中心
     */
    public function index()
    {
        $this->view->assign('title', __('User center'));
        return $this->view->fetch();
    }

    /**
     * 注册会员
     */
    public function register()
    {
        $referer_url = urldecode(input('referer_url'));
        if ($this->auth->id)
            $this->success(__('You\'ve logged in, do not login again'), $referer_url);
        if ($this->request->isPost()) {
            $username = $this->request->post('username');
            $password = $this->request->post('password');
            $email = $this->request->post('email');
            $mobile = $this->request->post('mobile', '');
            $captcha = $this->request->post('captcha');
            $token = $this->request->post('__token__');

            $event = $this->request->request('event');

            if (!\app\common\library\Ems::check($email, $captcha, $event))
            {
                $this->error(__('验证码不正确'), null, ['token' => $this->request->token()]);
            }

            $rule = [
                'username'  => 'require|length:3,30',
                'password'  => 'require|length:6,30',
                'email'     => 'require|email',
//                'mobile'    => 'regex:/^1\d{10}$/',
//                'captcha'   => 'require|captcha',
                '__token__' => 'token',
            ];

            $msg = [
                'username.require' => 'Username can not be empty',
                'username.length'  => 'Username must be 3 to 30 characters',
                'password.require' => 'Password can not be empty',
                'password.length'  => 'Password must be 6 to 30 characters',
                'captcha.require'  => 'Captcha can not be empty',
//                'captcha.captcha'  => 'Captcha is incorrect',
                'email'            => 'Email is incorrect',
                'mobile'           => 'Mobile is incorrect',
            ];
            $data = [
                'username'  => $username,
                'password'  => $password,
                'email'     => $email,
                'mobile'    => $mobile,
                'captcha'   => $captcha,
                '__token__' => $token,
            ];
            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
            }
            if ($this->auth->register($username, $password, $email, $mobile)) {
                $synchtml = '';
                ////////////////同步到Ucenter////////////////
                if (defined('UC_STATUS') && UC_STATUS) {
                    $uc = new \addons\ucenter\library\client\Client();
                    $synchtml = $uc->uc_user_synregister($this->auth->id, $password);
                }
                $this->success(__('Sign up successful') . $synchtml, $referer_url ? $referer_url : url('user/index'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        //判断来源
        $referer = $this->request->server('HTTP_REFERER');
        if (!$referer_url && (strtolower(parse_url($referer, PHP_URL_HOST)) == strtolower($this->request->host()))
            && !preg_match("/(user\/login|user\/register)/i", $referer)) {
            $referer_url = $referer;
        }
        $this->view->assign('referer_url', $referer_url);
        $this->view->assign('title', __('Register'));
        return $this->view->fetch();
    }

    /**
     * 登录页
     * Author: cwm
     * Date: 2019/5/9
     * @param
     * @return string
     */
    public function loginPage(){
        if ($this->auth->id){
            $this->redirect('index/user/index');
        }
        return $this->view->fetch();
    }

    /**
     * 会员登录
     * 以iframe显示的登录页
     */
    public function login()
    {

        $referer_url = urldecode(input('referer_url'));
        if ($this->auth->id) {
            $this->success(__('You\'ve logged in, do not login again'), $referer_url ? $referer_url : url('user/index'));
        }
        if ($this->request->isPost()) {
            $account = $this->request->post('account');
            $password = $this->request->post('password');
            $keeplogin = (int)$this->request->post('keeplogin');
            $token = $this->request->post('__token__');
            $rule = [
                'account'   => 'require|length:3,50',
                'password'  => 'require|length:6,30',
                '__token__' => 'token',
            ];

            $msg = [
                'account.require'  => 'Account can not be empty',
                'account.length'   => 'Account must be 3 to 50 characters',
                'password.require' => 'Password can not be empty',
                'password.length'  => 'Password must be 6 to 30 characters',
            ];
            $data = [
                'account'   => $account,
                'password'  => $password,
                '__token__' => $token,
            ];
            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
                return false;
            }
            if ($this->auth->login($account, $password)) {
                $this->success(__('Logged in successful'), $referer_url ? $referer_url : url('user/index'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        //判断来源
        $referer = $this->request->server('HTTP_REFERER');
        if (!$referer_url && (strtolower(parse_url($referer, PHP_URL_HOST)) == strtolower($this->request->host()))
            && !preg_match("/(user\/login|user\/register|user\/logout)/i", $referer)) {
            $referer_url = $referer;
        }

        $this->view->assign('referer_url', $referer_url);
        $this->view->assign('title', __('Login'));
        return $this->view->fetch();
    }

    public function emailLogin(){

        if ($this->request->isPost()) {
            $referer_url = $this->request->request('referer_url','');
            $referer_url = $referer_url?urldecode($referer_url):url('index/user/index');
            $account = $this->request->post('email');
            $token = $this->request->post('__token__');
            $captcha = $this->request->request('captcha');
            $event = $this->request->request('event');

            if (!\app\common\library\Ems::check($account, $captcha, $event))
            {
                $this->error(__('验证码不正确'), null, ['token' => $this->request->token()]);
            }

            $rule = [
                'account'   => 'require|email',
                '__token__' => 'token',
            ];

            $msg = [
                'account.require'  => 'Account can not be empty',
                'account.email'  => '邮箱格式不正确',
            ];
            $data = [
                'account'   => $account,
                '__token__' => $token,
            ];
            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
                return FALSE;
            }

            $user = \app\admin\model\User::where('email',$account)->find();

            if ($user) {
                if ($user->status != 'normal')
                {
                    $this->error(__('账号被冻结'), null, ['token' => $this->request->token()]);
                    return FALSE;
                }

            }else{
                //账号不存在就注册一个
                // 先随机一个用户名,随后再变更为u+数字id
                $username = Random::alnum(20);
                $password = Random::alnum(6);

                Db::startTrans();
                try {
                    // 默认注册一个会员
                    $result = $this->auth->register($account, $password, $account);
                    if (!$result) {
                        $this->error(__('登录失败'), null, ['token' => $this->request->token()]);
                    }
                    $user = $this->auth->getUser();

                    Db::commit();

                } catch (PDOException $e) {
                    Db::rollback();
                    $this->auth->logout();
                    $this->error(__('登录失败'), null, ['token' => $this->request->token()]);
                }
            }

            $res = $this->auth->direct($user->id);
            if($res){
                $this->success(__('Logged in successful'),$referer_url);
            }else{
                $this->error(__('登录失败'), null, ['token' => $this->request->token()]);
            }
        }

    }

    /**
     * 注销登录
     */
    function logout()
    {
        //注销本站
        $this->auth->logout();
        $synchtml = '';
        ////////////////同步到Ucenter////////////////
        if (defined('UC_STATUS') && UC_STATUS) {
            $uc = new \addons\ucenter\library\client\Client();
            $synchtml = $uc->uc_user_synlogout();
        }
        $this->success(__('Logout successful') . $synchtml,'','',2);
    }

    /**
     * 个人信息
     */
    public function profile()
    {
        $this->view->assign('title', __('Profile'));
        return $this->view->fetch();
    }

    /**
     * 修改密码
     */
    public function changepwd()
    {
        if ($this->request->isPost()) {
            $oldpassword = $this->request->post("oldpassword");
            $newpassword = $this->request->post("newpassword");
            $renewpassword = $this->request->post("renewpassword");
            $token = $this->request->post('__token__');
            $rule = [
                'oldpassword'   => 'require|length:6,30',
                'newpassword'   => 'require|length:6,30',
                'renewpassword' => 'require|length:6,30|confirm:newpassword',
                '__token__'     => 'token',
            ];

            $msg = [
            ];
            $data = [
                'oldpassword'   => $oldpassword,
                'newpassword'   => $newpassword,
                'renewpassword' => $renewpassword,
                '__token__'     => $token,
            ];
            $field = [
                'oldpassword'   => __('Old password'),
                'newpassword'   => __('New password'),
                'renewpassword' => __('Renew password')
            ];
            $validate = new Validate($rule, $msg, $field);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
                return FALSE;
            }

            $ret = $this->auth->changepwd($newpassword, $oldpassword);
            if ($ret) {
                $synchtml = '';
                ////////////////同步到Ucenter////////////////
                if (defined('UC_STATUS') && UC_STATUS) {
                    $uc = new \addons\ucenter\library\client\Client();
                    $synchtml = $uc->uc_user_synlogout();
                }
                $this->success(__('Reset password successful') . $synchtml, url('user/login'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        $this->view->assign('title', __('Change password'));
        return $this->view->fetch();
    }

}
