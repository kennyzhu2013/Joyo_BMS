<?php 
namespace Dafen\Model;
use Think\Model;
class PingfenModel{
    //提交评论分数...
    public function up($id,$yeji,$fenxiang,$dabian,$teamwork,$fangan,$yid){
        $pingfenResult = M('pingfen');
        $data['username']   = $id;
        $data['yeji']  = $yeji;
        $data['fenxiang']   = $fenxiang;;
        $data['dabian'] = $dabian;
        $data['teamwork'] = $teamwork;
        $data['fangan'] = $fangan;
        $data['yusername'] = $yid;
        $data['zongfen'] = $yeji + $fenxiang + $dabian + $teamwork + $fangan;
        $addstat = $pingfenResult->add($data);
        if ($addstat == false) {
            return false;
        }else{
            return true;
        }
    }

    //删除
    public function del($uid,$yid){
        $pingfenResult = M('article');
        //$delstat = $article->delete($id);
        $delstat = $pingfenResult->where("username=%s and yusername=%s",array($uid, $yid))->delete();
        if($delstat == false){
            return false;
        }else{
            return true;
        }
    }

    //查询
    public function read($uid,$yid){
        $pingfenResult = M('pingfen')->where("username=%s and yusername=%s",array($uid, $yid))->find();
        return $pingfenResult;
    }
    
    //查询所有平均分...
    // DataTable tb = SQLHelper.GetTable("select uid,Round(convert(float,sum(zongfen)-max(zongfen)-min(zongfen))/(count(*)-2),2) as mark,max(zongfen) as zuida from pingfen group by uid having count(*)>2");
    public function getPingjunfen(){
        $pingfenResult = M('pingfen')->field('username, round(convert(sum(zongfen)/count(*), float),2) as pingjunfen')->group('username')->select();
        return $pingfenResult;
    }

    //修改
    public function modify($id,$yeji,$fenxiang,$dabian,$teamwork,$fangan,$yid){
        $pingfenResult = M('pingfen');
        $data['username']   = $id;
        $data['yeji']  = $yeji;
        $data['fenxiang']   = $fenxiang;;
        $data['dabian'] = $dabian;
        $data['teamwork'] = $teamwork;
        $data['fangan'] = $fangan;
        $data['yusername'] = $yid;
        $data['zongfen'] = $yeji + $fenxiang + $dabian + $teamwork + $fangan;
        $modifystat = $pingfenResult->where("username=%s and yusername=%s",array($uid, $yid))->save($data);
        return $modifystat;
    }

    //动态添加
    /*
    public function addType($typename){
        $articleType = M('articletype');
        $data['typename'] = $typename;
        $addstat = $articleType->add($data);
        return $addstat;
    }*/

    /**
     * @param  int $id 文章id
     * @return int     文章类型id
     *//*
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
    }*/
}