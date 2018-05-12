package cn.mdx.service.impl;

import cn.mdx.pojo.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.mdx.mapper.TeacherMapper;
import cn.mdx.util.MethodUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * Teacher 登陆service
 */
@Service
public class WhTeacherServiceImp {
    @Autowired
    TeacherMapper teacherMapper;

    /**
     * 通过id获取用户
     * @param user_id
     * @return
     */
    public WUsers getTeacherById(Integer user_id){
        return teacherMapper.getTeacherById(user_id);
    }
    /**
     * 用户登陆处理的service
     */
    public WUsers userLoginCheck(String username,String password){
        return teacherMapper.getUserByLoginMsg(username,password);
    }
    /**
     * 获取老师的日志
     */
    public ArrayList<PageInfo<WDiary>> getAllDiaryById(int user_id, int pn){
        ArrayList<PageInfo<WDiary>> pageInfos = new ArrayList<>();
        PageHelper.startPage(pn,100);
        ArrayList<WDiary> diaries0 = teacherMapper.getAllDiaryById(user_id);
        PageInfo<WDiary> pageInfo0 = new PageInfo<WDiary>(diaries0);

        PageHelper.startPage(pn,100);
        ArrayList<WDiary> diaries1 = teacherMapper.getYDiaryById(user_id);
        PageInfo<WDiary> pageInfo1 = new PageInfo<WDiary>(diaries1);

        PageHelper.startPage(pn,100);
        ArrayList<WDiary> diaries2 = teacherMapper.getWDiaryById(user_id);
        PageInfo<WDiary> pageInfo2 = new PageInfo<WDiary>(diaries2);

        PageHelper.startPage(pn,100);
        ArrayList<WDiary> diaries3 = teacherMapper.getSDiaryById(user_id);
        PageInfo<WDiary> pageInfo3 = new PageInfo<WDiary>(diaries3);

        pageInfos.add(pageInfo0);
        pageInfos.add(pageInfo1);
        pageInfos.add(pageInfo2);
        pageInfos.add(pageInfo3);
        return pageInfos;
    }

    /**
     * h5手机界面信息,上传一条记录
     */
    public void insertRecord(HttpServletRequest request,String location,Integer user_id,
                             String post, Double time, MultipartFile[] image, String start_time,
                             String content) throws IOException {
        //上传文件
        WUsers user = teacherMapper.getTeacherById(user_id);
        StringBuilder sb = new StringBuilder();
        MethodUtil.getFilePath(request,image,sb,user.getUsername());
        start_time = start_time+":00";
        teacherMapper.insertRecord(user_id,location,post,time,sb.toString(),content,start_time);
    }
    /**
     * h5界面查看日志详细信息
     */
    public DetailDiary getDetailDiary(int log_id){
        DetailDiary detailDiary = teacherMapper.getDetailDiary(log_id);
        String image = detailDiary.getImage();
        String[] images = image.split("&&");
        ArrayList<String> aimages = new ArrayList<String>(Arrays.asList(images));
        detailDiary.setImages(aimages);
        return detailDiary;
    }
}
