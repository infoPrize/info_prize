package com.nenu.info.common.entities.category;

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

    //专利类别(1-发明专利; 2-实用新型专利; 3-外观设计专利; 4-未知; )
    @Column(name = "patent_type")
    private Integer patentType;

    //专利申请者1id
    @Column(name = "owner_id_1")
    private Integer ownerId1;

    //专利申请者2id
    @Column(name = "owner_id_2")
    private Integer ownerId2;

    //专利申请者3id
    @Column(name = "owner_id_3")
    private Integer ownerId3;

    //专利申请者4id
    @Column(name = "owner_id_4")
    private Integer ownerId4;

    //专利申请者5id
    @Column(name = "owner_id_5")
    private Integer ownerId5;

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

    public Integer getOwnerId1() {
        return ownerId1;
    }

    public void setOwnerId1(Integer ownerId1) {
        this.ownerId1 = ownerId1;
    }

    public Integer getOwnerId2() {
        return ownerId2;
    }

    public void setOwnerId2(Integer ownerId2) {
        this.ownerId2 = ownerId2;
    }

    public Integer getOwnerId3() {
        return ownerId3;
    }

    public void setOwnerId3(Integer ownerId3) {
        this.ownerId3 = ownerId3;
    }

    public Integer getOwnerId4() {
        return ownerId4;
    }

    public void setOwnerId4(Integer ownerId4) {
        this.ownerId4 = ownerId4;
    }

    public Integer getOwnerId5() {
        return ownerId5;
    }

    public void setOwnerId5(Integer ownerId5) {
        this.ownerId5 = ownerId5;
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
