<?php

namespace app\index\controller;

use app\common\controller\Frontend;

/**
 * 币资讯
 * Class Information
 * @package app\index\controller
 */
class Information extends FrontendBase
{

    protected $noNeedLogin = '*';
    protected $noNeedRight = '*';
    protected $layout = '';

    public function _initialize()
    {
        parent::_initialize();
    }

    public function index()
    {
        /*$categorymodel = new Category();
        $tree = Tree::instance();
        $tree->init(collection($categorymodel->order('weigh desc,id desc')->select())->toArray(), 'pid');
        $categorylist = $tree->getTreeList($tree->getTreeArray(0), 'name');

        $this->assign('categorylist',$categorylist);*/

        return $this->view->fetch();
    }


}
