<?php

namespace app\index\controller;

use app\common\controller\Frontend;
use app\common\model\Category;
use fast\Tree;
/**
 * 前台控制器基类
 */
class FrontendBase extends Frontend
{
    protected $layout = '';
    public function _initialize()
    {
        parent::_initialize();
		        
    }

    /**
     * 接口响应
     * @param array $data
     * @param int $code
     * @param string $message
     * @param int $force
     */
    protected function json($data = [], $code = 0, $message = '', $force = 0)
    {
        header('Content-Type:application/json;charset=utf-8');
        $result = [
            'code' => $code,
            'msg' => $message,
            'data' => $data,
            '_' => [
                'rt' => $_SERVER['REQUEST_TIME'],
                'et' => microtime(true) - THINK_START_TIME,
            ],
        ];
        if (config('debug')) {
            $result['_sql'] = ['sql' => Log::getLog('sql')];
        }
        $p = JSON_UNESCAPED_UNICODE;
        $p = isset($_GET['_pretty']) && $_GET['_pretty'] === '1' ? $p | JSON_PRETTY_PRINT : $p;
        $p = $force ? ($p | JSON_FORCE_OBJECT) : $p;
        die(json_encode($result, $p));
    }

    /**
     * 异常响应
     * @param $message
     */
    protected function exception($message)
    {
        $this->json(null, 1, $message);
    }
}