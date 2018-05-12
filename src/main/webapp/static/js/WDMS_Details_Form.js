$(function() {
    var objUrl;
    var img_html;
    var img_div = $(".img_div");
    $(".isImg>img").each(function () {
        if($(this).width()>$(this).height()){
            var k=$(this).width()/$(this).height();
            $(this).css({"width":"150px","margin-top":(150-(150/k))*0.5+"px"});
        }else {
            $(this).css({"height":"150px"});
        }
    });

    $(".input-cover").click(function () {
        layer.msg('最多上传三张图片', {icon: 2});
    });
    $(".a-upload").on("change","input[name='file']",function() {
        if($(".isImg>img").length < 3){
            for(var i = 0; i < this.files.length; i++) {
                objUrl = getObjectURL(this.files[i]);

                img_html = "<div class='isImg'><img src='" + objUrl + "' /><button class='removeBtn' onclick='removeImg(this)'>x</button></div>";
                img_div.append(img_html);
                if($("input[name='file']").length < 3){
                    $(this).after('<input type="file" name="file"/>');
                }else{
                    $(this).after('<span class="input-cover"></span>');
                    $(".input-cover").css({"width":$(".a-upload").width()+"px","height":$(".a-upload").height()+"px"});
                }

                $(".isImg>img").each(function () {
                    var img = new Image();
                    var thisObj = $(this);
                    img.src = $(this).attr("src");
                    img.onload = function(){
                        if(img.width > img.height){
                            thisObj.css({"width":"150px","margin-top":(150-(150/(img.width/img.height)))*0.5+"px"});
                        }else {
                            thisObj.css({"height":"150px"});
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
    console.log($(r).parent().index());
    var old_img_length = $(".isImg>img").length;
    $("input[name='file']").eq($(r).parent().index()).remove();
    if(old_img_length === 3){
        $(".input-cover").remove();
        $("input[name='file']:last-child").after('<input type="file" name="file"/>');
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