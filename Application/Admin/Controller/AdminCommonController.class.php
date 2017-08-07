<?php 
namespace Admin\Controller;
use Think\Controller;
class AdminCommonController extends Controller{
    public function _initialize(){
        $loginTime = session('loginTime');
        if(I('session.lt') == 'no' || I('session.lt') == '' || I('session.lt') == null){
            $this->redirect('Index/login');
<<<<<<< HEAD
=======
        }
        if(time()-$loginTime > 7200){
            session('lt','no');
            $this->redirect('Index/login');
>>>>>>> fc540f31316ef667cc979ec4ebacc6b861a0a1fa
        }
        $this->assign('typeList',D('Article')->typeList());
    }
}