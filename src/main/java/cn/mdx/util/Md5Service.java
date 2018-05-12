package cn.mdx.util;

import sun.misc.BASE64Encoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5Service {
	private Md5Service() {
	}
	public static String Md(String passWord){
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("md5");
			byte md5[]=md.digest(passWord.getBytes());//鑾峰彇鎸囩汗
			BASE64Encoder base64=new BASE64Encoder();
			return base64.encode(md5);
		} catch (NoSuchAlgorithmException e) {
		throw new RuntimeException();
		}//鑾峰彇md5绠楁硶
	}
}