package cn.mdx.pojo;

import lombok.Data;

import java.util.Date;
@Data
public class WDiary {
    private int id;//主键id
    private String user_id;//对应用户id
    private Date start_time;//开始时间
    private Double time;//工作学时
    private String content;//工作内容记录
    private String post;//工作岗位
    private String image;//图片
    private int state;//日志状态
    private String location;//工作地点
}
