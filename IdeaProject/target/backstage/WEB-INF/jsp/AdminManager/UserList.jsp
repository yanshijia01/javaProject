<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/22
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <%--<script type="application/javascript">--%>
        <%--var table3 = $("#exampleTableToolbar3");--%>

        <%--table3.bootstrapTable({--%>
            <%--url: "/system/getAllProblem",//具体请求地址--%>
            <%--method: 'post',//请求方式--%>
            <%--cache: false,                      //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）--%>
            <%--pagination: true,                  //是否显示分页（*）--%>
            <%--search: !0,//是否开启搜索框--%>
            <%--showRefresh: !0,//是否显示刷新框--%>
            <%--sidePagination: "server",          //分页方式：client客户端分页，server服务端分页（*）--%>
            <%--queryParams: queryParams,//传递参数（*）--%>
            <%--pageSize: 10,                      //每页的记录行数（*）--%>
            <%--showColumns: !0,//是否显示columns按钮--%>
            <%--toolbar: "#exampleToolbar",//对用的toolbar--%>
            <%--iconSize: "outline",--%>
            <%--icons: {refresh: "glyphicon-repeat", columns: "glyphicon-list"},//对应按钮对应的字体图标--%>
            <%--uniqueId: "ID"//主键id--%>
        <%--});--%>

        <%--//题目表参数传递--%>
        <%--function queryParams(params) {--%>
            <%--return {--%>
                <%--limit: params.limit,//每页数据条数--%>
                <%--offset: params.offset,//当前页偏移--%>
                <%--order: params.order,//排序--%>
                <%--ordername: params.sort,//需要排序的字段--%>
                <%--search: params.search//搜索的字段--%>
            <%--};--%>
        <%--}--%>
    <%--</script>--%>
    <title>用户列表</title>
</head>
<body>
<table border="1">
    <tr>
        <td>用户名</td>
        <td>密码</td>
    </tr>
    <c:forEach var="item" items="${list}">
        <tr>
            <td>${item.username}</td>
            <td>${item.password}</td>
        </tr>
    </c:forEach>
</table>
<%--<div class="wrapper wrapper-content">--%>
    <%--<div class="row">--%>
        <%--<div class="col-sm-12">--%>
            <%--<div class="animated fadeInRightBig">--%>
                <%--<!--添加内容区域-->--%>
                <%--<div class="ibox-content">--%>
                    <%--<h4 class="example-title">用户列表</h4>--%>
                    <%--<div class="btn-group hidden-xs" role="group" id="exampleToolbar">--%>
                        <%--<button type="button" class="btn btn-outline btn-default">--%>
                            <%--<i class="glyphicon glyphicon-plus" aria-hidden="true"></i>--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <%--<!--添加题目表-->--%>
                    <%--<table id="exampleTableToolbar3" data-toggle="table">--%>
                        <%--<thead>--%>
                        <%--<tr>--%>
                            <%--<!--data-field和你从数据库取出来的pojo类名相对应-->--%>
                            <%--<th data-field="id" data-sortable="true">ID</th>--%>
                            <%--<th data-field="pro_name">标题</th>--%>
                            <%--<th data-field="pro_num">数据组数</th>--%>
                            <%--<th data-field="pro_path">数据路径</th>--%>
                            <%--<th data-field="cate_id">类别</th>--%>
                            <%--<th data-field="username">上传用户</th>--%>
                            <%--<th data-field="credits" data-sortable="true">积分</th>--%>
                            <%--<th data-field="pro_pass" data-sortable="true">提交次数</th>--%>
                            <%--<th data-field="pro_pass" data-sortable="true">通过次数</th>--%>
                            <%--<th data-field="start_time">加入时间</th>--%>
                            <%--&lt;%&ndash;这里是用来编辑的,可以添加编辑,删除等按钮&ndash;%&gt;--%>
                            <%--<th data-field="action" data-formatter="actionFormatter" data-events="actionEvents">Action--%>
                            <%--</th>--%>
                        <%--</tr>--%>
                        <%--</thead>--%>
                    <%--</table>--%>
                <%--</div>--%>
                <%--<!--添加题目表结束-->--%>

            <%--</div>--%>
        <%--</div>--%>
</body>
</html>
