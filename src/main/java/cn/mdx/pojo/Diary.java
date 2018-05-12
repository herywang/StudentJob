package cn.mdx.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Diary {
	private String log_location;//工作地点
	private String log_title;//日志标题
	private String user_id;//工号
	private String log_picture;//图片的路径
	private String log_content;//工作内容
	private String user_name;//老师的名字
	private float log_period;//工作总时长
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date log_time;//工作的开始时间
	private int  log_state;//工作审核 1 未审核 2 审核中 3审核完成的优 4 良 5 合格 6 不合格    其中1可以删除修改 233456都不可以再修改
	private int log_id;
	private String log_pos;//工作岗位
	private String college;
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getLog_pos() {
		return log_pos;
	}
	public void setLog_pos(String log_pos) {
		this.log_pos = log_pos;
	}
	public int getLog_id() {
		return log_id;
	}
	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}
	public Date getLog_time() {
		return log_time;
	}
	public void setLog_time(Date log_time) {
		this.log_time = log_time;
	}
	public String getLog_location() {
		return log_location;
	}
	public void setLog_location(String log_location) {
		this.log_location = log_location;
	}
	public String getLog_title() {
		return log_title;
	}
	public void setLog_title(String log_title) {
		this.log_title = log_title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getLog_picture() {
		return log_picture;
	}
	public void setLog_picture(String log_picture) {
		this.log_picture = log_picture;
	}
	public String getLog_content() {
		return log_content;
	}
	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public float getLog_period() {
		return log_period;
	}
	public void setLog_period(float log_period) {
		this.log_period = log_period;
	}
	public int getLog_state() {
		return log_state;
	}
	public void setLog_state(int log_state) {
		this.log_state = log_state;
	}

	public Diary(String log_location, String log_title, String user_id,
				 String log_picture, String log_content, String user_name,
				 float log_period, Date log_time, int log_state, int log_id,
				 String log_pos, String college) {
		this.log_location = log_location;
		this.log_title = log_title;
		this.user_id = user_id;
		this.log_picture = log_picture;
		this.log_content = log_content;
		this.user_name = user_name;
		this.log_period = log_period;
		this.log_time = log_time;
		this.log_state = log_state;
		this.log_id = log_id;
		this.log_pos = log_pos;
		this.college = college;
	}

	public Diary() {
	}
}
