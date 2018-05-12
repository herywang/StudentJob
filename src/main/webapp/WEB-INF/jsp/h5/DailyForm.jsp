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
    <title>日志编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!--解决一部分浏览器适应问题（联网产生效应）-->
    <meta name="renderer" content="webkit"/>
    <link rel="icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/static/img/thumb_raw_1521874390.png" type="image/x-icon">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/layer/layer.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/DailyForm.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/am-content-location.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/js/DailyForm.js"></script>
</head>
<body>
<div class="col-xs-12 navbar-fixed-top top-title">
    <span class="top-content"><a href="${pageContext.request.contextPath}/h5/mainPage.action?user_id=${user_id}"><span class="glyphicon glyphicon-chevron-left"></span></a><span>&nbsp;&nbsp;填写日志</span></span>
</div>

<!--表单开始-->
<div class="col-xs-12 am-content">
    <form class="daily-form" action="${pageContext.request.contextPath}/h5/DailySubmit" method="post" enctype="multipart/form-data">
        <div class="form-group col-xs-12" id="time-selection">
            <label class="sr-only" for="InputTime">时间</label>
            <div class="input-group col-xs-12">
                <div class="input-group-addon"><span class="glyphicon glyphicon-time icon-style"></span> 时间</div>
                <input name="log_time" type="text"  class="form-control input" id="InputTime" placeholder="点击选择" data-options="{'type':'YYYY-MM-DD hh:mm','beginyear':2010,'endyear':2088}"/>
                <input name="user_id" style="display: none;" value="${user_id}"/>
                <div class="input-group-addon"><span class="glyphicon glyphicon-chevron-right"></span></div>
            </div>
        </div>
        <div class="form-group col-xs-12">
            <label class="sr-only" for="InputJob">岗位</label>
            <div class="input-group col-xs-12">
                <div class="input-group-addon"><span class="glyphicon glyphicon-education icon-style"></span> 岗位</div>
                <input name="log_post" type="text" class="form-control input" id="InputJob" placeholder="点击选择" />
                <div class="input-group-addon"><span class="glyphicon glyphicon-chevron-right"></span></div>
            </div>
        </div>
        <div class="form-group col-xs-12">
            <label class="sr-only" for="InputPlace">地点</label>
            <div class="input-group col-xs-12">
                <div class="input-group-addon"><span class="glyphicon glyphicon-map-marker icon-style"></span> 地点</div>
                <input name="log_loc" type="text" class="form-control input" id="InputPlace" placeholder="点击选择"/>
                <div class="input-group-addon"><span class="glyphicon glyphicon-chevron-right"></span></div>
            </div>
        </div>
        <div class="form-group col-xs-12">
            <label class="sr-only" for="InputTakingTime">学时</label>
            <div class="input-group col-xs-12">
                <div class="input-group-addon"><span class="glyphicon glyphicon-hourglass icon-style"></span> 学时</div>
                <input name="time" type="text" class="form-control input" id="InputTakingTime" placeholder="点击选择">
                <div class="input-group-addon"><span class="glyphicon glyphicon-chevron-right"></span></div>
            </div>
        </div>
        <div class="form-group col-xs-12">
            <label class="sr-only" for="InputContext">日志内容</label>
            <div class="input-group col-xs-12">
                <textarea class="form-control input" name="content" id="InputContext" rows="10" placeholder="写点什么"></textarea>
            </div>
        </div>
        <div class="form-group col-xs-12">
            <label class="sr-only">工作图片</label>
            <div class="input-group col-xs-12 image-block">
                <div class="img_div">
                    <a href="javascript:" class="a-upload btn btn-default"><input type="file" name="myFile"/>+</a>
                </div>
                <div class="shade" onclick="closeShade()">
                    <div class="">
                        <span class="text_span"></span>
                    </div>
                </div>
                <div class="shadeImg" onclick="closeShadeImg()">
                    <div class="">
                        <img class="showImg" src="">
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group col-xs-12 text-center submit-btn-block">
            <p class="submit-btn">提&nbsp;&nbsp;交</p>
        </div>
    </form>
</div>
<!--表单结束-->

<!--选择弹框开始-->
<div class="select-block job-selection hidden">
    <div class="selection">
        <p class="decision hidden"></p>
        <p class="text-center selection-title">选择岗位</p>
        <div class="selections">
            <span>班主任</span>
            <span>社团辅导</span>
            <span>心理辅导</span>
            <span>网络育人</span>
            <span>联系学生班级</span>
            <span>联系学生寝室</span>
            <span>团队指导</span>
            <span>阳光帮扶</span>
            <span>共同读书</span>
            <span>参与考研指导</span>
            <span>参与就业推荐</span>
            <span>开放交流平台</span>
            <span>党课、团课、讲座等</span>
            <span>参与学生活动</span>
            <span>其他学生教育管理</span>
        </div>
        <div class="selection-op-btn">
            <span>取消</span>
            <span>确定</span>
        </div>
    </div>
</div>
<div class="select-block place-selection hidden">
    <div class="selection">
        <p class="decision hidden"></p>
        <p class="text-center selection-title">选择地点</p>
        <div class="selections">
            <span>教学楼</span>
            <span>实验室</span>
            <span>运动场</span>
            <span>学生寝室</span>
            <span>画室</span>
            <span>琴房</span>
            <span>图书馆</span>
            <span>食堂</span>
            <span>其他</span>
        </div>
        <div class="selection-op-btn">
            <span>取消</span>
            <span>确定</span>
        </div>
    </div>
</div>
<div class="select-block taking-time-selection hidden">
    <div class="selection">
        <p class="decision hidden"></p>
        <p class="text-center selection-title">选择学时</p>
        <div class="selections">
            <span>0.5学时</span>
            <span>1.0学时</span>
            <span>2.0学时</span>
            <span>4.0学时</span>
        </div>
        <div class="selection-op-btn">
            <span>取消</span>
            <span>确定</span>
        </div>
    </div>
</div>
<!--选择弹框结束-->
<script src="${pageContext.request.contextPath}/static/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.date.js"></script>
<script>
    //时间选择
    $.date("#InputTime");
</script>
</body>
</html>
