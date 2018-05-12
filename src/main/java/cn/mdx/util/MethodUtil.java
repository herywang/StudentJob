package cn.mdx.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class MethodUtil {
	public static int PAGESIZE=8;
	 /**
     * 获取时间戳字符串
     */
    public static String getTimer(){
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        return format.format(date);
    }
    
    
    /**
     * 获取随机数字符串
     */
    public static String getRandom(int a){
        Random random = new Random();
        StringBuilder buffer = new StringBuilder("");
        for (int i = 0;i<a;i++){
            int b = random.nextInt(10);
            buffer.append(b).append("");
        }
        return buffer.toString();
    }
    public static String Mkdir(HttpServletRequest request, String user_id) {
        String realURL = request.getServletContext().getRealPath("");
        String DirUrl=realURL.replace("\\","\\\\");
        File file = new File(DirUrl+"static\\img\\" + user_id);
        if (!file.exists() && !file.isDirectory()) {
            System.out.print("");
            file.mkdirs();
        }
        return realURL;
    }
    public static String File(HttpServletRequest request,String user_id,int log_id){
        String realURL = request.getServletContext().getRealPath("");
        String DirUrl=realURL.replace("\\","\\\\");
        File file = new File(DirUrl+"static\\img\\" + user_id+"\\"+log_id);
        if (!file.exists() && !file.isDirectory()) {
            System.out.print("");
            file.mkdirs();
        }
        return realURL;
    }

	/**
     * 获取文件路径并将文件写入磁盘
     */
    public static void getFilePath(HttpServletRequest request, MultipartFile[] files, StringBuilder sb,String user_id) throws IOException {
       String realURL= Mkdir(request,user_id);
        for(MultipartFile f:files){
            if(f.getOriginalFilename().length()>0){
                String originalFilename = f.getOriginalFilename();
                String newFilename = MethodUtil.getTimer()+ MethodUtil.getRandom(4)+originalFilename.substring(originalFilename.lastIndexOf("."));
                File newFile = new File(realURL+"/static/img/"+user_id+"/"+newFilename);
                f.transferTo(newFile);
                sb.append("/Teacher/static/img/"+user_id+"/").append(newFilename).append("&&");
            }
        }
        while (sb.toString().endsWith("&&")){
            sb.replace(sb.length()-2,sb.length(),"");
        }
    }
    public static void getDirPath(HttpServletRequest request, MultipartFile[] files, StringBuilder sb,String user_id,int log_id) throws IOException {
        String realURL=File(request,user_id,log_id);
        for(MultipartFile f:files){
            if(f.getOriginalFilename().length()>0){
                String originalFilename = f.getOriginalFilename();
                realURL = request.getServletContext().getRealPath("");
                String newFilename = MethodUtil.getTimer()+ MethodUtil.getRandom(4)+originalFilename.substring(originalFilename.lastIndexOf("."));
                File newFile = new File(realURL+"/static/img/"+user_id+"/"+log_id+"/"+newFilename);
                f.transferTo(newFile);
                sb.append("/Teacher/static/img/"+user_id+"/"+log_id+"/").append(newFilename).append("&&");
            }
        }
        while (sb.toString().endsWith("&&")){
            sb.replace(sb.length()-2,sb.length(),"");
        }
    }
//    public static void getFilePath(HttpServletRequest request, MultipartFile file, StringBuilder sb) throws IOException {
//        if(file != null && !file.isEmpty()) {
//            String originalFilename = file.getOriginalFilename();
//            String realURL = request.getServletContext().getRealPath("");
//            String newFilename = MethodUtil.getTimer() + MethodUtil.getRandom(4) + originalFilename.substring(originalFilename.lastIndexOf("."));
//            File newFile = new File(realURL + "/static/img/" + newFilename);
//            file.transferTo(newFile);
//            sb.append("/Teacher/static/img/").append(newFilename);
//        }
//        else{
//
//        }
//    }
    /**
     * 删除文件
     */
    public static void deleteFileFromDisk(HttpServletRequest request, String path){
        String realURL = request.getServletContext().getRealPath("");
        if(path != null && !path.equals("")){
            String[] paths = path.split("&&");
            for(String mypath:paths){
                if(mypath.startsWith("/Teacher")){
                    mypath = mypath.substring(8);
                }
                File file = new File(realURL+mypath);
                if (file.exists()){
                    file.delete();
                }
            }
        }

    }
    public static void MkdirDelete(HttpServletRequest request,String realPath){
        String realUrl=request.getServletContext().getRealPath("");
        String DirUrl=realUrl.replace("\\","\\\\");
        File file = new File(DirUrl+"static\\img\\"+realPath);

    }

    public static String[] SubSting(String sub){
    	return sub.split("&&");
    }

	public static void setImgSmaller() {
		// TODO Auto-generated method stub
		
	}


	public static int getPAGESIZE() {
	        return PAGESIZE;
	}

    public static String Change(String log_time) {
        return log_time.replace('/', '-');
    }

    public static void delFolder(String folderPath) {
        try {
            File file=new File(folderPath);
            if(file.exists()) {
                delAllFile(folderPath); //删除完里面所有内容
                String filePath = folderPath;
                filePath = filePath.toString();
                File myFilePath = new File(filePath);
            }
            else{
                return ;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //删除指定文件夹下的所有文件

    public static boolean delAllFile(String path) {
        boolean flag = false;
        File file = new File(path);
        if (!file.exists()) {
            return flag;
        }
        if (!file.isDirectory()) {
            return flag;
        }
        String[] tempList = file.list();
        File temp = null;
        for (int i = 0; i < tempList.length; i++) {
            if (path.endsWith(File.separator)) {
                temp = new File(path + tempList[i]);
            } else {
                temp = new File(path + File.separator + tempList[i]);
            }
            if (temp.isFile()) {
                temp.delete();
            }
            if (temp.isDirectory()) {
                delAllFile(path + "/" + tempList[i]);//先删除文件夹里面的文件
                delFolder(path + "/" + tempList[i]);//再删除空文件夹
                flag = true;
            }
        }
        return flag;
    }

    public static String getDate(){
        Date date=new Date();
        SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return simple.format(date);
    }
}


