<extend name="Public/common" />
<block name="main">
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
                <volist name="articleList" id="vo">
                    <tr>
                        <td>{$vo.id}</td>
                        <td>{$vo.title}</td>
                        <td>{$vo.intro}</td>
                        <td>{$vo.date}</td>
                        <td><input cid="{$vo.id}" class="mod layui-btn layui-btn-normal" type="button" value="Modify"> <input cid="{$vo.id}" class="del layui-btn layui-btn-danger" type="button" value="Delete"></td>
                    </tr>
                </volist>
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
</block>