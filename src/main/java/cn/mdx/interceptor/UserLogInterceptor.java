package cn.mdx.interceptor;

import cn.mdx.common.utils.UserUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class UserLogInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        fillUserInfo((HttpServletRequest) httpServletRequest);
        return true;
    }

    private void clearAllUserInfo() {
        UserUtil.clearAllUserInfo();
    }

    private void fillUserInfo(HttpServletRequest request) {
        // 用户信息
        String user = getUserFromSession(request);

        if (user != null) {
            UserUtil.setUser(user);
        }

        // 语言信息
        String locale = getLocaleFromCookies(request);

        // 放入到threadlocal，同一个线程任何地方都可以拿出来
        if (locale != null) {
            UserUtil.setLocale(locale);
        }
    }

    private String getLocaleFromCookies(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();

        if (cookies == null) {
            return null;
        }

        for (int i = 0; i < cookies.length; i++) {
            if (UserUtil.KEY_LANG.equals(cookies[i].getName())) {
                return cookies[i].getValue();
            }
        }

        return null;
    }

    private String getUserFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session == null) {
            return null;
        }
        // 从session中获取用户信息放到工具类中
        return (String) session.getAttribute(UserUtil.KEY_USER);
    }



    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        // 由于tomcat线程重用，记得清空
        clearAllUserInfo();
    }

}
