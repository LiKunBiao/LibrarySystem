<%--
  Created by IntelliJ IDEA.
  User: JianFeidao
  Date: 2022/4/14
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal">
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="form-group">
        <label for="oldPassword" class="col-sm-2 control-label">原密码</label>
        <div class="col-sm-9">
            <input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="请输入原密码">
        </div>
    </div>
    <div class="form-group">
        <label for="newPassword" class="col-sm-2 control-label">新密码</label>
        <div class="col-sm-9">
            <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="请输入新密码">
        </div>
    </div>
    <div class="form-group">
        <label for="rptPassword" class="col-sm-2 control-label">确认新密码</label>
        <div class="col-sm-9">
            <input type="password" class="form-control" id="rptPassword" placeholder="请再次输入新密码">
        </div>
    </div>
</form>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-9">
        <input type="button" id="resetButton" class="btn btn-success" value="提交">
        &nbsp;&nbsp;
        <a href="/admin_books"><input type="button" class="btn btn-success" value="返回"></a>
    </div>
</div>
<script>
    $('#resetButton').click(function() {
        if ($("#oldPassword").val() == '' || $("#newPassword").val() == '' || $("#rptPassword").val() == ''){
            alert("请填入完整用户信息！");
            return false;
        } else if($("#oldPassword").val() == $("#newPassword").val()) {
            alert("新密码和旧密码不可以相同！")
            return false;
        } else if($("#newPassword").val() != $("#rptPassword").val()) {
            alert("两次新密码输入不一致！")
            return false;
        }
        else
        {
            $.ajax({
                type: "POST",
                url:"adminResetPassword",
                data:{
                    "oldPassword":$("#oldPassword").val(),
                    "newPassword":$("#newPassword").val()
                },
                dataType:"json",
                error: function(request) {
                    alert("原密码错误！");
                },
                success: function(data) {
                    //接收后台返回的结果
                    if(data.stateCode.trim() == "1")//1表示添加成功
                    {
                        alert("密码修改成功！");
                    }
                }
            });
        }
    })
</script>
</body>
</html>

