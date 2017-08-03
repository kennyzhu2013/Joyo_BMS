<?php 
namespace Admin\Controller;
use Think\Controller;
class TestController extends AdminCommonController{
    public function index(){
        $this->show('ok');
    }
}