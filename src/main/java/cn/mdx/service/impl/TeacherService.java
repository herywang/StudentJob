package cn.mdx.service.impl;

import cn.mdx.mapper.TeacherMapper;
import cn.mdx.pojo.WUsers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import cn.mdx.pojo.Teacher;
import cn.mdx.util.MethodUtil;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@Service
public class TeacherService {
		@Autowired
		private TeacherMapper teacherMapper;
		
		public void setAndroidPassword(String password,String user_id){
			teacherMapper.setAndroidPassword(password,user_id);
		}
		public Teacher findTeacherByIdAndPassword(String password, String user_id){
			return teacherMapper.findTeacherByIdAndPassword(password,user_id);
		}
		public String findPasswordById(String user_id){
			return teacherMapper.findPasswordById(user_id);
		}
		public void setAndroidImg(HttpServletRequest request, MultipartFile[] files, String user_id) throws IOException{
			StringBuilder sb=new StringBuilder();
			MethodUtil.getFilePath(request, files, sb,user_id);
			teacherMapper.setAndroidImg(sb.toString(),user_id);
		}
		public  String getImgPathById(String user_id) {
			return teacherMapper.getImgPahtById(user_id);
		}


//    	public WUsers getTeacherByThree(String user_id) {
//			return teacherMapper.getTeacherById(user_id);
//    }
}
