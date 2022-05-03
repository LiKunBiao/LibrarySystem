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
    <title>添加图书</title>
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
<form class="form-horizontal" id="addBook">
    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">图书名</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="name" id="name" placeholder="请输入图书名">
        </div>
    </div>
    <div class="form-group">
        <label for="author" class="col-sm-2 control-label">作者</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者">
        </div>
    </div>
    <div class="form-group">
        <label for="publish" class="col-sm-2 control-label">出版社</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="publish" id="publish" placeholder="请输入出版社">
        </div>
    </div>
    <div class="form-group">
        <label for="isbn" class="col-sm-2 control-label">ISBN</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="isbn" id="isbn" placeholder="请输入ISBN">
        </div>
    </div>
    <div class="form-group">
        <label for="introduction" class="col-sm-2 control-label">简介</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="introduction" id="introduction" placeholder="请输入简介">
        </div>
    </div>
    <div class="form-group">
        <label for="language" class="col-sm-2 control-label">语言</label>
        <div class="col-sm-9">
            <input type="text" class="form-control" name="language" id="language" placeholder="请输入语言">
        </div>
    </div>
    <div class="form-group">
        <label for="price" class="col-sm-2 control-label">价格</label>
        <div class="col-sm-9">
            <input type="number" min="0" class="form-control" name="price" id="price" placeholder="请输入价格">
        </div>
    </div>
    <div class="form-group">
        <label for="pubDate" class="col-sm-2 control-label">出版日期</label>
        <div class="col-sm-9">
            <input type="date" class="form-control" name="pubDate" id="pubDate" placeholder="请输入出版日期">
        </div>
    </div>
    <div class="form-group">
        <label for="classId" class="col-sm-2 control-label">分类号</label>
        <div class="col-sm-9">
            <input type="number" min="1" max="22" class="form-control" name="classId" id="classId" placeholder="请输入分类号">
        </div>
    </div>
    <div class="form-group">
        <label for="number" class="col-sm-2 control-label">数量</label>
        <div class="col-sm-9">
            <input type="number" min="0" class="form-control" name="number" id="number" placeholder="请输入图书数量">
        </div>
    </div>

</form>
<div class="form-group">
    <div class="col-sm-offset-2 col-sm-9">
        <input type="button" id="addButton" class="btn btn-success" value="添加">
        &nbsp;&nbsp;
        <a href="/seleteBooks"><input type="button" class="btn btn-success" value="返回"></a>
    </div>
</div>
<script>
    $('#addButton').click(function() {
        if ($("#name").val() == '' || $("#author").val() == '' || $("#publish").val() == '' || $("#isbn").val() == '' || $("#introduction").val() == '' || $("#language").val() == '' || $("#price").val() == '' || $("#pubDate").val() == '' || $("#classId").val() == '' || $("#number").val() == '') {
            alert("请填入完整图书信息！");
            return false;
        }
        else
        {
            if (confirm("请确认输入数据是否有误，如无误请按确认键")) {
                $.ajax({
                    type: "POST",
                    url:"addBook",
                    data:$("#addBook").serialize(),
                    dataType:"json",
                    error: function(request) {
                        alert("连接错误");
                    },
                    success: function(data) {
                        //接收后台返回的结果
                        if(data.stateCode.trim() === "1")
                        {
                            alert("添加成功！");
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
