<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use app\common\library\Token;
use app\common\model\Category;
use app\common\model\UserDefineUrl;
use app\common\model\UserUrl;
use fast\Tree;
use think\Exception;

class Index extends FrontendBase
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    private $uid;

    public function _initialize()
    {
        parent::_initialize();
        $this->uid = 4;
        $this->uid = $this->auth->id ?? 0;
    }

    /**
     * 首页
     */
    public function index()
    {
        $categorymodel = new Category();

        //推荐
        $recommendList = collection($categorymodel->where(['flag'=>'recommend'])->select())->toArray();
        $userUrl = new UserUrl();
        $uid = $this->uid;       //伪代码
        foreach ($recommendList as $key=>$val){
            if($uid>0){
                $recommendList[$key]['is_add'] = $userUrl->where(['uid'=>$uid,'cat_id'=>$val['id']])->find() ? 1: 0;
            }else{
                $recommendList[$key]['is_add'] = 0;
            }
        }

        //用户自定义
        if($uid>0){
            $list =  collection($userUrl->alias('a')->field('b.*')->join('category b','a.cat_id=b.id')->where('uid',$uid)->select())->toArray();
            $userDefineModel = new UserDefineUrl();
            $userDefineList = collection($userDefineModel->where('uid',$uid)->select())->toArray();
            $userList = array_merge($userDefineList,$list);
        }else{
            $userList = [];
        }

        $this->assign('recommendList',$recommendList);
        $this->assign('userList',$userList);
        return $this->view->fetch();
    }


    /**
     * 分类详情
     * @param int $cat_id 分类id
     * @return void
     */
    public function catInfo(int $cat_id = 0)
    {
        $categorymodel = new Category();
        $cat_list = collection($categorymodel->where(['pid'=>$cat_id])->select())->toArray();
        $userUrl = new UserUrl();
        $uid = $this->uid;    //伪代码
        foreach ($cat_list as $k=>$v){
            $tmpArr = collection($categorymodel->where(['pid'=>$v['id']])->select())->toArray();
            foreach ($tmpArr as $key=>$val){
                if($uid>0){
                    $tmpArr[$key]['is_add'] = $userUrl->where(['uid'=>$uid,'cat_id'=>$val['id']])->find() ? 1: 0;
                }else{
                    $tmpArr[$key]['is_add'] = 0;
                }
            }

            $cat_list[$k]['childlist'] = $tmpArr;
        }
        $this->assign('cat_info',$cat_list);
        return $this->view->fetch();
    }


    public function coinInfo()
    {
        return view();
    }

    /**
     * 把url网址添加到自定义列表
     * @param int $url_id 链接id
     *
     */
    public function addSelf($url_id)
    {
        try{
            //检查链接id
            if(empty($url_id)){
                $this->exception('链接出错');
            }

            //检查用户是否登录
            if(empty($this->uid)){
                $this->json([],-1,'请先登录!');
            }

            $uid = $this->uid; //伪代码
            $model = new UserUrl();
            $is_has = $model->where(['uid'=>$uid,'cat_id'=>$url_id])->find();

            if($is_has){
                $this->exception('该链接已在自定义列表中！');
            }

            $model->uid = $uid;
            $model->cat_id = $url_id;
            $model->save();
            $this->json(null,0,'成功添加到自定义列表！');
        }catch (Exception $exception){
            $this->exception($exception->getMessage());
        }
    }

    /**
     * 把url网址从自定义列表中删除
     */
    public function delSelf($url_id)
    {
        try{
            //检查链接id
            if(empty($url_id)){
                $this->exception('链接出错');
            }

            //检查用户是否登录
            if(empty($this->uid)){
                $this->json([],-1,'请先登录!');
            }

            $uid = $this->uid; //伪代码
            $model = new UserUrl();
            $is_has = $model->where(['uid'=>$uid,'cat_id'=>$url_id])->find();

            if(!$is_has){
                $this->exception('该链接已不再自定义列表中!');
            }
            $is_has->delete();
            $this->json(null,0,'成功从自定义列表移除！');
        }catch (Exception $exception){
            $this->exception($exception->getMessage());
        }
    }


    /**
     * 用户添加他自己的站点
     */
    public function addUserSite($name,$url)
    {
        //先判断用户有没有登录
        try{
            $uid = $this->uid;
            if(!$uid){
                $this->exception('请先登录');
            }
            if(empty($name)||empty($url)){
                $this->exception('参数有误!');
            }
            if(!is_has_http($url)){
                $this->exception('域名必须带上http或https');
            }
            $defineUrl = new UserDefineUrl();
            $defineUrl->uid = $uid;
            $defineUrl->name = htmlspecialchars($name);
            $defineUrl->description = htmlspecialchars($url);
            $defineUrl->save();
            $this->json(null,0,'添加成功');
        }catch (Exception $exception){
            $this->exception($exception->getMessage());
        }

    }

    public function editUserSite($id,$name,$url)
    {
        //先判断用户有没有登录
        try{
            $uid = $this->uid;
            if(!$uid){
                $this->exception('请先登录');
            }
            if(empty($name)||empty($url)){
                $this->exception('参数有误!');
            }
            if(!is_has_http($url)){
                $this->exception('域名必须带上http或https');
            }
            $defineUrl = new UserDefineUrl();
            $model = $defineUrl->where('id',$id)->find();
            $model->name = htmlspecialchars($name);
            $model->description = htmlspecialchars($url);
            $model->save();
            $this->json(null,0,'修改成功');
        }catch (Exception $exception){
            $this->exception($exception->getMessage());
        }
    }

    //删除用户自定义的站点
    public function delUserSite($id)
    {
        //先判断用户有没有登录
        try{
            $uid = $this->uid;
            if(!$uid){
                $this->exception('请先登录');
            }

            $defineUrl = new UserDefineUrl();
            $model = $defineUrl->where('id',$id)->find();
            if(empty($model)){
                $this->exception('没有找到该数据');
            }
            $model->delete();
            $this->json(null,0,'删除成功');

        }catch (Exception $exception){
            $this->exception($exception->getMessage());
        }
    }

    //备份注释代码
    public function bak()
    {
//        $tree = Tree::instance();
//        $tree->init(collection($categorymodel->order('weigh,id')->select())->toArray(), 'pid');
//        $categorylist = $tree->getTreeArray($cat_id);

        //        $tree = Tree::instance();
//        $tree->init(collection($categorymodel->order('weigh desc,id desc')->select())->toArray(), 'pid');
//        $categorylist = $tree->getTreeList($tree->getTreeArray(0), 'name');

    }

    public function news()
    {
        $newslist = [];
        return jsonp(['newslist' => $newslist, 'new' => count($newslist), 'url' => 'https://www.fastadmin.net?ref=news']);
    }
}
