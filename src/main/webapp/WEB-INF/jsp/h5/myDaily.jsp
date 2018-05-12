<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: liukaowen
  Date: 2018/4/26
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>我的日志</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/myDaily.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/myDaily.js"></script>
</head>
<body>
<div class="navbar-fixed-top">
    <div class="col-xs-12 top-title">
        <span class="top-content"><a href="${pageContext.request.contextPath}/h5/mainPage?user_id=${user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;我的日志</span></span>
    </div>
    <div class="col-xs-12 nav-block">
        <span class="col-xs-3 text-center swith-btn click-active">全部</span>
        <span class="col-xs-3 text-center swith-btn">已审核</span>
        <span class="col-xs-3 text-center swith-btn">审核中</span>
        <span class="col-xs-3 text-center swith-btn">未审核</span>
    </div>
</div>

<div class="col-xs-12 am-content">
    <div class="col-xs-12 swiper-container">
        <div class="swiper-wrapper">
            <!--全部日志开始-->
            <div class="swiper-slide" id="all">
                <c:forEach items="${pageInfo0.list}" var="diary">
                    <a href="${pageContext.request.contextPath}/h5/detail?log_id=${diary.id}&user_id=${diary.user_id}">
                        <div class="col-xs-12 one-daily">
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
                            <div class="col-xs-12 text-left words">
                                ${diary.content}
                            </div>
                            <%--<div class="col-xs-12 daily-images">--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                            <%--</div>--%>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <!--全部日志结束-->

            <!--已审核开始-->
            <div class="swiper-slide" id="already">
                <c:forEach items="${pageInfo1.list}" var="diary">
                    <a href="${pageContext.request.contextPath}/h5/detail?log_id=${diary.id}&user_id=${diary.user_id}">
                        <div class="col-xs-12 one-daily">
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
                            <div class="col-xs-12 text-left words">
                                    ${diary.content}
                            </div>
                            <%--<div class="col-xs-12 daily-images">--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                            <%--</div>--%>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <!--已审核结束-->

            <!--审核中开始-->
            <div class="swiper-slide" id="reading">
                <c:forEach items="${pageInfo3.list}" var="diary">
                    <a href="${pageContext.request.contextPath}/h5/detail?log_id=${diary.id}&user_id=${diary.user_id}">
                        <div class="col-xs-12 one-daily">
                            <div class="col-xs-8 text-left"><span><fmt:formatDate value="${diary.start_time}" pattern="yyyy-MM-dd hh:mm" /></span></div>
                            <div class="col-xs-4 text-right"><span class="glyphicon glyphicon-map-marker"></span> ${diary.location}</div>
                            <div class="col-xs-4 text-left"><span>${diary.post}</span></div>
                            <div class="col-xs-4 text-center"><span>${diary.time}</span></div>
                            <div class="col-xs-4 text-right"><span class="read-state"><c:choose>
                                <c:when test="${diary.state == 0}">未审核</c:when>
                                <c:when test="${diary.state == 1}">审核中</c:when>
                                <c:when test="${diary.state == 2}">审核完成 ：优秀</c:when>
                                <c:when test="${diary.state == 3}">审核完成 ：良好</c:when>
                                <c:when test="${diary.state == 4}">审核完成 ：合格</c:when>
                                <c:when test="${diary.state == 5}">审核完成 ：不及格</c:when>
                            </c:choose></span></div>
                            <div class="col-xs-12 text-left words">
                                    ${diary.content}
                            </div>
                            <%--<div class="col-xs-12 daily-images">--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                            <%--</div>--%>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <!--审核中结束-->

            <!--未审核开始-->
            <div class="swiper-slide" id="unread">
                <c:forEach items="${pageInfo2.list}" var="diary">
                    <a href="${pageContext.request.contextPath}/h5/detail?log_id=${diary.id}&user_id=${diary.user_id}">
                        <div class="col-xs-12 one-daily">
                            <div class="col-xs-8 text-left"><span><fmt:formatDate value="${diary.start_time}" pattern="yyyy-MM-dd hh:mm" /></span></div>
                            <div class="col-xs-4 text-right"><span class="glyphicon glyphicon-map-marker"></span> ${diary.location}</div>
                            <div class="col-xs-4 text-left"><span>${diary.post}</span></div>
                            <div class="col-xs-4 text-center"><span>${diary.time}</span></div>
                            <div class="col-xs-4 text-right"><span class="read-state"><c:choose>
                                <c:when test="${diary.state == 1}">未审核</c:when>
                                <c:when test="${diary.state == 2}">审核中</c:when>
                                <c:when test="${diary.state == 3}">审核完成 ： 优秀</c:when>
                                <c:when test="${diary.state == 4}">审核完成 ： 良好</c:when>
                                <c:when test="${diary.state == 5}">审核完成 ： 合格</c:when>
                                <c:when test="${diary.state == 6}">审核完成 ： 不及格</c:when>
                            </c:choose></span></div>
                            <div class="col-xs-12 text-left words">
                                    ${diary.content}
                            </div>
                            <%--<div class="col-xs-12 daily-images">--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                                <%--<div class="col-xs-4"><img src="${pageContext.request.contextPath}/static/img/thumb_raw_1521874390.png" alt="" class="col-xs-12"></div>--%>
                            <%--</div>--%>
                        </div>
                    </a>
                </c:forEach>
            </div>
            <!--未审核结束-->
        </div>
    </div>
</div>
</body>
</html>