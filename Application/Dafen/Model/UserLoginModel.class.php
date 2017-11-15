<?php 
namespace Dafen\Model;
use Think\Model;
class UserLoginModel{
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