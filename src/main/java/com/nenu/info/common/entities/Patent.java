package com.nenu.info.common.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 专利
 * @author: software-liuwang
 * @time: 2017/11/6 10:36
 * @description :
 */

@Entity
@Table(name = "t_patent")
public class Patent {

    //id
    @Id
    private Integer id;

    //专利名
    @Column(name = "patent_name")
    private String patentName;

    //专利类别(0-未知; 1-发明专利; 2-实用新型专利; 3-外观设计专利)
    @Column(name = "patent_type")
    private Integer patentType;

    //专利申请者id
    @Column(name = "owner_id")
    private Integer ownerId;

    //其他专利申请者
    @Column(name = "other_owner")
    private String otherOwner;

    //申请时间
    @Column(name = "apply_time")
    private Date applyTime;

    //指导教师id
    @Column(name = "teacher_id")
    private Integer teacherId;

    //专利简介
    @Column(name = "patent_introduce")
    private String patentIntroduce;

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

    public String getPatentName() {
        return patentName;
    }

    public void setPatentName(String patentName) {
        this.patentName = patentName;
    }

    public Integer getPatentType() {
        return patentType;
    }

    public void setPatentType(Integer patentType) {
        this.patentType = patentType;
    }

    public Integer getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(Integer ownerId) {
        this.ownerId = ownerId;
    }

    public String getOtherOwner() {
        return otherOwner;
    }

    public void setOtherOwner(String otherOwner) {
        this.otherOwner = otherOwner;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public String getPatentIntroduce() {
        return patentIntroduce;
    }

    public void setPatentIntroduce(String patentIntroduce) {
        this.patentIntroduce = patentIntroduce;
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
