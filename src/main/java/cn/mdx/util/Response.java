package cn.mdx.util;

import cn.mdx.pojo.Error;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Response {
	private Response(){
	}
	
	public static void ResponseError(HttpServletResponse response, PrintWriter out) throws IOException{
		Error error = new Error();
		error.setE_msg("");
		error.setR_code(0);
		String Response=JSONUtils.aliToJSONString(error);
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		out = response.getWriter();
		out.write(Response);
		out.flush();
		out.close();
	}
}
