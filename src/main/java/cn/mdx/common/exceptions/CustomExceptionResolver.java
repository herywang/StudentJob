package cn.mdx.common.exceptions;


import cn.mdx.common.beans.ResultBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CustomExceptionResolver implements HandlerExceptionResolver {
    private static final Logger logger = LoggerFactory.getLogger(CustomExceptionResolver.class);
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        ModelAndView modelAndView = new ModelAndView();
        logger.error("引起方法：[{}]",o);

        if (e instanceof CheckException || e instanceof IllegalArgumentException) {
            modelAndView.addObject("info","CheckException");
        } else {
            logger.error(e.getMessage());
            // TODO 未知的异常，应该格外注意，可以发送邮件通知等
            modelAndView.addObject("info","未知异常，请与管理员联系。");
        }
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
