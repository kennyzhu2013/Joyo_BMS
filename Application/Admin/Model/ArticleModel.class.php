<?php 
namespace Admin\Model;
use Think\Model;
class ArticleModel{
    public function up($title,$type,$content){
        $article = M('article');
        $data['title']   = $title;
        $data['typeId']  = $type;
        $data['intro']   = mb_substr($content, 0,120,'utf-8');
        $data['content'] = $content;
        $data['date']    = date("Y-m-d H:i:s");
        $addstat = $article->add($data);
        if ($addstat == false) {
            return false;
        }else{
            return true;
        }
    }

    public function del($id){
        $article = M('article');
        $delstat = $article->delete($id);
        if($delstat == false){
            return false;
        }else{
            return true;
        }
    }

    public function typeList(){
        $articleType = M('articletype')->field('id,typename')->select();
        return $articleType;
    }

    public function articleList($typeId){
        $condition = $typeId == 0 ? '':array('typeId'=>$typeId);
        $articleList = M('article')->field('id,title,intro,date')->where($condition)->select();
        return $articleList;
    }
}