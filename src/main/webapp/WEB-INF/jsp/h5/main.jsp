<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/main.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/main.js"></script>
</head>
<body>
<div class="container-fluid page-body">
    <!--主界面开始-->
    <div class="col-xs-12 top-title">
        <span class="menu-btn"><span class="glyphicon glyphicon-menu-hamburger"></span><span>&nbsp;&nbsp;主页</span></span>
    </div>
    <div class="col-xs-12 main-content">
        <div class="head-img"><img src="${pageContext.request.contextPath }/static/img/thumb_raw_1521959041.png" alt=""></div>
        <p class="worker-name">${name}</p>
        <p class="tip-words">${time}好，您今天的工作是...</p>

        <p class="daily-link"><a href="${pageContext.request.contextPath}/h5/DailyForm?user_id=${user_id}"><span class="glyphicon glyphicon-pencil"></span> 填写我的日志</a></p>
        <p class="daily-link"><a href="${pageContext.request.contextPath}/h5/MyDiary?user_id=${user_id}"><span class="glyphicon glyphicon-list-alt"></span> 查看我的日志</a></p>

    </div>
</div>
<!--主界面结束-->

<!--左边滑出的菜单栏开始-->
<div class="container-fluid navbar-fixed-top menu-block hidden">
    <div class="menu-nav-block">
        <div class="person-info-display">
            <div class="head-img"><img src="${pageContext.request.contextPath }/static/img/thumb_raw_1521959041.png" alt=""></div>
            <p class="person-info"><span class="glyphicon glyphicon-briefcase"></span>&nbsp;&nbsp;<span>${name}</span></p>
            <p class="person-info"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;<span>${username}</span></p>
        </div>
        <ul class="menu-nav">
            <li><a href="${pageContext.request.contextPath}/h5/myCount?user_id=${user_id}"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账户管理</a></li>
            <li><a href=""><span class="glyphicon glyphicon-trash"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;清理缓存</a></li>
            <li>学生工作量质</li>
            <li><a href="${pageContext.request.contextPath}/h5/aboutUs?user_id=${user_id}"><span class="glyphicon glyphicon-paperclip"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;关于我们</a></li>
            <li><a href=""><span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;帮助与反馈</a></li>
        </ul>
    </div>
</div>
<!--左边滑出的菜单栏结束-->
</body>
</html>
