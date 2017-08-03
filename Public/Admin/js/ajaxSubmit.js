$('.loginform input').keydown(function(e) {
    if(e.keyCode == 13){
        $('#well-submit-btn').click();
    }
});
$('#well-submit-btn').click(function() {
    var username = $('#username').val();
    var password = $('#password').val();
    var url = think+'/Admin/index.html';
    $.ajax({
        type:'POST',
        url:think+'/Index/doLogin.html',
        data:{
            username:username,
            password:password
        },
        success:function (data) {
            layui.use('layer', function(){ var layer = layui.layer;});
            switch (data) {
                case 1:
                    layer.msg('Enter System'+'<i class="layui-icon">&#xe610;</i>');
                    setTimeout('window.location.href = "'+url+'"',1000);
                    break;
                case 2:
                    layer.msg('Username or Password is wrong');
                    break;
                case 3:
                    layer.msg('Username or Password is null');
                    break;
                default:
                    layer.msg('Undefined error');
                    break;
            }
        }
    });
});

$('#submitArticle').click(function() {
    layui.use('layer', function(){var layer = layui.layer;});
    var title   = $('#title').val();
    var type    = $('#type').val();
    var content = testEditor.getHTML();
    $.ajax({
        type:'POST',
        url:think+'/Article/up',
        data:{
            title:title,
            type:type,
            content:content,
        },
        success:function (data) {
            switch (data) {
                case 1:
                    layer.msg('Submit success');
                    break;
                case 2:
                    layer.msg('Submit error , try again later,Please');
                    break;
                case 3:
                    layer.msg('Some input is null');
                    break;
                default:
                    layer.msg('Undefined error');
                    break;
            }
        }
    });
});