package com.nenu.info.common.entities.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 指导教师
 * @author: software-liuwang
 * @time: 2017/11/4 19:46
 * @description :
 */
@Entity
@Table(name = "t_teacher")
public class Teacher {

    //id
    @Id
    private Integer id;

    //教师姓名
    @Column(name = "teacher_name")
    private String teacherName;

    //教师等级(1-助教; 2-讲师; 3-副教授; 4-教授; 5-未知)
    @Column(name = "teacher_level")
    private Integer teacherLevel;

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

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public Integer getTeacherLevel() {
        return teacherLevel;
    }

    public void setTeacherLevel(Integer teacherLevel) {
        this.teacherLevel = teacherLevel;
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
