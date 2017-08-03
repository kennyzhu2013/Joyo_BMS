<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo ($title); ?></title>
<link rel="shortcut icon" href="/joyo_bms/public/Admin/images/favicon.ico" />
<link rel="stylesheet" href="/joyo_bms/public/Admin/css/layui.css">
<link rel="stylesheet" href="/joyo_bms/public/Admin/css/style.css">
<link rel="stylesheet" href="/joyo_bms/public/Admin/css/editormd.css">
<script src="/joyo_bms/public/Admin/js/jquery.js"></script>
<script src="/joyo_bms/public/Admin/js/layui.js"></script>
<script type="text/javascript">
 var think   = '/joyo_bms/Admin';
 var img     = '/joyo_bms/public/Admin/images';
 var pic     = '__pic__';
</script>
</head>
<body>
<div class="well-nav">
    <ul class="layui-nav" lay-filter="nav">
        <li class="layui-nav-item <?php if(($mark) == "main"): ?>layui-this<?php endif; ?>"><a href="<?php echo U('Admin/index');?>"><i class="layui-icon">&#xe638;</i>&emsp;Main</a></li>
        <li class="layui-nav-item <?php if(($mark) == "list"): ?>layui-this<?php endif; ?>">
            <a href="<?php echo U('Article/articleList');?>"><i class="layui-icon">&#xe63c;</i>&emsp;Article</a>
            <dl class="layui-nav-child">
                <?php if(is_array($typeList)): $i = 0; $__LIST__ = $typeList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><dd><a href="<?php echo U('Article/articleList',array('type'=>$vo['id']));?>"><?php echo ($vo["typename"]); ?></a></dd><?php endforeach; endif; else: echo "" ;endif; ?>
            </dl>
        </li>
        <li class="layui-nav-item <?php if(($mark) == "add"): ?>layui-this<?php endif; ?>"><a href="<?php echo U('Article/add');?>"><i class="layui-icon">&#xe608;</i>&emsp;Write New</a></li>
        <li class="layui-nav-item"><a href=""><i class="layui-icon">&#xe612;</i>&emsp;About</a></li>
        <li class="layui-nav-item"><a href="<?php echo U('Index/logout');?>"><i class="layui-icon">&#xe64d;</i>&emsp;Logout</a></li>
    </ul>
</div>
<script>
layui.use('element', function(){
    var element = layui.element();
});
</script>

    <div class="well-main">
        <table class="layui-table">
            <thead>
                <tr>
                    <th width="60">Id</th>
                    <th width="400">Title</th>
                    <th>Intro</th>
                    <th width="200">Date</th>
                    <th width="200">Operation</th>
                </tr>
            </thead>
            <tbody>
                <?php if(is_array($articleList)): $i = 0; $__LIST__ = $articleList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($vo["id"]); ?></td>
                        <td><?php echo ($vo["title"]); ?></td>
                        <td><?php echo ($vo["intro"]); ?></td>
                        <td><?php echo ($vo["date"]); ?></td>
                        <td><input cid="<?php echo ($vo["id"]); ?>" class="mod layui-btn layui-btn-normal" type="button" value="Modify"> <input cid="<?php echo ($vo["id"]); ?>" class="del layui-btn layui-btn-danger" type="button" value="Delete"></td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <script>
                    $('.del').click(function() {
                        layui.use('layer', function(){var layer = layui.layer;});
                        var id = $(this).attr('cid');
                        var url = think+'/Article/articleList.html';
                        $.ajax({
                            type:'GET',
                            url:think+'/Article/del.html',
                            data:{
                                id:id
                            },
                            success:function (data) {
                                switch (data) {
                                    case 1:
                                        layer.msg('Delete success');
                                        setTimeout('window.location.href = "'+url+'"',1000);
                                        break;
                                    case 2:
                                        layer.msg('Delete error,try again later,Please');
                                        break;
                                    default:
                                        layer.msg('Undefined error');
                                        break;
                                }
                            }
                        });
                    });
                </script>
            </tbody>
        </table>
    </div>

<div class="footer">
    footer
</div>
</body>
</html>