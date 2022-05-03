<%--
  Created by IntelliJ IDEA.
  User: JianFeidao
  Date: 2022/4/17
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>我的借还日志</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            $('#head').load('reader_header');
        })
    </script>
</head>
<body>
<div id="head"></div>
<div class="table-responsive">
    <table class="table table-hover table-bordered ">
        <tr>
            <th>序号</th>
            <th>书名</th>
            <th>作者</th>
            <th>借出日期</th>
            <th>归还日期</th>
            <th>状态</th>
        </tr>
        <c:forEach items="${lendLogs}" var="lend" varStatus="statu">
            <tr>
                <td>${statu.count}</td>
                <td>${lend.name}</td>
                <td>${lend.author}</td>
                <td>${lend.lendDate}</td>
                <td>${lend.backDate}</td>
                <c:if test="${empty lend.backDate}">
                <td><a href="returnBook2?bookId=${lend.bookId}" class="btn btn-danger btn-sm">归还</a></td>
                </c:if>
                <c:if test="${!empty lend.backDate}">
                <td><button class="btn btn-success btn-sm">已还</button></td>
                </c:if>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
