package cn.mdx.pojo;

public class Teacher {
	//job_id索引到老师 
	private String user_id;
	private String password;
	private String user_name;
	private String phone;
	private String user_img;
	private String college;

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
//	public String getJob_pos() {
//		return job_pos;
//	}
//	public void setJob_pos(String job_pos) {
//		this.job_pos = job_pos;
//	}

	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}

}
