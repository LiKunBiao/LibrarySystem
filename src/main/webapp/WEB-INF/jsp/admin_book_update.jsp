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
  <title>更新图书信息</title>
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
<form class="form-horizontal" id="updateBook">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">图书名</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="name" id="name" placeholder="请输入图书名" value="${book.name}">
    </div>
  </div>
  <div class="form-group">
    <label for="author" class="col-sm-2 control-label">作者</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者" value="${book.author}">
    </div>
  </div>
  <div class="form-group">
    <label for="publish" class="col-sm-2 control-label">出版社</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="publish" id="publish" placeholder="请输入出版社" value="${book.publish}">
    </div>
  </div>
  <div class="form-group">
    <label for="isbn" class="col-sm-2 control-label">ISBN</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN" value="${book.isbn}">
    </div>
  </div>
  <div class="form-group">
    <label for="introduction" class="col-sm-2 control-label">简介</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="introduction" id="introduction" placeholder="请输入简介" value="${book.introduction}">
    </div>
  </div>
  <div class="form-group">
    <label for="language" class="col-sm-2 control-label">语言</label>
    <div class="col-sm-9">
      <input type="text" class="form-control" name="language" id="language" placeholder="请输入语言" value="${book.language}">
    </div>
  </div>
  <div class="form-group">
    <label for="price" class="col-sm-2 control-label">价格</label>
    <div class="col-sm-9">
      <input type="number" min="0" class="form-control" name="price" id="price" placeholder="请输入价格" value="${book.price}">
    </div>
  </div>
  <div class="form-group">
    <label for="pubDate" class="col-sm-2 control-label">出版日期</label>
    <div class="col-sm-9">
      <input type="date" class="form-control" name="pubDate" id="pubDate" placeholder="请输入出版日期" value="${book.pubDate}">
    </div>
  </div>
  <div class="form-group">
    <label for="classId" class="col-sm-2 control-label">分类号</label>
    <div class="col-sm-9">
      <input type="number" min="1" max="22" class="form-control" name="classId" id="classId" placeholder="请输入分类号" value="${book.classId}">
    </div>
  </div>
  <div class="form-group">
    <label for="number" class="col-sm-2 control-label">数量</label>
    <div class="col-sm-9">
      <input type="number" min="0" class="form-control" name="number" id="number" placeholder="请输入图书数量" value="${book.number}">
    </div>
  </div>
  <%--隐藏域，隐藏id--%>
  <input type="hidden" name="bookId" id="bookId" value="${book.bookId}">
</form>
<div class="form-group">
  <div class="col-sm-offset-2 col-sm-9">
    <input type="button" id="updateButton" class="btn btn-success" value="修改">
    &nbsp;&nbsp;
    <a href="/seleteBooks?page=${page}&size=${size}&name=${name}&author=${author}"><input type="button" class="btn btn-success" value="返回"></a>
  </div>
</div>
<script>
  $('#updateButton').click(function() {
    if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubDate").val() == '' || $("#classId").val() == '' || $("#number").val() == '') {
      alert("请填入完整图书信息！");
      return false;
    }
    else
    {
        $.ajax({
          type: "POST",
          url:"updateBook",
          data:$("#updateBook").serialize(),
          dataType:"json",
          error: function(request) {
            alert("连接错误");
          },
          success: function(data) {
            //接收后台返回的结果
            if(data.stateCode.trim() === "1")//1表示登录成功
            {
              alert("修改成功！");
            }
          }
        });
    }
  })
</script>
</body>
</html>
