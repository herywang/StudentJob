package cn.mdx.pojo;

import lombok.Data;

@Data
public class WUsers {
    private int id;//主键id
    private String username;//用户名，工号
    private String password;//pwd
    private int power;//权限，0管理员，1学工处，2普通用户
    private String phone;
    private String img;//头像图片
    private String college;//所属院系，单位
    private String name;//用户姓名

}
