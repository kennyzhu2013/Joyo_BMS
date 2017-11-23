<?php
namespace Dafen\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('login');
    }

		//I方法是ThinkPHP众多单字母函数中的新成员，其命名来自于英文Input（输入），主要用于更加方便和安全的获取系统输入变量，可以用于任何地方，用法格式如下：
    //I('变量类型.变量名',['默认值'],['过滤方法'])
    public function login(){
        if(I('session.lt') == 'yes'){
            $this->redirect('Dafen/index');
        }else{
            $this->display(); //login to display...
        }
    }
    
    public function doLogin(){
        $username = I('post.username');
        $password = I('post.password');
        //1表示正确结果....
        if ($username != '' && $password != '') {
            if(D("UserLogin")->login($username,$password)){
                session('lt','yes');
                session('loginTime',time());
                session(array('name'=>'username','expire'=>3600), $username);
                $this->ajaxReturn(1);
            }else{
                session('lt','no');
                $this->ajaxReturn(2);
            }
        }else{
            $this->ajaxReturn(3);
        }
    }

    public function logout(){
        session('lt','no');
        $this->redirect('Index/login');
    }
}