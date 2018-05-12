$(function () {
    $(".am-content").css({"margin-top":$(".top-title").height()+"px"});


    $(window).resize(function () {
        $(".am-content").css({"margin-top":$(".top-title").height()+"px"});
    });
});