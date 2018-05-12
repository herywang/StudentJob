$(function () {
    $(".read-state").each(function () {
        if($(this).text() == "已审核"){
            $(this).siblings().css({"background-color":"rgba(87,186,257,.5)"});
        }
        if($(this).text() == "未审核"){
            $(this).css({"background-color":"rgba(255,0,0,.3)"});
        }
        if($(this).text() == "审核中"){
            $(this).css({"background-color":"rgba(244,247,14,.5)"});
        }
    });
    function init() {
        $(".swiper-slide img").each(function () {
            var swiper_slide = $(this).parent();
            var img_width = $(this).width();
            var img_height = $(this).height();
            if((img_width/img_height) > (swiper_slide.width()/swiper_slide.height())){
                console.log("a");
                $(this).css({"width":swiper_slide.width()+"px","margin-top":(swiper_slide.height()-((swiper_slide.width()*img_height))/img_width)*0.5+"px","margin-bottom":(swiper_slide.height()-((swiper_slide.width()*img_height))/img_width)*0.5+"px"});
            }else {
                console.log("b");
                $(this).css({"height":swiper_slide.height()+"px"});
            }
        });
    }
    init();
    $(window).resize(function () {
        init();
    });
});