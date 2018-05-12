<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/alterPassword.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/am-content-location.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/alterPassword.js"></script>
</head>
<body>
<div class="col-xs-12 navbar-fixed-top top-title">
    <span class="top-content"><a href="${pageContext.request.contextPath}/h5/myCount?user_id=${user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;修改密码</span></span>
</div>
<div class="col-xs-12 am-content">
    <form class="alter-form" action="${pageContext.request.contextPath}/h5/alterPwdSub">
        <input type="text" name="user_id" style="display: none;" value="${user_id}">
        <div class="form-group">
            <label for="inputOldPassword" class="input-label">原密码</label>
            <input type="password" name="old_pwd" class="form-control input-style" id="inputOldPassword">
        </div>
        <div class="form-group">
            <label for="inputNewPassword" class="input-label">新密码</label>
            <input type="password" name="new_pwd1" class="form-control input-style" id="inputNewPassword">
        </div>
        <div class="form-group">
            <label for="inputPasswordAgain" class="input-label">再次输入</label>
            <input type="password" name="new_pwd2" class="form-control input-style" id="inputPasswordAgain">
        </div>
        <div class="form-group tips">
            <p class="input-tips">&nbsp;</p>
        </div>
        <div class="form-group tips">
            <p class="input-tips">${msg}</p>
        </div>
        <div class="form-group submit-btn-block">
            <button type="button" class="submit-btn">确 定</button>
        </div>

    </form>
</div>
</body>
</html>