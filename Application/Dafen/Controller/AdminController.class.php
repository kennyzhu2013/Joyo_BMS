<?php
namespace Dafen\Controller;
use Think\Controller;
class AdminController extends Controller {
	  //登录默认打分页面..
    public function index(){
    	$this->display();
    }
    
    //授权...
    public function adminlogin(){
    	$this->display();
    }
    	
    //获取json结果
    public function gettable(){	
    	//模板变量赋值
    	//获取名字..
    	$username = session('username';
    	if ($username != ''){
    		//get所有分数..
    		$pingfenResult = D("Pingfen")->getPingjunfen();
    		
    		//结果转为json...
	    	$this->assign('articleNum',D('Article')->countArticle());
	    	$this->assign('typeNum', D('Article')->countType());
	    	$this->assign('artcileList', D('Article')->articleList(0)); //0为全部文章
        $this->assign('title','Main');
        $this->assign('mark','main');
        $this->display();
    	}
    	else {
    	 	$this->error('Username expired');
    	}	
    }
    /*
    public function about(){
    	$this->assign('title', 'About');
    	$this->assign('mark', 'about');
    	$this->display();
    }*/
}