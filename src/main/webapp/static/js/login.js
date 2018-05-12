$(function () {
    var account = $("#account");
    var password = $("#password");
    function setContentLocation() {
        var login_block = $(".login-form-block");
        if($(window).height() > login_block.height()){
            $(".page-body").css({"height":($(window).height())+"px"});
            login_block.css({"margin-top":($(window).height()-login_block.height())*0.5+"px"});
        }else {
            $(".page-body").css({"height":(login_block.height()+40)+"px"});
            login_block.css({"margin-top":"20px"});
        }
    }
    function accountTip() {
        if($("#account").val() == ""){
            $(".account-tips").text("*账号不能为空");
            return false;
        }else {
            // $(".account-tips").text("&nbsp;");
            return true;
        }
    }
    function passwordTip() {
        if($("#password").val() == ""){
            $(".password-tips").text("*密码不能为空");
            return false;
        }else {
            // $(".password-tips").text("&nbsp;");
            return true;
        }
    }
    account.blur(function () {
        accountTip();
    });
    password.blur(function () {
        passwordTip();
    });
    $(".submit-button-style").click(function () {
       if(accountTip() && passwordTip()){
           $(".login-form").submit();
       }else{
           accountTip();
           passwordTip();
       }
    });

    setContentLocation();
    $(window).resize(function () {
        setContentLocation();
    });
});