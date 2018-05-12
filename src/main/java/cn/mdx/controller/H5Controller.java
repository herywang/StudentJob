package cn.mdx.controller;

import cn.mdx.pojo.*;
import com.github.pagehelper.PageInfo;
import cn.mdx.service.impl.TeacherService;
import cn.mdx.service.impl.WhTeacherServiceImp;
import cn.mdx.mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping("/h5")
public class H5Controller {
    @Autowired
    private WhTeacherServiceImp whTeacherServiceImp;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private TeacherMapper teacherMapper;

    /**
     * 进入登陆界面
     * @return
     */
    @RequestMapping("/LoginPage")
    public String returnLoginPage(){
        return "/h5/login";
    }

    /**
     * 登陆提交的controller
     * @param username 工号
     * @param password 密码
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/Login")
    public String Login(@RequestParam(value = "username",required = false)String username,
                        @RequestParam(value = "password",required = false)String password,
                        Model model, HttpServletRequest request){
        if(username ==null||password==null){
            return "/h5/login";
        }
        WUsers tea;
        tea =whTeacherServiceImp.userLoginCheck(username,password);
        if(tea==null){
            model.addAttribute("meg","密码或者用户名错误");
            return "/h5/login";
        }
        HttpSession session=request.getSession();
        session.setAttribute("user",tea.getUsername());
        request.setAttribute("user_id",tea.getId());
        return "forward:/h5/mainPage";
    }
    /**
     * 查看我的日志记录
     * @param user_id
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/MyDiary")
    public String geth5Diary(@RequestParam("user_id")Integer user_id, @RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
        WUsers tea = whTeacherServiceImp.getTeacherById(user_id);
        ArrayList<PageInfo<WDiary>> pageInfos = whTeacherServiceImp.getAllDiaryById(tea.getId(),pn);
        //全部日志W
        PageInfo<WDiary> pageInfo0 = pageInfos.get(0);
        model.addAttribute("pageInfo0",pageInfo0);
        //已审核日志
        PageInfo<WDiary> pageInfo1 = pageInfos.get(1);
        model.addAttribute("pageInfo1",pageInfo1);
        //未审核日志
        PageInfo<WDiary> pageInfo2 = pageInfos.get(2);
        model.addAttribute("pageInfo2",pageInfo2);
        //审核中
        PageInfo<WDiary> pageInfo3 = pageInfos.get(3);
        model.addAttribute("pageInfo3",pageInfo3);

        model.addAttribute("college",tea.getCollege());
        model.addAttribute("user_id",user_id);
        return "/h5/myDaily";
    }

    /**
     * 登陆成功进入主界面
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/mainPage")
    public String MainPage(Model model, HttpServletRequest request){
        Integer id = (Integer) request.getAttribute("user_id");
        if(id == null){
            id = Integer.parseInt(request.getParameter("user_id"));
        }
        if(id == null){
            return "h5/login";
        }
        WUsers tea = whTeacherServiceImp.getTeacherById(id);
        String time;
        if(tea.getImg()!=null){
            String user_img=tea.getImg();
            model.addAttribute("user_img",user_img);
        }
        int hours=new Date().getHours();
        if(hours<6||hours>18){
            time="晚上";
        }
        else if(hours>6&&hours<12){
            time="早上";
        }
        else if(hours>12&&hours<14){
            time="中午";
        }
        else {
            time="下午";
        }
        model.addAttribute("time",time);
        model.addAttribute("name",tea.getName());
        model.addAttribute("username",tea.getUsername());
        model.addAttribute("user_id",tea.getId());
        return "/h5/main";
    }
    /**
     * 进入添加日志界面
     */
    @RequestMapping("/DailyForm")
    public String DailyForm(@RequestParam("user_id")Integer user_id, Model model){
        model.addAttribute("user_id",user_id);
        return "/h5/DailyForm";
    }

    /**
     * 添加日志提交处理的controller
     * @param user_id 工号
     * @param location 工作地点
     * @param post 工作岗位
     * @param time 工作时长
     * @param myFile 图片上传
     * @param start_time 工作开始时间
     * @param content 工作日志记录
     * @return
     */
    @RequestMapping("/DailySubmit")
    public String DailySubmit(@RequestParam("user_id")Integer user_id, @RequestParam("log_loc")String location,
                              @RequestParam("log_post")String post, @RequestParam("time")String time,
                              @RequestParam("myFile")MultipartFile[] myFile, @RequestParam("log_time")String start_time,
                              @RequestParam("content")String content, HttpServletRequest request) throws IOException {

        if(time.endsWith("学时")){
            time = time.substring(0,time.length()-2);
        }
        whTeacherServiceImp.insertRecord(request,location,user_id,post,Double.parseDouble(time),myFile,start_time,content);
        return "forward:/h5/mainPage";
    }
    /**
     * 点击日志，查看详情
     */
    @RequestMapping("/detail")
    public String detail(@RequestParam("log_id")int log_id, @RequestParam("user_id")Integer user_id, Model model){
        DetailDiary detailDiary = whTeacherServiceImp.getDetailDiary(log_id);
        model.addAttribute("user_id",user_id);
        model.addAttribute("diary",detailDiary);
        return "/h5/details";
    }


    /**
     * 进入我的账户界面
     * @param user_id 工号
     * @param model
     * @return
     */
    @RequestMapping("/myCount")
    public String myCount(@RequestParam("username")Integer user_id, Model model){
        WUsers tea = teacherMapper.getTeacherById(user_id);
        model.addAttribute("teacher",tea);
        return "/h5/accountManage";
    }

    /**
     * 进入修改密码界面
     * @param user_id 工号
     * @param model
     * @return
     */
    @RequestMapping("/alterPwd")
    public String alterPwd(@RequestParam("username")String user_id, Model model){
        model.addAttribute("user_id",user_id);
        return "/h5/alterPassword";
    }

    /**
     * 修改密码提交的处理器
     * @param old_pwd
     * @param new_pwd1
     * @param new_pwd2
     * @param user_id
     * @param model
     * @return
     */
    @RequestMapping("/alterPwdSub")
    public String alterPwdSub(@RequestParam("old_pwd")String old_pwd, @RequestParam("new_pwd1")String new_pwd1,
                              @RequestParam("new_pwd2")String new_pwd2, @RequestParam("username") Integer user_id, Model model){
        if(!new_pwd1.equals(new_pwd2)){
            model.addAttribute("msg","两次输入密码不一致！");
            return "forward:/h5/alterPwd";
        }else {
            WUsers tea = teacherMapper.getTeacherById(user_id);
            if(!tea.getPassword().equals(old_pwd)){
                model.addAttribute("msg","原始密码错误，请重新输入");
                return "forward:/h5/alterPwd";
            }else {
                teacherMapper.updatePasswordById(new_pwd2,user_id);
                return "forward:/h5/myCount";
            }
        }
    }
    /**
     * 进入关于我们界面
     */
    @RequestMapping("/aboutUs")
    public String aboutUs(@RequestParam("username")String user_id, Model model){
        model.addAttribute("user_id",user_id);
        return "/h5/AboutUs";
    }
}
