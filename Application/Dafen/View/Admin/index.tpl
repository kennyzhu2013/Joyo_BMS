<extend name="Public/common" />
<block name="main">
<H1 style="text-align: center;margin: 20px auto;font-size: 20px;">后台管理</H1>

  <div class="layui-form-item" style="width:340px;">
    <label class="layui-form-label">授权码(被评候选人姓名拼音)</label>
    <div class="layui-input-inline">
      <input type="password"  name="password" required lay-verify="required" placeholder="请输入授权码" autocomplete="off" class="layui-input">
    </div>
  </div>

<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn shouquan" lay-submit lay-filter="formDemo">授权</button>
    </div>
</div>

<div class="tool" style="display:none;">
  <div class="layui-form-item">
    <label class="layui-form-label">选手</label>
    <div class="layui-input-block">
      <select name="obj" lay-verify="required" style="height:35px;">
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
	<div style="margin-left:50px;">
    <!--<button class="layui-btn layui-btn-normal startfen">开启打分</button>
    <button class="layui-btn layui-btn-danger closefen">关闭打分</button>
    -->
    <button class="layui-btn layui-btn-primary lookfen">查看得分</button>
	</div>
</div>

<!--转义&apos;..-->
<table class="layui-table" lay-data="{height:315, url:'{:U(&apos;Admin/gettable&apos;)}', page:true, id:'test'}" lay-filter="test">
  <colgroup>
  </colgroup>
  <thead>
    <tr>
      <th>姓名</th>
      <th lay-data="{field:'username', width:150}">用户名</th>
      <th lay-data="{field:'pingjunfen', width:150, sort: true}">分数</th>
    </tr> 
  </thead>
  <tbody>
  </tbody>
</table>
<!--<script type="text/javascript" src="__js__/admin.js"></script>-->
<script>
        //处理授权(管理员帐号),TODO..
        layui.use('element', function(){
  					var element = layui.element;;

            //监听授权
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
        
  
});
</script>
</block>