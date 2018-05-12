<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>账号管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/accountManage.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/am-content-location.js"></script>
</head>
<body>
<div class="col-xs-12 navbar-fixed-top top-title">
    <span class="top-content"><a href="${pageContext.request.contextPath}/h5/mainPage?user_id=${teacher.username}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;账户管理</span></span>
</div>

<div class="col-xs-12 am-content">
    <div class="col-xs-12 one-line">
        <a href="">
            <div class="col-xs-3 text-left">头像</div>
            <div class="col-xs-9 text-right">
                <img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521956465.png" alt="">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </div>
        </a>
    </div>
    <div class="col-xs-12 one-line">
        <div class="col-xs-3 text-left">姓名</div>
        <div class="col-xs-9 text-center">
            <span>${teacher.name}</span>
        </div>
    </div>
    <div class="col-xs-12 one-line">
        <div class="col-xs-3 text-left">工号</div>
        <div class="col-xs-9 text-center">
            <span>${teacher.username}</span>
        </div>
    </div>
    <div class="col-xs-12 one-line">
        <div class="col-xs-3 text-left">电话</div>
        <div class="col-xs-9 text-center">
            <span>${teacher.phone}</span>
        </div>
    </div>
    <div class="col-xs-12 one-line">
        <div class="col-xs-3 text-left">学院</div>
        <div class="col-xs-9 text-center">
            <span>${teacher.college}</span>
        </div>
    </div>
    <div class="col-xs-12 one-line">
        <div class="col-xs-12 text-left">修改密码</div>
    </div>
    <div class="col-xs-12 one-line">
        <a href="${pageContext.request.contextPath}/h5/alterPwd?user_id=${teacher.username}">
            <div class="col-xs-9 text-left"><span class="glyphicon glyphicon-lock"></span>&nbsp;&nbsp;&nbsp;账号密码</div>
            <div class="col-xs-3 text-right">
                <span class="glyphicon glyphicon-chevron-right right-go"></span>
            </div>
        </a>
    </div>
</div>
</body>
</html>
