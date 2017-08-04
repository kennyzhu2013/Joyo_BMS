<?php 
namespace Admin\Model;
use Think\Model;
class ArticleModel{
    //提交
    public function up($title,$type,$content){
        $article = M('article');
        $data['title']   = $title;
        $data['typeId']  = $type;
        $data['intro']   = mb_substr($content, 0,40,'utf-8');
        $data['content'] = $content;
        $data['date']    = date("Y-m-d H:i:s");
        $addstat = $article->add($data);
        if ($addstat == false) {
            return false;
        }else{
            return true;
        }
    }

    //删除
    public function del($id){
        $article = M('article');
        $delstat = $article->delete($id);
        if($delstat == false){
            return false;
        }else{
            return true;
        }
    }

    //查询
    public function read($id){
        $article = M('article')->field('id,typeId,title,content,date')->where(array('id'=>$id))->find();
        return $article;
    }

    //修改
    public function modify($id,$title,$type,$content){
        $article = M('article');
        $data['title'] = $title;
        $data['typeId']  = $type;
        $data['content'] = $content;
        $data['intro']   = mb_substr($content, 0,40,'utf-8');
        $data['date']    = date("Y-m-d H:i:s");
        $modifystat = $article->where(array('id'=>$id))->save($data);
        return $modifystat;
    }

    //动态添加文章类型
    public function addType($typename){
        $articleType = M('articletype');
        $data['typename'] = $typename;
        $addstat = $articleType->add($data);
        return $addstat;
    }

    /**
     * @param  int $id 文章id
     * @return int     文章类型id
     */
    public function getTypeId($id){
        $typeId = M('article')->field('typeId')->where(array('id'=>$id))->find();
        return $typeId['typeid'];
    }

    public function getTypeName($id){
        $typeName = M('articletype')->field('typename')->where(array('id'=>$id))->find();
        return $typeName['typename'];
    }

    //获取分类列表
    public function typeList(){
        $articleType = M('articletype')->field('id,typename')->select();
        return $articleType;
    }

    //获取分类数量
    public function countType(){
         $typeNum = M('articletype')->count('id');
         return $typeNum;
    }

    //获取文章数量
    public function countArticle(){
        $articleNum = M('article')->count('id');
        return $articleNum;
    }

    //获取文章列表
    public function articleList($typeId){
        //参数为0时 查询所有文章
        $condition = $typeId == 0 ? '' : array('typeId'=>$typeId);
        $articleList = M('article')->field('id,typeId,title,intro,date')->where($condition)->order('date DESC')->select();
        return $articleList;
    }
}