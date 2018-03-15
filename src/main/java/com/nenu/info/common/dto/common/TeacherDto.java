package com.nenu.info.common.dto.common;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 11:09
 * @description : 教师dto
 */
public class TeacherDto {

    private Integer id;

    //教师姓名
    private String teacherName;

    //教师等级
    private String teacherLevel;

    //电话号码
    private String phone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherLevel() {
        return teacherLevel;
    }

    public void setTeacherLevel(String teacherLevel) {
        this.teacherLevel = teacherLevel;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
