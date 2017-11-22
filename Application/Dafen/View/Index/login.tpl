<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="__css__/layui.css">
    <link rel="stylesheet" href="__css__/style.css">
    <script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
    <script src="__js__/layui.js"></script>
    <script type="text/javascript">
     var think   = '__MODULE__';
     var img     = '__img__';
     var pic     = '__pic__';
    </script>
    <title>Login - Dafen</title>
</head>
<body>
    <div class="loginform">
        <div class="welcome">Welcome to Pingfen-Page! <i class="layui-icon">&#xe620;</i></div>
        <form class="layui-form" action="{:U('Index/doLogin')}" method="post">
            <div class="layui-form-item">
                    <input type="text" name="username" id="username" required  lay-verify="required"  placeholder="Input your username" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-item">
                    <input type="password" name="password" id="password" required  lay-verify="required"  placeholder="Input your password" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-item">
                    <input id="well-submit-btn" class="layui-btn" type="button" value="Login">
                    <input class="layui-btn layui-btn-primary" type="reset" value="Reset">
            </div>
            <span class="poweredBy">Powered By wellCh4n from China</span>
        </form>
        <script src="__js__/ajaxSubmit.js"></script>
    </div>
</body>
</html>