package com.nenu.info.common.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 科研项目
 * @author: software-liuwang
 * @time: 2017/11/5 20:23
 * @description :
 */

@Entity
@Table(name = "t_scientific_project")
public class ScienetificProject {

    //id
    @Id
    private Integer id;

    //项目名
    @Column(name = "project_name")
    private String projectName;

    //项目类型(0-未知; 1-一般培育项目; 2-专项计划项目; 3-重点培育项目; 4-国创)
    @Column(name = "project_type")
    private Integer projectType;

    //立项时间
    @Column(name = "set_time")
    private Date setTime;

    //项目负责人id
    @Column(name = "project_man_id")
    private Integer projectManId;

    //项目成员1的id
    @Column(name = "project_member_id_1")
    private Integer projectMemberId1;

    //项目成员2的id
    @Column(name = "project_member_id_2")
    private Integer projectMemberId2;

    //项目成员3的id
    @Column(name = "project_member_id_")
    private Integer projectMemberId3;

    //项目成员4的id
    @Column(name = "project_member_id_4")
    private Integer projectMemberId4;

    //指导教师id
    @Column(name = "teacher_id")
    private Integer teacherId;

    //经费额度
    @Column(name = "funds_limit")
    private Integer fundsLimit;

    //项目简介
    @Column(name = "project_introduce")
    private String projectIntroduce;

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

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Integer getProjectType() {
        return projectType;
    }

    public void setProjectType(Integer projectType) {
        this.projectType = projectType;
    }

    public Date getSetTime() {
        return setTime;
    }

    public void setSetTime(Date setTime) {
        this.setTime = setTime;
    }

    public Integer getProjectManId() {
        return projectManId;
    }

    public void setProjectManId(Integer projectManId) {
        this.projectManId = projectManId;
    }

    public Integer getProjectMemberId1() {
        return projectMemberId1;
    }

    public void setProjectMemberId1(Integer projectMemberId1) {
        this.projectMemberId1 = projectMemberId1;
    }

    public Integer getProjectMemberId2() {
        return projectMemberId2;
    }

    public void setProjectMemberId2(Integer projectMemberId2) {
        this.projectMemberId2 = projectMemberId2;
    }

    public Integer getProjectMemberId3() {
        return projectMemberId3;
    }

    public void setProjectMemberId3(Integer projectMemberId3) {
        this.projectMemberId3 = projectMemberId3;
    }

    public Integer getProjectMemberId4() {
        return projectMemberId4;
    }

    public void setProjectMemberId4(Integer projectMemberId4) {
        this.projectMemberId4 = projectMemberId4;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getFundsLimit() {
        return fundsLimit;
    }

    public void setFundsLimit(Integer fundsLimit) {
        this.fundsLimit = fundsLimit;
    }

    public String getProjectIntroduce() {
        return projectIntroduce;
    }

    public void setProjectIntroduce(String projectIntroduce) {
        this.projectIntroduce = projectIntroduce;
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
