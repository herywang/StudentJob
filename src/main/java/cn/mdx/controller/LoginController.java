package cn.mdx.controller;

import cn.mdx.common.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@Controller
public class LoginController {


    @RequestMapping("/login")
    public String login(HttpServletResponse response, HttpServletRequest request) throws IOException {
        
        return "error";
    }

    @RequestMapping("/verify")
    public void verify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        VerifyCode verifyCode = new VerifyCode();
        BufferedImage image = verifyCode.getImage();
        String code_text = verifyCode.getText().toLowerCase();
        String verifyName = "verifyCode";
        OutputStream outputStream = response.getOutputStream();
        request.getSession().setAttribute(verifyName,code_text);
        VerifyCode.output(image,outputStream);
    }




}
