<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends AdminCommonController{
    public function index(){
        $this->assign('title','Main');
        $this->assign('wurl',$url);
        $this->assign('mark','main');
        $this->display();
    }
}