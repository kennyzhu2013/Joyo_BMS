<?php
namespace Admin\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display('login');
    }

    public function login(){
        if(I('session.lt') == 'yes'){
            $this->redirect('Admin/index');
        }else{
            $this->display();
        }
    }
    
    public function doLogin(){
        $username = I('post.username');
        $password = I('post.password');
        if ($username != '' && $password != '') {
            if(D("AdminLogin")->login($username,$password)){
                session('lt','yes');
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