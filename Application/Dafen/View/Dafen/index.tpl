<extend name="Public/common" />
<block name="main">
<H1 style="text-align: center;margin: 20px auto;font-size: 20px;">评委打分</H1>

<form class="layui-form" action="" style="width:360px;" target="nm_iframe">
<div class="layui-form-item">
    <label class="layui-form-label">邀请码</label>
    <div class="layui-input-block">
      <input type="text" id="yqm" name="yaoqingma" required  lay-verify="required" placeholder="请输入邀请码" autocomplete="off" class="layui-input">
    </div>
</div>
  <div class="layui-form-item">
    <label class="layui-form-label">打分对象</label>
    <div class="layui-input-block">
      <select name="obj" lay-verify="required">
        <option value=""></option>
        <option value="1">周锡飞</option>
        <option value="2">柴美娟</option>
        <option value="3">邢伟</option>
        <option value="4">张兆英</option>
        <option value="5">李可依</option>
        <option value="6">顾飞飞</option>
        <option value="7">夏至瑶</option>
        <option value="8">路英华</option>
      </select>
    </div>
  </div>

  <div class="pingfen">
  <div class="layui-form-item">
    <label class="layui-form-label">教学设计</label>
    <div class="layui-input-block jiaoxue">
      <select name="jiaoxue" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right">最高分：40</p>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">内容呈现</label>
    <div class="layui-input-block neirong">
      <select name="neirong" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right" >最高分：25</p>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">技术应用</label>
    <div class="layui-input-block jishu">
      <select name="jishu" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right">最高分：25</p>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label chuangxin">创新与实用</label>
    <div class="layui-input-block chuangxin">
      <select name="chuangxin" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right">最高分：10</p>
    </div>
  </div>
  </div>

<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset"  class="layui-btn layui-btn-primary">重置</button>
    </div>
</div>

</form>
    <iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
<script>
'use strict';
$(function () {
    for (var i = 1; i <= 40; i++) {
        $(".jiaoxue select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 25; i++) {
        $(".neirong select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 25; i++) {
        $(".jishu select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 10; i++) {
        $(".chuangxin select").append('<option value="' + i + '">' + i + '</option>');
    }
});

//Demo
layui.use('form', function(){
    var form = layui.form();

    //监听提交
    form.on('submit(formDemo)', function (data) {
        var cmd = data.field;
        //layer.msg(cmd);
        $.ajax({
            url: "request.ashx?flag="+Math.random(),
            type: "POST",
            data: cmd,
            success: function (res) {
                alert(res);
            },
            error: function (e) {
                layer.alert("发生未知错误："+e.status);
            }
        });
        return false;
    });
});
</script>
</block>