$(function () {
    $(".main-content").css({"height":($(window).height()-$(".top-title").height())+"px"});
    $(".menu-block").css({"height":($(window).height())+"px"});
    $(".menu-nav-block").css({"height":($(window).height())+"px"});

    $(window).resize(function () {
        $(".main-content").css({"height":($(window).height()-$(".top-title").height())+"px"});
        $(".menu-block").css({"height":($(window).height())+"px"});
        $(".menu-nav-block").css({"height":($(window).height())+"px"});
    });
    $(".menu-btn").click(function () {
       $(".menu-block").removeClass("hidden");
        setTimeout(function () {
            $(".menu-nav-block").css({"margin-left":"0"});
        }, 300);
    });
    $(".menu-block").click(function(e) {
        if(!$(e.target).is(".menu-block *")) {
            $(".menu-nav-block").css({"margin-left": "-280px"});
            setTimeout(function () {
                $(".menu-block").addClass("hidden");
            }, 300);
        }
    })
});