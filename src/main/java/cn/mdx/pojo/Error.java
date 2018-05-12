package cn.mdx.pojo;

public class Error {
	private int r_code;
	private String e_msg;
	public int getR_code() {
		return r_code;
	}
	public void setR_code(int r_code) {
		this.r_code = r_code;
	}
	public String getE_msg() {
		return e_msg;
	}
	public void setE_msg(String e_msg) {
		this.e_msg = e_msg;
	}
	public Error() {
	}
	public Error(int r_code,String e_msg){
		this.r_code=r_code;
		this.e_msg=e_msg;
	}

}
