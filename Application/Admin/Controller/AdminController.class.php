<?php
namespace Admin\Controller;
use Think\Controller;
class AdminController extends AdminCommonController{
    public function index(){
    	$this->assign('articleNum',D('Article')->countArticle());
    	$this->assign('typeNum', D('Article')->countType());
    	$this->assign('artcileList', D('Article')->articleList(0));
        $this->assign('title','Main');
        $this->assign('mark','main');
        $this->display();
    }
}