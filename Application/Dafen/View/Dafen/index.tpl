<extend name="Public/common" />
<block name="main">
<H1 style="text-align: center;margin: 20px auto;font-size: 20px;">评委打分,0分表示不修改</H1>

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
        <option value="yuanlin">袁琳</option>
        <option value="liuxiaojie">刘晓杰</option>
        <option value="kongshenkang">孔圣康</option>
        <option value="chenyanseng">陈炎森</option>
        <option value="xiongwei">熊伟 </option>
        <option value="zhangyun">张云</option>
        <option value="huxiaofei">胡啸飞</option>
        <option value="jinfeilai">金飞来</option>
        <option value="wenjiangpeng">翁江鹏</option>
        <option value="wukai">吴凯</option>
        <option value="fengjizhi">冯纪炽</option>
        <option value="liyuan">李源</option>
        <option value="liulianzi">刘连子</option>
        <option value="maxiaokai">马晓凯</option>
        <option value="chenlong">陈龙</option>
        <option value="chenxiuhong">陈秀红</option>
      </select>
    </div>
  </div>

  <div class="pingfen">
  <div class="layui-form-item">
    <label class="layui-form-label">个人业绩</label>
    <div class="layui-input-block yeji">
      <select name="yeji" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right">最高分：30</p>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">知识分享</label>
    <div class="layui-input-block fenxiang">
      <select name="fenxiang" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right" >最高分：5</p>
    </div>
  </div>
    <div class="layui-form-item">
    <label class="layui-form-label">技术答辩</label>
    <div class="layui-input-block dabian">
      <select name="dabian" lay-verify="required">
        <option value=""></option>
      </select>
        <p align="right">最高分：30</p>
    </div>
  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label teamwork">团队提升</label>
	    <div class="layui-input-block teamwork">
	      <select name="teamwork" lay-verify="required">
	        <option value=""></option>
	      </select>
	        <p align="right">最高分：5</p>
	    </div>
	  </div>
	  <div class="layui-form-item">
	    <label class="layui-form-label">技术方案</label>
	    <div class="layui-input-block fangan">
	      <select name="fangan" lay-verify="required">
	        <option value=""></option>
	      </select>
	        <p align="right">最高分：30</p>
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
//取值范围...
'use strict';
$(function () {
    for (var i = 1; i <= 30; i++) {
        $(".yeji select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 5; i++) {
        $(".fenxiang select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 30; i++) {
        $(".dabian select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 5; i++) {
        $(".teamwork select").append('<option value="' + i + '">' + i + '</option>');
    }
    for (var i = 1; i <= 5; i++) {
        $(".fangan select").append('<option value="' + i + '">' + i + '</option>');
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
            url: "{:U('Dafen/upscore')}",
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