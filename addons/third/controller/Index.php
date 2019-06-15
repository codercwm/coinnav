<?php

namespace addons\third\controller;

use addons\third\library\Application;
use addons\third\library\Service;
use think\addons\Controller;
use think\Cookie;
use think\Exception;
use think\Hook;
use think\Session;
use think\Cache;

/**
 * 第三方登录插件
 */
class Index extends Controller
{

    protected $app = null;
    protected $options = [];


    public function _initialize()
    {
        parent::_initialize();

        $config = get_addon_config('third');
        if (!$config) {
            $this->error(__('Invalid parameters'));
        }
        $options = array_intersect_key($config, array_flip(['qq', 'weibo', 'wechat']));
        foreach ($options as $k => &$v) {
            if(request()->isMobile()){
                $v['callback'] = addon_url('third/index/callback', [':platform' => $k], false, true);
            }else{
                //如果是扫码就跳转扫码结果页
                $v['callback'] = addon_url('third/index/scanresult', [':platform' => $k], false, true);
            }
            $options[$k] = $v;
        }
        unset($v);
        $this->app = new Application($options);
    }

    /**
     * 插件首页
     */
    public function index()
    {
        return $this->view->fetch();
    }

    /**
     * 发起授权
     */
    public function connect()
    {
        $platform = $this->request->param('platform');
        $referer_url = $this->request->param('referer_url');
        if (!$this->app->{$platform}) {
            $this->error(__('Invalid parameters'));
        }
        if ($referer_url) {
            Session::set("redirecturl", urldecode($referer_url));
        }
        // 跳转到登录授权页面
        $authorize_url = $this->app->{$platform}->getAuthorizeUrl();
        //如果是手机就直接跳转，如果是电脑就显示二维码
        cl($authorize_url);
        if(request()->isMobile()){
            exit('<script>top.location.href="'.$authorize_url['url'].'"</script>');
        }else{
            $this->assign('platform',$platform);
            $this->assign('state',$authorize_url['state']);
            $this->assign('authorize_url',$authorize_url['url']);
            return $this->view->fetch('qrcode');
        }
        return;
    }

    /**
     * 扫码结果页面
     * Author: cwm
     * Date: 2019/3/12
     */
    public function scanResult(){
        $state = $this->request->param('state','');
        $code = $this->request->param('code','');
        $res = Cache::set($state,$code,20);
        if(!empty($state)&&!empty($code)&!empty($res)){
            $this->assign('status',1);
            $this->assign('msg','扫码成功');
            $this->assign('desc','请继续在浏览器上操作');
        }else{
            $this->assign('status',0);
            $this->assign('msg','扫码失败');
            $this->assign('desc','请刷新浏览器重新扫码');
        }
        return $this->view->fetch();
    }

    /**
     * 检查是否扫码成功
     * Author: cwm
     * Date: 2019/3/12
     */
    public function checkScan(){
        $state = $this->request->param('state');
        $code = Cache::get($state);
        if(!empty($code)){
            $this->success('扫码成功','',$code);
        }else{
            $this->error('等待');
        }
    }

    /**
     * 通知回调
     */
    public function callback()
    {
        $auth = $this->auth;

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
        Hook::add('user_logout_successed', function ($user) use ($auth) {
            Cookie::delete('uid');
            Cookie::delete('token');
        });
        //真实奇怪
        $platform = $this->request->param('platform',$this->request->get('platform'));

        // 成功后返回之前页面
        $url = Session::has("redirecturl") ? Session::pull("redirecturl") : url('index/user/index');

        // 授权成功后的回调
        try{
            $result = $this->app->{$platform}->getUserInfo();
        }catch (Exception $e){
            $this->error($e->getMessage(), $url);
        }

        if ($result) {
            $loginret = Service::connect($platform, $result);
            if ($loginret) {
                $synchtml = '';
                ////////////////同步到Ucenter////////////////
                if (defined('UC_STATUS') && UC_STATUS) {
                    $uc = new \addons\ucenter\library\client\Client();
                    $synchtml = $uc->uc_user_synlogin($this->auth->id);
                }
                $this->success(__('登录成功') . $synchtml, $url);
            }
        }
        $this->error(__('操作失败'), $url);
    }

}
