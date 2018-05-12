$(function () {
    var web_title = $(".web-title");
    var form_block_locate = $(".form-block-locate");
    var bottom = $(".bottom");
    var form_block = $(".form-block");
    if((web_title.height()+form_block.height()+bottom.height()) < $(window).height()){
        form_block.css({"margin-top":($(window).height()-(web_title.height()+form_block.height()+bottom.height()+110))*0.5+"px",
                         "margin-bottom":($(window).height()-(web_title.height()+form_block.height()+bottom.height()+110))*0.5+"px"});
    }

    $(window).resize(function () {
        if((web_title.height()+form_block.height()+bottom.height()) < $(window).height()){
            form_block.css({"margin-top":($(window).height()-(web_title.height()+form_block.height()+bottom.height()+110))*0.5+"px",
                "margin-bottom":($(window).height()-(web_title.height()+form_block.height()+bottom.height()+110))*0.5+"px"});
        }
    });

    $(".input-style").focus(function () {
        $(this).parent().children(".input-label").css({"border-bottom":".1rem #66afe9 solid","background-color":"#66afe9"});
    }).blur(function () {
        var label = $(this).parent().parent().children(".sr-only");
        $(this).parent().children(".input-label").css({"border-bottom":".1rem white solid","background-color":"transparent"});
        if($(this).val() === ""){
            $(".tips").html(" *"+label.html()+"不能为空！");
        }
    });

    $(".submit").click(function () {
        var tag = 0;
        $(".input-style").each(function () {
            if($(this).val() === ""){
                tag = 1;
            }
        });
        if(tag === 0){
            $(".login-form").submit();
        }else {
            $(".tips").html(" *所填内容不能为空！");
        }
    });
});