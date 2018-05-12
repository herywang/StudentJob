$(function () {
    function initial() {
        var daily_img = $(".daily-images>div");
        $(".am-content").css({"margin-top":$(".navbar-fixed-top").height()+"px"});
        daily_img.css({"height":daily_img.width()+"px"});
        $(".daily-images>div>img").each(function () {
            var img_div = $(this).parent();
            var img_width = $(this).width();
            var img_height = $(this).height();
            if((img_width/img_height) > (img_div.width()/img_div.height())){
                $(this).css({"width":img_div.width()+"px","margin-top":(img_div.height()-((img_div.width()*img_height))/img_width)*0.5+"px","margin-bottom":(img_div.height()-((img_div.width()*img_height))/img_width)*0.5+"px"});
            }else {
                $(this).css({"height":img_div.height()+"px"});
            }
        });
    }
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
    initial();
    $(window).resize(function () {
        initial();
    });
    var mySwiper = new Swiper('.swiper-container',{
        autoHeight:true
    });
    $(".nav-block span").click(function () {
        var index = $(this).index();
        $(".nav-block span").removeClass("click-active");
        $(this).addClass("click-active");
        mySwiper.slideTo(index);
    });
    function ifAnimate() {
        if(mySwiper.animating){
            var index = mySwiper.activeIndex;
            $(".nav-block span").removeClass("click-active");
            $(".nav-block span:nth-child("+(index+1)+")").addClass("click-active");
        }
    }
    setInterval(ifAnimate,100);
});