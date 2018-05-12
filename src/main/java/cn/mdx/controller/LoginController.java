package cn.mdx.controller;

import cn.mdx.common.exceptions.CustomExceptionResolver;
import cn.mdx.common.utils.VerifyCode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;

@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    @RequestMapping("/lougout")
    public void logout(){
        logger.info("sdjlfkjsdlf");
    }

    @RequestMapping("/login")
    public String login(HttpSession session) throws IOException {
        session.setAttribute("user","品牌");
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
