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
    <title>图书查阅</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/static/js/bootstrap.min.js"></script>
    <script>
        $(function (){
            $('#head').load('reader_header');
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
        <form class="form-inline" action="/reader_seleteBooks" method="post">
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
    <form action="#" method="post">
        <table class="table table-hover table-bordered ">
            <tr>
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
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.publish}</td>
                    <td>${book.isbn}</td>
                    <td>${book.price}</td>
                    <td>${book.number}</td>
                    <td>
                        <a class="btn btn-success btn-sm" href="reader_book_detail?bookId=${book.bookId}&page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                        &name=${name}&author=${author}" role="button">详情</a>
                    </td>

                    <c:set var="flag" value="false"/><%--标志，借阅和归还--%>
                    <c:forEach items="${lendList}" var="lend">
                        <c:if test="${lend == book.bookId}">
                            <c:set var="flag" value="true"/><%--true表示还未归还--%>
                        </c:if>
                    </c:forEach>
                    <td>
                    <c:if test="${flag}">
                        <a class="btn btn-danger btn-sm" href="returnBook?bookId=${book.bookId}&page=${pageBooks.pageNum}
                        &size=${pageBooks.pageSize}&name=${name}&author=${author}" role="button">归还</a>
                    </c:if>
                    <c:if test="${not flag}">
                        <c:if test="${book.number > 0}">
                            <a class="btn btn-primary btn-sm" href="lendBook?bookId=${book.bookId}&page=${pageBooks.pageNum}
                            &size=${pageBooks.pageSize}&name=${name}&author=${author}" role="button">借阅</a>
                        </c:if>
                        <c:if test="${book.number <= 0}">
                            <button class="btn btn-default btn-sm" disabled="disabled">已空</button>
                        </c:if>
                    </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="reader_seleteBooks?page=1&size=${pageBooks.pageSize}&name=${name}&author=${author}" aria-label="Previous">
                    <span aria-hidden="true">首页</span>
                </a>
            </li>
            <%--上一页--%>
            <c:if test="${pageBooks.pageNum <= 1}">
                <li class="disabled">
                    <a href="reader_seleteBooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">上一页</a>
                </li>
            </c:if>
            <c:if test="${pageBooks.pageNum > 1}">
                <li>
                    <a href="reader_seleteBooks?page=${pageBooks.pageNum-1}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">上一页</a>
                </li>
            </c:if>
            <%----%>
            <c:forEach begin="1" end="${pageBooks.pages}" var="pageNum">
                <%--激活状态判断--%>
                <c:if test="${pageBooks.pageNum == pageNum}">
                    <li class="active"><a href="reader_seleteBooks?page=${pageNum}&size=${pageBooks.pageSize}
                    &name=${name}&author=${author}">${pageNum}</a></li>
                </c:if>
                <c:if test="${pageBooks.pageNum != pageNum}">
                    <li><a href="reader_seleteBooks?page=${pageNum}&size=${pageBooks.pageSize}
                    &name=${name}&author=${author}">${pageNum}</a></li>
                </c:if>
            </c:forEach>
            <%--下一页--%>
            <c:if test="${pageBooks.pageNum >= pageBooks.pages}">
                <li class="disabled">
                    <a href="reader_seleteBooks?page=${pageBooks.pageNum}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">下一页</a>
                </li>
            </c:if>
            <c:if test="${pageBooks.pageNum < pageBooks.pages}">
                <li>
                    <a href="reader_seleteBooks?page=${pageBooks.pageNum+1}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}">下一页</a>
                </li>
            </c:if>
            <%----%>
            <li>
                <a href="reader_seleteBooks?page=${pageBooks.pages}&size=${pageBooks.pageSize}
                &name=${name}&author=${author}" aria-label="Next">尾页</a>
            </li>
        </ul>
        <div class="record">共${pageBooks.total}条记录，共${pageBooks.pages}页</div>
    </nav>
</div>
</body>
</html>
