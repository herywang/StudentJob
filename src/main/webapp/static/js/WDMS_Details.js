window.onload = function() {
    var big_img_block = $(".big-img-block");
    var big_img = $(".big-img");
    big_img_block.css({"height":$(window).height()+"px","width":$(window).width()+"px"});
    var mySwiper = new Swiper ('.swiper-container', {
        autoplay:3000,
        direction: 'horizontal',
        loop: true,

        // 如果需要分页器
        pagination: '.swiper-pagination',

        // 如果需要前进后退按钮
        nextButton: '.swiper-button-next',
        prevButton: '.swiper-button-prev',

        // 如果需要滚动条
        scrollbar: '.swiper-scrollbar'
    });
    $(".close-btn").click(function () {
        $(".big-img-block").addClass("hidden");
    });
    function enlargeImg(url) {
        $(".big-img-block").removeClass("hidden");
        big_img.attr("src",url);
        var img_width = big_img.width();
        var img_height = big_img.height();
        if((($(window).width()*img_height)/img_width) < $(window).height()){
            big_img.css({"width":$(window).width()+"px"});
            console.log(big_img.width());
        }else {
            big_img.css({"height":$(window).height()+"px"});
        }
    }

    $(".swiper-slide img").click(function () {
        var url = $(this).attr("src");
        enlargeImg(url);
    });

    $(window).resize(function () {
        big_img = $(".big-img");
        big_img_block.css({"height":$(window).height()+"px","width":$(window).width()+"px"});
        if((($(window).width()*big_img.height())/big_img.width()) < $(window).height()){
            big_img.css({"width":$(window).width()+"px"});
        }else {
            big_img.css({"height":$(window).height()+"px"});
            console.log(big_img.width());
        }
    });
};