package cn.mdx.pojo;

public class boss {
	private int power;
	private String college;
	private String password;
	private String id;
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setLogin_number(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "boss [power=" + power + ", college=" + college + ", password=" + password + ", id=" + id + "]";
	}
	
}
