<?php
namespace Admin\Controller;
use Think\Controller;
class ArticleController extends AdminCommonController{
    public function index(){
        $this->redirect('articleList');
    }

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

    //查询
    public function read(){
        $id = I('get.id',0);
        if($id==0){
            $this->error('Unkown param');
        }else{
            $article = D('Article')->read($id);
            $typeId = D('Article')->getTypeId($id);
            if($article){
                $this->assign('article', $article);
            }else{
                $this->error('Param error');
            }
        }
        $this->assign('typeId', $typeId);
        $this->assign('title', $article['title'].' - Modify');
        $this->display();
    }

    //修改
    public function modify(){
        $id = I('post.id',0);
        $title = I('post.title');
        $type = I('post.type');
        $content = I('post.content');
        if($id==0){
            $this->error('Unkown param');
        }else{
            if(D('Article')->modify($id,$title,$type,$content) > 0){
                $this->ajaxReturn(1);
            }else{
                $this->ajaxReturn(2);
            }
        }
    }

    //动态添加文章类型
    public function addType(){
        $typename = I('post.typename');
        $id = D('Article')->addType($typename);
        if($id){
            $this->ajaxReturn(array('id'=>$id,'typename'=>$typename));
        }else{
            $this->ajaxReturn(0);
        }
    }

    //获取文章列表
    public function articleList(){
        $typeId = I('get.type',0,'intval');
        $articleList = D('Article')->articleList($typeId);
        //获取标题
        $typeName = D('Article')->getTypeName($typeId);
        $typeTitle = $typeName == null ? 'All' : $typeName;
        $this->assign('articleList',$articleList);
        $this->assign('type',$typeId);
        $this->assign('mark','list');
        $this->assign('typeTitle',$typeTitle);
        $this->assign('title',$typeTitle . ' - Article list');
        $this->display();
    }
}