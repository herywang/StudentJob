$(function () {
    var input_style = $(".input-style");
    var input_height = input_style.height();
    var input_label=$(".input-label");
    input_label.css({"height":input_height+"px","line-height":input_height+"px","padding":"6px 12px"});
    function inputCheck(e) {
        if(e != null){
            if(e.val() == ""){
                $(".input-tips").html("*所填内容不能为空");
                return false;
            } else{
                $(".input-tips").html("&nbsp;");
                return true;
            }
        }else {
            if($("#inputOldPassword").val() == "" || $("#inputNewPassword").val() == "" || $("#inputPasswordAgain").val() == ""){
                $(".input-tips").html("*所填内容不能为空");
                return false;
            } else{
                $(".input-tips").html("&nbsp;");
                return true;
            }
        }
    }
    input_style.focus(function () {
        $(this).parent().find("label").css({"height":"20px","line-height":"20px","padding":"0","margin-top":"-20px","font-size":"1.2rem"});
    }).blur(function () {
        inputCheck($(this));
        if($(this).val() == ""){
            $(this).parent().find("label").css({"height":input_height+"px","line-height":input_height+"px","padding":"6px 12px","margin-top":"0","font-size":"1.4rem"});
        }
    });
    $(".submit-btn").click(function () {
       if(inputCheck(null)){
           $(".alter-form").submit();
       }
    });
});