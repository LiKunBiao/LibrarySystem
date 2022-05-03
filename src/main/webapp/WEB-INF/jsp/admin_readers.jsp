<%--
  Created by IntelliJ IDEA.
  User: JianFeidao
  Date: 2022/4/13
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>读者管理</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            $('#head').load('admin_header');
        })
    </script>
    <style>
        .record{
            font-size: 20px;
            margin-left: 7px;
        }
    </style>
</head>
<body>
<div id="head"></div>
<div class="agency">
    <div class="table-responsive">
        <table class="table table-hover table-bordered ">
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>密码</th>
                <th>性别</th>
                <th>生日</th>
                <th>地址</th>
                <th>电话</th>
                <th>状态</th>
            </tr>
            <c:forEach items="${reads}" var="read" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${read.readId}</td>
                    <td>${read.password}</td>
                    <td>${read.sex}</td>
                    <td>${read.birth}</td>
                    <td>${read.address}</td>
                    <td>${read.phone}</td>
                    <td>
                        <c:if test="${read.isBan == 0}">
                            <button class="btn btn btn-success btn-sm" onclick="updateIsBan('${read.readId}','${read.isBan}')">正常</button>
                        </c:if>
                        <c:if test="${read.isBan == 1}">
                            <button class="btn btn btn-danger btn-sm" onclick="updateIsBan('${read.readId}','${read.isBan}')">封禁</button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
<script>
    function updateIsBan(readId, isBan) {
        $.ajax({
            type: "POST",
            url:"updateIsBan",
            data:{
                "username":readId,
                "isBan":isBan
            },
            dataType:"json",
            error: function(request) {
                alert("连接失败");
            },
            success: function(data) {
                //接收后台返回的结果
                if(data.stateCode.trim() === "1")//1表示登录成功
                {   //删除成功后刷新页面
                    window.location.href = "selectAllReader";
                }
            }
        });
    }
    $("#deleteSelectedbooks").click(function() {
        if(confirm("删除选中操作不可恢复，您确定删除吗？")) {
            //默认提交表单
        } else {
            $("#allBooks").submit(function() {//屏蔽表单提交
                return false;
            });
        }
    })
    $("#allSelect").click(function() {
        const cbs = $("input[name='id']")
        for(let i = 0; i < cbs.length; i++) {
            cbs[i].checked = this.checked;
        }
    })
</script>
</body>
</html>
