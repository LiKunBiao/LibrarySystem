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
    <title>图书管理</title>
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
<div class="table-responsive">
    <div style="float: left"><!--左浮动-->
        <form class="form-inline" action="/seleteBooks" method="post">
            <div class="form-group">
                <input type="button" class="form-control" value="书名">
                <input type="text" class="form-control" name="name" placeholder="请输入书名" value="${name}">
            </div>
            <div class="form-group">
                <input type="button" class="form-control" value="作者">
                <input type="text" class="form-control" name="author" placeholder="请输入作者" value="${author}">
            </div>
            <button type="submit" class="btn btn-info">查询</button>
        </form>
    </div>
    <form action="/deleteSelectedbooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}&name=${name}&author=${author}" method="post">
        <div style="float: right;margin: 5px"><!--右浮动-->
            <button id="deleteSelectedbooks" type="submit" class="btn btn-danger">删除选中</button>
        </div>
        <table class="table table-hover table-bordered ">
            <tr>
                <th><input type="checkbox" id="allSelect"></th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>ISBN</th>
                <th>价格</th>
                <th>剩余数量</th>
                <th>详情</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageBooks.list}" var="book">
                <tr>
                    <td><input type="checkbox" name="id" value="${book.bookId}"></td>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.publish}</td>
                    <td>${book.isbn}</td>
                    <td>${book.price}</td>
                    <td>${book.number}</td>
                    <td>
                        <a class="btn btn-success btn-sm" href="admin_book_detail?bookId=${book.bookId}&page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                        &name=${name}&author=${author}" role="button">详情</a>
                    </td>
                    <td>
                        <a class="btn btn-warning btn-sm" href="selectBookByID?bookId=${book.bookId}&page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                        &name=${name}&author=${author}" role="button">编辑</a>
                        <button class="btn btn btn-danger btn-sm" onclick="deleteBook(${book.bookId})">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <script>
        function deleteBook(id) {
            $("#allBooks").submit(function() {
                return false;
            });
            if(confirm("删除操作不可恢复，您确定删除吗？")) {
                $.ajax({
                    type: "POST",
                    url:"deleteBook",
                    data:{"bookId":id},
                    dataType:"json",
                    error: function(request) {
                        alert("连接失败");
                    },
                    success: function(data) {
                        //接收后台返回的结果
                        if(data.stateCode.trim() === "1")//1表示登录成功
                        {   //删除成功后刷新页面
                            window.location.href = "seleteBooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}&name=${name}&author=${author}";
                        }
                    }
                });
            } else {

            }
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
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="seleteBooks?page=1&size=${pageBooks.pageSize}&name=${name}&author=${author}" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <%--上一页--%>
            <c:if test="${pageBooks.pageNum <= 1}">
            <li class="disabled">
                <a href="seleteBooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">上一页</a>
            </li>
            </c:if>
            <c:if test="${pageBooks.pageNum > 1}">
            <li>
                <a href="seleteBooks?page=${pageBooks.pageNum-1}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">上一页</a>
            </li>
            </c:if>
            <%----%>
            <c:forEach begin="1" end="${pageBooks.pages}" var="pageNum">
                <%--激活状态判断--%>
                <c:if test="${pageBooks.pageNum == pageNum}">
                    <li class="active"><a href="seleteBooks?page=${pageNum}&size=${pageBooks.pageSize}
                    &name=${name}&author=${author}">${pageNum}</a></li>
                </c:if>
                <c:if test="${pageBooks.pageNum != pageNum}">
                    <li><a href="seleteBooks?page=${pageNum}&size=${pageBooks.pageSize}
                    &name=${name}&author=${author}">${pageNum}</a></li>
                </c:if>
            </c:forEach>
            <%--下一页--%>
            <c:if test="${pageBooks.pageNum >= pageBooks.pages}">
            <li class="disabled">
                <a href="seleteBooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">下一页</a>
            </li>
            </c:if>
            <c:if test="${pageBooks.pageNum < pageBooks.pages}">
            <li>
                <a href="seleteBooks?page=${pageBooks.pageNum+1}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">下一页</a>
            </li>
            </c:if>
            <%----%>
            <li>
                <a href="seleteBooks?page=${pageBooks.pages}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}" aria-label="Next">尾页</a>
            </li>
        </ul>
        <div class="record">共${pageBooks.total}条记录，共${pageBooks.pages}页</div>
    </nav>
</div>
</body>
</html>
