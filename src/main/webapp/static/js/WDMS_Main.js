$(function () {
    $(".left-nav").css({"height":$(window).height()+"px"});
    var page_name = $(".page-name").html();
    var op_select_list = $(".op-select");
    $(".teacher-selection").css({"width":($("#teacher").width()+2)+"px"});
    op_select_list.each(function () {
        if($(this).html() === page_name){
            $(this).parent().children(".select-sign").css({"color":"rgba(0,0,0,.7)"});
        }
    });

    var one_info = $(".one-info");
    one_info.find("td").css({"line-height":one_info.height()+"px"});
    $(window).resize(function () {
        $(".left-nav").css({"height":$(window).height()+"px"});
        $(".teacher-selection").css({"width":($("#teacher").width())+"px"});
    });
    $(".back-button a").click(function () {
        history.go(-1);
    });
});