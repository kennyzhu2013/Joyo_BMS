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
    	//
    	$this->display();
    }
    	
    //获取ajax - json结果
    public function gettable(){	
    	//模板变量赋值
    	//获取名字..
    	$username = session('username');
    	if ($username != ''){
    		//get所有分数..
    		$pingfen = D("Pingfen")->getPingjunfen();
    		
    		//ho '不统计多维数组：'.count($arr,0);count计算数组长度
    		//控制器中：echo count($arr)
				//模板中：{$arr | count}
				//构造json数据..
    		$returnResult["code"] = 0;
    		$returnResult["msg"] = "success";
    		$returnResult["count"] = count($pingfen, 0);
    		$returnResult["data"] = $pingfen;
    		//结果转为json...
	    	//$this->assign('articleNum',D('Article')->countArticle());
	    	//$this->assign('typeNum', D('Article')->countType());
	    	//$this->assign('artcileList', D('Article')->articleList(0)); //0为全部文章
        //$this->assign('title','Main');
        //$this->assign('mark','main');
        
        //直接输出..
        echo json_encode($returnResult);
        //$this->display();
    	}
    	else {
    		//no json 格式...
    	 	$this->error('Username expired');
    	}	
    }
    
    //返回json结果...
    /*
    public function getcount($count){
		echo json_encode(array("success" => true,
								"code"=> 200,
								"msg" => "success",
								"obj"=> null,
								"map"=> null,
								"list"=> null
							   )
						);


    }
    /*
    public function about(){
    	$this->assign('title', 'About');
    	$this->assign('mark', 'about');
    	$this->display();
    }*/
}