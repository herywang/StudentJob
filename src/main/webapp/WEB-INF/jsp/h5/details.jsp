<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>日志详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/swiper-4.2.0/dist/css/swiper.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/swiper-4.2.0/dist/js/swiper.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/details.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/am-content-location.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/details.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var mySwiper = new Swiper ('.swiper-container', {
                autoplay:true
            });
        })
    </script>
</head>
<body>
<div class="col-xs-12 navbar-fixed-top top-title">
    <span class="top-content"><a href="${pageContext.request.contextPath}/h5/MyDiary?user_id=${user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;日志详情</span></span>
</div>
<div class="col-xs-12 am-content">
    <div class="col-xs-12 swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${diary.images}" var="images">
                <div class="swiper-slide"><img src="${images}" alt=""></div>
            </c:forEach>
        </div>
    </div>
    <div class="col-xs-12 center-info-block">
        <div class="col-xs-8 text-left"><span><fmt:formatDate value="${diary.start_time}" pattern="yyyy-MM-dd hh:mm" /></span></div>
        <div class="col-xs-4 text-right"><span class="glyphicon glyphicon-map-marker"></span> ${diary.location}</div>
        <div class="col-xs-4 text-left"><span>${diary.post}</span></div>
        <div class="col-xs-4 text-center"><span>${diary.time}</span></div>
        <div class="col-xs-4 text-right"><span class="read-state"><c:choose>
            <c:when test="${diary.state == 0}">未审核</c:when>
            <c:when test="${diary.state == 1}">审核中</c:when>
            <c:when test="${diary.state == 2}">审核完成 ： 优秀</c:when>
            <c:when test="${diary.state == 3}">审核完成 ： 良好</c:when>
            <c:when test="${diary.state == 4}">审核完成 ： 合格</c:when>
            <c:when test="${diary.state == 5}">审核完成 ： 不及格</c:when>
        </c:choose></span></div>
    </div>
    <div class="col-xs-12 words-block">
        <div class="words-title">文字详情:</div>
        <div class="words">${diary.content}</div>
    </div>
</div>
<a href="" class="alter-link-btn"><span class="glyphicon glyphicon-pencil"></span></a>
</body>
</html>
