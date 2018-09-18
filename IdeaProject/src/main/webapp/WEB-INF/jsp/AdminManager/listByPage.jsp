<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="/js/layui-v2.0.2/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/js/layui-v2.0.2/css/layui.css" media="all">
    <style type="text/css">
        <%--设置Table复选框位置不正的问题--%>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<div class="demoTable">
    搜索ID：
    <div class="layui-inline">
        <input class="layui-input" name="id" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
    <button class="layui-btn" data-type="getCheckData">批量删除</button>
    <button class="layui-btn" data-type="templateDownLoad">模板下载</button>
    <button class="layui-btn" data-type="ExportData">导出数据</button>
    <button class="layui-btn" data-type="ImportData">导入数据</button>
    <button class="layui-btn" data-id="4" id="uploadExcel">上传文件</button>
</div>

<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script>
    $(function () {
        layui.use('table', function () {
            var table = layui.table;
            //方法级渲染
            table.render({
                elem: '#LAY_table_user'
                , url: '/admin/getdata'
                , method: "POST" //提交方式，相应的接收方法也应该设置为POST
                , page: true
                , limit: 20
                , limits: [10, 20, 30, 50]
                , groups: 5
                , cols:
                    [[
                        {checkbox: true, fixed: true}
                        , {field: 'id', title: 'ID', width: 80, sort: true, fixed: true}
                        , {field: 'username', title: '用户名', width: 80}
                        , {field: 'password', title: '密码', width: 300}
                        , {field: 'gender', title: '性别', width: 80, sort: true}
                        , {field: 'real_name', title: '真实姓名', width: 100}
                        , {field: 'phone', title: '联系电话', width: 100}
                        , {field: 'address', title: '地址', sort: true, width: 80}
                        , {field: 'QQ', title: 'QQ', sort: true, width: 80}
                        , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
                    ]]
                , id:
                    'testReload'
            })
            ;

            var $ = layui.$, active = {
                reload: function () {
                    var demoReload = $('#demoReload');
                    //执行重载
                    table.reload('testReload', {
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                        , where: {
                            //查询条件参数
                            keystr: demoReload.val()
                        }
                    });
                }
                , getCheckData: function () {
                    //复选框全选
                    var checkStatus = table.checkStatus('testReload')
                        , data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                }, templateDownLoad: function () {
                    //下载模板
                    window.location.href = "/template/template.xlsx";
                }, ExportData: function () {
                    //导出数据
                    var status = "1";
                    window.location.href = "/admin/exportExcel?status=" + status;

                }
                // , ImportData: function () {
                //     //导入数据
                //     layer.alert("导入数据");
                // }
            };

            $('.demoTable .layui-btn').on('click', function () {
                var type = $(this).data('type');
                active[type] ? active[type].call(this) : '';
            });

            //监听工具条
            table.on('tool(user)', function (obj) {
                var data = obj.data;
                if (obj.event === 'detail') {
                    layer.msg('ID：' + data.id + ' 的查看操作');
                } else if (obj.event === 'del') {
                    layer.confirm('真的删除行么', function (index) {
                        obj.del();
                        layer.close(index);
                    });
                } else if (obj.event === 'edit') {
                    //编辑行
                    //layer.alert('编辑行：<br>' + JSON.stringify(data));
                    layer.open({
                        type: 1
                        , content: $("#openDiv")
                        , area: ['700px', '760px']
                        , anim: 5
                        , fixed: true
                        , title: "弹出层的标题"
                    });
                }
            });
        });
    });
</script>
<script>
    //Demo
    layui.use(['form', 'element', 'upload'], function () {
        var form = layui.form;
        var element = layui.element;
        var upload = layui.upload;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg("提交信息：" + JSON.stringify(data.field));
            return false;
        });

        var uploadExcel = $("#uploadExcel").attr("data-id");

        //指定允许上传的文件类型
        uploadExcel = upload.render({
            elem: '#uploadExcel'
            , url: '/admin/upload'
            , title: '请选择Excel文件'
            , accept: 'file' //普通文件
            , multiple: false  //是否上传多文件
            , exts: "xls|xlsx"//允许上传的后缀文件
            //, headers: "multipart/form-data"
            , method: 'POST'
            , done: function (res) {
                //console.log(res);
                layui.alert(res);
            }
        });
    });
</script>

<div id="openDiv" style="display:none">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">输入框</label>
            <div class="layui-input-block">
                <input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码框</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">辅助文字</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">选择框</label>
            <div class="layui-input-block">
                <select name="city" lay-verify="required">
                    <option value=""></option>
                    <option value="0">北京</option>
                    <option value="1">上海</option>
                    <option value="2">广州</option>
                    <option value="3">深圳</option>
                    <option value="4">杭州</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">复选框</label>
            <div class="layui-input-block">
                <input type="checkbox" name="like[write]" title="写作">
                <input type="checkbox" name="like[read]" title="阅读" checked>
                <input type="checkbox" name="like[dai]" title="发呆">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">开关</label>
            <div class="layui-input-block">
                <input type="checkbox" name="switch" lay-skin="switch">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男">
                <input type="radio" name="sex" value="女" title="女" checked>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">文本域</label>
            <div class="layui-input-block">
                <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>