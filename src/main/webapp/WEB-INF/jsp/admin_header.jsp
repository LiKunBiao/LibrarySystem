<%--
  Created by IntelliJ IDEA.
  User: JianFeidao
  Date: 2022/4/4
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">图书管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="seleteBooks">全部图书</a></li>
                        <li><a href="admin_book_add">添加图书</a></li>
                    </ul>
                </li>
                <li><a href="selectAllReader">读者管理</a></li>
<%--                <li><a href="#">借还日志</a></li>--%>
            </ul>
            <!--            <form class="navbar-form navbar-left">-->
            <!--                <div class="form-group">-->
            <!--                    <input type="text" class="form-control" placeholder="Search">-->
            <!--                </div>-->
            <!--                <button type="submit" class="btn btn-default">Submit</button>-->
            <!--            </form>-->
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${username} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="adminPasswordUpdate">修改密码</a></li>
                        <li><a href="logout">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
