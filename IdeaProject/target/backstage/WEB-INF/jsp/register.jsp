<%--
  Created by IntelliJ IDEA.
  User: 86265
  Date: 2018/1/30
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册页面</title>
    <jsp:include page="common/common.jsp"/>
    <!--请在下方写此页面业务相关的脚本-->
    <script type="text/javascript" src="/js/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="/js/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="/js/jquery.validation/1.14.0/messages_zh.js"></script>
    <%--<script type="text/javascript">--%>
        <%--$(function(){--%>
            <%--$('.skin-minimal input').iCheck({--%>
                <%--checkboxClass: 'icheckbox-blue',--%>
                <%--radioClass: 'iradio-blue',--%>
                <%--increaseArea: '20%'--%>
            <%--});--%>

            <%--$("#form-admin-add").validate({--%>
                <%--rules:{--%>
                    <%--adminName:{--%>
                        <%--required:true,--%>
                        <%--minlength:4,--%>
                        <%--maxlength:16--%>
                    <%--},--%>
                    <%--password:{--%>
                        <%--required:true,--%>
                    <%--},--%>
                    <%--password2:{--%>
                        <%--required:true,--%>
                        <%--equalTo: "#password"--%>
                    <%--},--%>
                    <%--sex:{--%>
                        <%--required:true,--%>
                    <%--},--%>
                    <%--phone:{--%>
                        <%--required:true,--%>
                        <%--isPhone:true,--%>
                    <%--},--%>
                    <%--email:{--%>
                        <%--required:true,--%>
                        <%--email:true,--%>
                    <%--},--%>
                    <%--adminRole:{--%>
                        <%--required:true,--%>
                    <%--},--%>
                <%--},--%>
                <%--onkeyup:false,--%>
                <%--focusCleanup:true,--%>
                <%--success:"valid",--%>
                <%--submitHandler:function(form){--%>
                    <%--$(form).ajaxSubmit({--%>
                        <%--type: 'post',--%>
                        <%--url: "xxxxxxx" ,--%>
                        <%--success: function(data){--%>
                            <%--layer.msg('添加成功!',{icon:1,time:1000});--%>
                        <%--},--%>
                        <%--error: function(XmlHttpRequest, textStatus, errorThrown){--%>
                            <%--layer.msg('error!',{icon:1,time:1000});--%>
                        <%--}--%>
                    <%--});--%>
                    <%--var index = parent.layer.getFrameIndex(window.name);--%>
                    <%--parent.$('.btn-refresh').click();--%>
                    <%--parent.layer.close(index);--%>
                <%--}--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
    <%--<!--/请在上方写此页面业务相关的脚本-->--%>
</head>
<body>
<%--<form action="/user/doRegister" method="post">--%>
    <%--<table border="1px">--%>
        <%--<tr height="35px">--%>
            <%--<td width="150px">用户名</td>--%>
            <%--<td width="300px">--%>
                <%--<input type="text" name="username" id="username">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr height="35px">--%>
            <%--<td>密码</td>--%>
            <%--<td>--%>
                <%--<input type="text" name="password" id="password">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td colspan="2" align="center">--%>
                <%--<input type="submit" id="regist" value="注册"/>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</form>--%>
<article class="page-container">
    <form class="form form-horizontal" id="form-admin-add" action="/user/doRegister">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>初始密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off" value="" placeholder="密码" id="password" name="password">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" autocomplete="off"  placeholder="确认新密码" id="password2" name="password2">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>真实姓名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="请输入真实姓名" name="email" id="realName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <div class="radio-box">
                    <input name="sex" type="radio" id="sex-1" checked>
                    <label for="sex-1">男</label>
                </div>
                <div class="radio-box">
                    <input type="radio" id="sex-2" name="sex">
                    <label for="sex-2">女</label>
                </div>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" maxlength="11" placeholder="请输入手机号" id="phone" name="phone">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red"></span>QQ：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" maxlength="11" placeholder="QQ号码" id="QQ" name="QQ">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="@" name="email" id="email">
            </div>
        </div>
        <%--<div class="row cl">--%>
            <%--<label class="form-label col-xs-4 col-sm-3">角色：</label>--%>
            <%--<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">--%>
			<%--<select class="select" name="adminRole" size="1">--%>
				<%--<option value="0">超级管理员</option>--%>
				<%--<option value="1">总编</option>--%>
				<%--<option value="2">栏目主辑</option>--%>
				<%--<option value="3">栏目编辑</option>--%>
			<%--</select>--%>
			<%--</span> </div>--%>
        <%--</div>--%>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="" cols="" rows="" class="textarea"  placeholder="说点什么...100个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,100)"></textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
</body>
</html>