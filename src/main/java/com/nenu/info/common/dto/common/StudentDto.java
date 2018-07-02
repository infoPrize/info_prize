package com.nenu.info.common.dto.common;

/**
 * StudentDto
 * 用于条件查询后的列表展示
 *
 * @author zhaiaxin
 * @time: 2017/12/19 10:38.
 */
public class StudentDto {

    //id
    private Integer id;

    //学生姓名
    private String name;

    //性别(1-男; 2-女)
    private String sex;

    //学号
    private String stuNumber;

    //年级
    private String grade;

    //专业
    private String major;

    //电话号码
    private String phone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStuNumber() {
        return stuNumber;
    }

    public void setStuNumber(String stuNumber) {
        this.stuNumber = stuNumber;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

}
