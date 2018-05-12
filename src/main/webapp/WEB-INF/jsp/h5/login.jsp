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
    <title>登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/login.js"></script>
    <style>
        .page-body {
            background: url("${pageContext.request.contextPath}/static/img/背景.png") no-repeat;
            background-size: cover;
            width: 100%;
        }

    </style>
</head>
<body>
<div class="container-fluid page-body">
    <div class="login-form-block col-xs-12">
        <div class="col-xs-12 text-center login-title">
            <span>学生工作质量考核登录</span>
        </div>
        <div class="col-xs-12 login-logo">
            <img src="${pageContext.request.contextPath }/static/img/login_logo.png" alt="" class="col-xs-offset-4 col-xs-4">
        </div>
        <div class="col-xs-12">
            <form class="login-form" method="post" action="${pageContext.request.contextPath}/h5/Login">
                <div class="form-group">
                    <input type="text"  name="username" class="form-control input-style" id="user_id" placeholder="请输入账号">
                </div>
                <div class="form-group tips">
                    <p class="tips account-tips">&nbsp;</p>
                </div>
                <div class="form-group">
                    <input type="password"  name="password" class="form-control input-style" id="password" placeholder="请输入密码">
                </div>
                <div class="form-group tips">
                    <p class="password-tips">&nbsp;</p>
                </div>
                <div class="form-group tips">
                    <p class="password-tips">&nbsp;${meg}</p>
                </div>
                <div class="form-group text-center">
                    <p class="btn submit-button-style">登录</p>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
