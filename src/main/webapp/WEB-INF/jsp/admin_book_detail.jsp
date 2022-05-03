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
    <title>《 ${book.name} 》</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            $('#head').load('admin_header');
        })
    </script>
</head>
<body>
<div id="head"></div>
<div class="col-xs-6 col-md-offset-3">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">《 ${book.name} 》</h3>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <tbody>
                <tr>
                    <th width="15%">书名</th>
                    <td>${book.name}</td>
                </tr>
                <tr>
                    <th>作者</th>
                    <td>${book.author}</td>
                </tr>
                <tr>
                    <th>出版社</th>
                    <td>${book.publish}</td>
                </tr>
                <tr>
                    <th>ISBN</th>
                    <td>${book.isbn}</td>
                </tr>
                <tr>
                    <th>简介</th>
                    <td>${book.introduction}</td>
                </tr>
                <tr>
                    <th>语言</th>
                    <td>${book.language}</td>
                </tr>
                <tr>
                    <th>价格</th>
                    <td>${book.price}</td>
                </tr>
                <tr>
                    <th>出版日期</th>
                    <td>${book.pubDate}</td>
                </tr>
                <tr>
                    <th>分类号</th>
                    <td>${book.classId}</td>
                </tr>
                <tr>
                    <th>数量</th>
                    <td>${book.number}</td>
                </tr>
                <tr>
                    <th>
                        <a href="/seleteBooks?page=${page}&size=${size}&name=${name}&author=${author}">
                            <input type="button" class="btn btn-success" value="返回"></a>
                    </th>
                    <td></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
