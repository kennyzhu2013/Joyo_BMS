<?php 
namespace Admin\Controller;
use Think\Controller;
class AdminCommonController extends Controller{
    public function _initialize(){
        if(I('session.lt') == 'no' || I('session.lt') == '' || I('session.lt') == null){
            $this->redirect('Index/login');
        }else{
            //empty
        }
        $this->assign('typeList',D('Article')->typeList());
    }
}
 ?>