<extend name="Public/common" />
<block name="main">
    <div class="well-main">
        <h1>All of {$typeTitle} Article</h1>
        <table class="layui-table" lay-even lay-skin="nob">
            <thead>
                <tr>
                    <th width="60">Id</th>
                    <th width="250">Title</th>
                    <th>Intro</th>
                    <th width="200">Date</th>
                    <th width="170">Operation</th>
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
                <script src="__js__/ajaxSubmit.js"></script>
            </tbody>
        </table>
    </div>
</block>