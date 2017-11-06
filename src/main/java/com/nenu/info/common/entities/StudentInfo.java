package com.nenu.info.common.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 学生信息
 * @author: software-liuwang
 * @time: 2017/11/6 10:46
 * @description :
 */

@Entity
@Table(name = "t_student_info")
public class StudentInfo {

    //id
    @Id
    private Integer id;

    //学生姓名
    @Column(name = "name")
    private String name;

    //性别(0-男; 1-女)
    @Column(name = "sex")
    private Integer sex;

    //年级
    @Column(name = "grade")
    private String grade;

    //专业代码
    @Column(name = "major_code")
    private Integer majorCode;

    //电话号码
    @Column(name = "phone")
    private String phone;

    //创建时间
    @Column(name = "create_time")
    private Date createTime;

    //最后修改时间
    @Column(name = "last_modified_time")
    private Date lastModifiedTime;

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

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Integer getMajorCode() {
        return majorCode;
    }

    public void setMajorCode(Integer majorCode) {
        this.majorCode = majorCode;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastModifiedTime() {
        return lastModifiedTime;
    }

    public void setLastModifiedTime(Date lastModifiedTime) {
        this.lastModifiedTime = lastModifiedTime;
    }
}
