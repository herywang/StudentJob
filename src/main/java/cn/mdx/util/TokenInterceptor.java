package cn.mdx.util;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import cn.mdx.pojo.boss;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TokenInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
                                HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object arg2) throws Exception {
		// TODO Auto-generated method stub
		
		String urlString = request.getRequestURI();
		
		if(urlString.contains("Teacher/"))
		{
			boss admin=(boss)request.getSession().getAttribute("admin");
			
			if(admin==null)
			{
				request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
				
				return false;
			}
			else
			{
				return true;
			}
			
		}
		
		if(urlString.contains("admin/"))
		{
			boss boss=(boss)request.getSession().getAttribute("boss");
			
			if(boss==null)
			{
				request.getRequestDispatcher("/jsp/index_login.jsp").forward(request, response);
				
				return false;
			}
			else
			{
				return true;
			}
			
		}
		return true;
	}
	 
	
	 
}
 