<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>关于我们</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href=""${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/AboutUs.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/am-content-location.js"></script>
</head>
<body>
<div class="col-xs-12 navbar-fixed-top top-title">
    <span class="top-content"><a href="${pageContext.request.contextPath}/h5/mainPage.action?user_id=${user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;账户管理</span></span>
</div>
<div class="col-xs-12 am-content">
    <div class="col-xs-12 logo-block">
        <img src="${pageContext.request.contextPath }/static/img/aboutUsLogo.png" class="col-xs-offset-4 col-xs-4 logo" alt="">
    </div>
    <div class="col-xs-12 one-line-block">
        <div class="one-line col-xs-12">
            <div class="col-xs-6 left-label text-left">版本</div>
            <div class="col-xs-6 right-info text-right">v1.0.0</div>
        </div>
        <a href="">
            <div class="one-line col-xs-12">
                <div class="col-xs-6 left-label text-left">用户协议</div>
                <div class="col-xs-6 right-info text-right"><span class="glyphicon glyphicon-chevron-right"></span></div>
            </div>
        </a>
    </div>
</div>
</body>
</html>