package com.nenu.info.common.entities.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * Material - 材料实体类
 *
 * @author zhaiaxin
 * @time: 2018/3/8 15:22.
 */
@Entity
@Table(name = "t_material")
public class Material {


    @Id
    private Integer id;

    //论文的id
    @Column(name = "thesis_id")
    private Integer thesisId;

    //专利的id
    @Column(name = "patent_id")
    private Integer patentId;

    //国创科研的id
    @Column(name = "scientific_id")
    private Integer scientificId;

    //acm的id
    @Column(name = "acm_id")
    private Integer acmId;

    //数学建模的id
    @Column(name = "math_id")
    private Integer mathId;

    //互联网加的id
    @Column(name = "internet_id")
    private Integer internetId;

    //挑战杯的id
    @Column(name = "challenge_id")
    private Integer challengeId;

    //材料名称
    @Column(name = "material_name")
    private String materialName;

    //材料路径
    @Column(name = "material_url")
    private String materialUrl;

    //是否已经删除：0-否，1-是
    @Column(name = "is_deleted")
    private Integer isDeleted;

    //创建时间
    @Column(name = "created_time")
    private Date createdTime;

    //最后修改时间
    @Column(name = "last_modified_time")
    private Date lastModifiedTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getThesisId() {
        return thesisId;
    }

    public void setThesisId(Integer thesisId) {
        this.thesisId = thesisId;
    }

    public Integer getPatentId() {
        return patentId;
    }

    public void setPatentId(Integer patentId) {
        this.patentId = patentId;
    }

    public Integer getScientificId() {
        return scientificId;
    }

    public void setScientificId(Integer scientificId) {
        this.scientificId = scientificId;
    }

    public Integer getAcmId() {
        return acmId;
    }

    public void setAcmId(Integer acmId) {
        this.acmId = acmId;
    }

    public Integer getMathId() {
        return mathId;
    }

    public void setMathId(Integer mathId) {
        this.mathId = mathId;
    }

    public Integer getInternetId() {
        return internetId;
    }

    public void setInternetId(Integer internetId) {
        this.internetId = internetId;
    }

    public Integer getChallengeId() {
        return challengeId;
    }

    public void setChallengeId(Integer challengeId) {
        this.challengeId = challengeId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getMaterialUrl() {
        return materialUrl;
    }

    public void setMaterialUrl(String materialUrl) {
        this.materialUrl = materialUrl;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public Date getLastModifiedTime() {
        return lastModifiedTime;
    }

    public void setLastModifiedTime(Date lastModifiedTime) {
        this.lastModifiedTime = lastModifiedTime;
    }
}
