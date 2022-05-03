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
    <title>注册页面</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" id="addReader">
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div class="form-group">
        <label for="readId" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="readId" id="readId" placeholder="请输入用户名">
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="col-sm-2 control-label">密码</label>
        <div class="col-sm-9">
            <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <label for="rptPassword" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-9">
            <input type="password" class="form-control" id="rptPassword" placeholder="请确认密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label">性别</label>
        <div class="col-sm-9">
            <label class="radio-inline">
                <input type="radio" name="sex" id="man" value="男" checked="checked"> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" id="woman" value="女"> 女
            </label>
        </div>
    </div>
    <div class="form-group">
        <label for="birth" class="col-sm-2 control-label">生日</label>
        <div class="col-sm-9">
            <input type="date" class="form-control" name="birth" id="birth" placeholder="请输入生日">
        </div>
    </div>
    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">地址</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="address" id="address" placeholder="请输入地址">
        </div>
    </div>
    <div class="form-group">
        <label for="phone" class="col-sm-2 control-label">电话</label>
        <div class="col-sm-9">
            <input type="tel" min="0" class="form-control" name="phone" id="phone" placeholder="请输入电话">
        </div>
    </div>
</form>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-9">
        <input type="button" id="addButton" class="btn btn-success" value="注册">
        &nbsp;&nbsp;
        <a href="/"><input type="button" class="btn btn-success" value="返回"></a>
    </div>
</div>
<script>
    $('#addButton').click(function() {
        let i = $("#addReader").serialize();
        console.log(i);
        console.log($("input[name='sex']").val());
        if ($("#readId").val() == '' || $("#password").val() == '' || $("#rptPassword").val() == '' || $("#birth").val() == '' || $("#address").val() == '' || $("#phone").val() == ''){
            alert("请填入完整用户信息！");
            return false;
        } else if($("#password").val() != $("#rptPassword").val()) {
            alert("两次密码输入不一致")
            return false;
        }
        else
        {
            if (confirm("请确认输入数据是否有误，如无误请按确认键")) {
                $.ajax({
                    type: "POST",
                    url:"registerCheck",
                    data:$("#addReader").serialize(),
                    dataType:"json",
                    error: function(request) {
                        alert("用户名已存在！");
                    },
                    success: function(data) {
                        //接收后台返回的结果
                        if(data.stateCode.trim() == "1")//1表示添加成功
                        {
                            alert("用户添加成功！");
                        }
                    }
                });
            } else {
                //不做处理
            }
        }
    })
</script>
</body>
</html>

