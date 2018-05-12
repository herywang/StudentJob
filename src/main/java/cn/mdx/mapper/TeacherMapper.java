package cn.mdx.mapper;

import cn.mdx.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface TeacherMapper {
	
	//这是安卓端对老师密码的修改
	public void chanegPasswordById(@Param("password") String password, @Param("user_id") String user_id);

	public Teacher findTeacherByIdAndPassword(@Param("password") String password, @Param("user_id") String user_id);

	public String findPasswordById(@Param("user_id") String user_id);
	//修改安卓照片
	public void setAndroidImg(@Param("sb") String sb, @Param("user_id") String user_id);

	public void setAndroidPassword(@Param("password") String password, @Param("user_id") String user_id);

	public String getImgPahtById(@Param("user_id") String user_id);


    public Teacher getTeacherByThree(@Param("college") String college, @Param("user_id") String user_id, @Param("user_name") String user_name);

    /**
     * 通过id获取teacher
     */
    public WUsers getTeacherById(@Param("user_id") Integer user_id);
    /**
     * 通过suer_id get all diary
     */
    public ArrayList<WDiary> getAllDiaryById(@Param("user_id") int id);

    /**
     * 获取已审核日志
     */
    public ArrayList<WDiary> getYDiaryById(@Param("user_id") int id);
    /**
     * 获取未审核
     */
    public ArrayList<WDiary> getWDiaryById(@Param("user_id") int id);
    /**
     * 获取审核中日志
     */
    public ArrayList<WDiary> getSDiaryById(@Param("user_id") int id);
    /**
     * 插入提交的数据
     */
   public void insertRecord(@Param("user_id") int id, @Param("location") String location,
                             @Param("post") String log_post, @Param("time") Double time,
                             @Param("image") String image, @Param("content") String content,
                             @Param("start_time") String log_time);
    /**
     * h5 界面查看日志详细信息
     */
    public DetailDiary getDetailDiary(@Param("log_id") int log_id);
    /**
     * h5界面修改密码
     */
    public void updatePasswordById(@Param("pwd")String pwd,@Param("id")int id);
    /**
     * 通过用户名和密码查找用户
     */
    public WUsers getUserByLoginMsg(@Param("username")String username,@Param("password")String password);
}
