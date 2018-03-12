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

    //比赛类别：1-论文，2-专利，3-国创科研，4-acm，5-数学建模，6-挑战杯，7-互联网＋,8-其他比赛
    @Column(name = "match_type")
    private Integer matchType;

    //比赛id（对应相应比赛表的id）
    @Column(name = "match_id")
    private Integer matchId;

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

    public Integer getMatchType() {
        return matchType;
    }

    public void setMatchType(Integer matchType) {
        this.matchType = matchType;
    }

    public Integer getMatchId() {
        return matchId;
    }

    public void setMatchId(Integer matchId) {
        this.matchId = matchId;
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
