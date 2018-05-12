
$(function () {
    function init() {
        var selection = $(".selection");
        $(".job-selection").css({"height":$(window).height()+"px"});
        $(".place-selection").css({"height":$(window).height()+"px"});
        $(".taking-time-selection").css({"height":$(window).height()+"px"});
        $(".job-selection>.selection").css({"margin-top":($(window).height()-selection.height())*0.5+"px"});
        $(".place-selection>.selection").css({"margin-top":($(window).height()-selection.height())*0.5+"px"});
        $(".taking-time-selection>.selection").css({"margin-top":($(window).height()-selection.height())*0.5+"px"});
    }
    init();
    $(".selections>span").click(function () {
        $(this).parent().parent().find(".decision").text($(this).text());
       $(this).parent().children().css({"background-color":"white","color":"#5ABBCE"});
       $(this).css({"background-color":"#5ABBCE","color":"white"});
    });
    $(".select-block").click(function (e) {
       if(!$(e.target).is(".select-block *")){
           $(this).addClass("hidden");
       }
    });
    $(".form-group:nth-child(2)").click(function () {
        $(".job-selection .decision").text($(this).find("input").val());
       $(".job-selection").removeClass("hidden");
        $(".job-selection").css({"height":$(window).height()+"px"});
        $(".job-selection>.selection").css({"margin-top":($(window).height()-$(".job-selection>.selection").height())*0.5+"px"});
    });
    $(".form-group:nth-child(3)").click(function () {
        $(".place-selection .decision").text($(this).find("input").val());
        $(".place-selection").removeClass("hidden");
        $(".place-selection").css({"height":$(window).height()+"px"});
        $(".place-selection>.selection").css({"margin-top":($(window).height()-$(".place-selection>.selection").height())*0.5+"px"});
    });
    $(".form-group:nth-child(4)").click(function () {
        $(".taking-time-selection .decision").text($(this).find("input").val());
        $(".taking-time-selection").removeClass("hidden");
        $(".taking-time-selection").css({"height":$(window).height()+"px"});
        $(".taking-time-selection>.selection").css({"margin-top":($(window).height()-$(".taking-time-selection>.selection").height())*0.5+"px"});
    });
    $(".selection-op-btn span:nth-child(1)").click(function () {
        $(this).parent().parent().parent().addClass("hidden");
    });
    $(".job-selection .selection-op-btn span:nth-child(2)").click(function () {
        $("#InputJob").val($(this).parent().parent().find(".decision").text());
        $(this).parent().parent().parent().addClass("hidden");
    });
    $(".place-selection .selection-op-btn span:nth-child(2)").click(function () {
        $("#InputPlace").val($(this).parent().parent().find(".decision").text());
        $(this).parent().parent().parent().addClass("hidden");
    });
    $(".taking-time-selection .selection-op-btn span:nth-child(2)").click(function () {
        $("#InputTakingTime").val($(this).parent().parent().find(".decision").text());
        $(this).parent().parent().parent().addClass("hidden");
    });
    $(".submit-btn").click(function () {
        if($("#InputTime").val() == "" || $("#InputJob").val() == "" || $("#InputPlace").val() == "" || $("#InputTakingTime").val() == "" || $("#InputContext").val() == ""){
            layer.msg("所填内容不能为空！",{icon:2});
        }else {
            $(".daily-form").submit();
        }
    });

    $(".a-upload").on("click",".input-cover",function() {
        layer.msg("最多上传三张图片",{icon:2});
    });
    $(window).resize(function () {
        init();
    });
    var objUrl;
    var img_html;
    var img_div = $(".img_div");
    $(".isImg>img").each(function () {
        if($(this).width()>$(this).height()){
            var k=$(this).width()/$(this).height();
            $(this).css({"width":"50px","margin-top":(50-(50/k))*0.5+"px"});
        }else {
            $(this).css({"height":"50px"});
        }
    });

    $(".a-upload").on("change","input[name='myFile']",function() {
        console.log("a");
        if($(".isImg>img").length < 3){
            for(var i = 0; i < this.files.length; i++) {
                objUrl = getObjectURL(this.files[i]);

                img_html = "<div class='isImg'><img src='" + objUrl + "' /><button class='removeBtn' onclick='removeImg(this)'>x</button></div>";
                img_div.append(img_html);
                if($("input[name='myFile']").length < 3){
                    $(this).after('<input type="file" name="myFile"/>');
                }else{
                    $(this).after('<span class="input-cover"></span>');
                }

                $(".isImg>img").each(function () {
                    var img = new Image();
                    var thisObj = $(this);
                    img.src = $(this).attr("src");
                    img.onload = function(){
                        if(img.width > img.height){
                            thisObj.css({"width":"50px","margin-top":(50-(50/(img.width/img.height)))*0.5+"px"});
                        }else {
                            thisObj.css({"height":"50px"});
                        }
                    };
                });

            }
        }else{
            layer.msg('最多上传三张图片', {icon: 2});
        }
    });
    /*
     作者：z@qq.com
    时间：2016-12-10
    描述：鉴定每个浏览器上传图片url 目前没有合并到Ie
     * */
    function getObjectURL(file) {
        var url = null;
        if(window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if(window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if(window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        //console.log(url);
        return url;
    }
});
/*
 作者：z@qq.com
 时间：2016-12-10
  描述：上传图片附带删除 再次地方可以加上一个ajax进行提交到后台进行删除
 * */
function removeImg(r){
    var old_img_length = $(".isImg>img").length;
    $("input[name='myFile']").eq($(r).parent().index()).remove();
    if(old_img_length === 3){
        $(".input-cover").remove();
        $("input[name='myFile']:last-child").after('<input type="file" name="myFile"/>');
    }
    $(r).parent().remove();
}
/*
 作者：z@qq.com
 时间：2016-12-10
  描述：上传图片附带放大查看处理
 * */
function lookBigImg(b){
    $(".shadeImg").fadeIn(500);
    $(".showImg").attr("src",$(b).attr("src"))
}
/*
 作者：z@qq.com
 时间：2016-12-10
  描述：关闭弹出层
 * */
function closeShade(){
    $(".shade").fadeOut(500);
}
/*
 作者：z@qq.com
 时间：2016-12-10
  描述：关闭弹出层
 * */
function closeShadeImg(){
    $(".shadeImg").fadeOut(500);
}