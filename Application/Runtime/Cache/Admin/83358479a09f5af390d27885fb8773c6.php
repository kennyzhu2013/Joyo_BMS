<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/joyo_bms/public/Admin/css/layui.css">
    <link rel="stylesheet" href="/joyo_bms/public/Admin/css/style.css">
    <script src="http://libs.baidu.com/jquery/1.8.3/jquery.min.js"></script>
    <script src="/joyo_bms/public/Admin/js/layui.js"></script>
    <script type="text/javascript">
     var think   = '/joyo_bms/Admin';
     var img     = '/joyo_bms/public/Admin/images';
     var pic     = '__pic__';
    </script>
    <title>Login - JoyoBMS</title>
</head>
<body>
    <div class="loginform">
        <div class="welcome">Welcome to JoyoBMS Alpha <i class="layui-icon">&#xe620;</i></div>
        <form class="layui-form" action="<?php echo U('Index/doLogin');?>" method="post">
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
        <script src="/joyo_bms/public/Admin/js/ajaxSubmit.js"></script>
    </div>
</body>
</html>