package com.nenu.info.common.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 专业代码
 * @author: software-liuwang
 * @time: 2017/11/5 19:54
 * @description :
 */

@Entity
@Table(name = "t_major_code")
public class MajorCode {

    //id
    @Id
    private Integer id;

    //专业代码
    @Column(name = "major_code")
    private Integer majorCode;

    //专业名称
    @Column(name = "major_name")
    private String majorName;

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

    public Integer getMajorCode() {
        return majorCode;
    }

    public void setMajorCode(Integer majorCode) {
        this.majorCode = majorCode;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
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
