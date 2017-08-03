<?php 
namespace Admin\Model;
use Think\Model;
class AdminLoginModel{
    public function login($username,$password){
        $condition = array('username'=>$username);
        $user = M('user')->where($condition)->find();
        if ($user['password'] == $password) {
            return true;
        }else{
            return false;
        }
    }
}