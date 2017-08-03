<?php
namespace Admin\Controller;
use Think\Controller;
class ArticleController extends AdminCommonController{
    //添加
    public function add(){
        $this->assign('mark','add');
        $this->assign('title','Write New');
        $this->display();
    }

    //提交
    public function up(){
        $title   = I('post.title');
        $type    = I('post.type');
        $content = I('post.content');
        if($title != '' && $type != '' && $content != ''){
            if(D('Article')->up($title,$type,$content)){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(2);
            }
        }else{
            $this->ajaxReturn(3);
        }
    }

    //删除
    public function del(){
        $id = I('get.id',0);
        if($id==0){
            $this->error('Unkown param');
        }else{
            if(D('Article')->del($id)){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(2);
            }
        }
    }

    //获取文章列表
    public function articleList(){
        $typeId = I('get.type',0,'intval');
        $articleList = D('Article')->articleList($typeId);
        $this->assign('articleList',$articleList);
        $this->assign('mark','list');
        $this->assign('title','Article List');
        $this->display();
    }
}