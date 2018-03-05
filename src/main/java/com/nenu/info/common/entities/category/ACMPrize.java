package com.nenu.info.common.entities.category;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - ACM获奖
 * @author: software-liuwang
 * @time: 2017/11/5 19:40
 * @description :
 */

@Entity
@Table(name = "t_acm_prize")
public class ACMPrize {

    //id
    @Id
    private Integer id;

    //比赛名称
    @Column(name = "match_name")
    private String matchName;

    //比赛等级(0-校级; 1-市级; 2-省级; 3-多省级; 4-国家级; 5-亚洲级; 6-国际级)
    @Column(name = "match_level")
    private Integer matchLevel;

    //主办单位
    @Column(name = "host_unit")
    private String hostUnit;

    //队伍名
    @Column(name = "team_name")
    private String teamName;

    //队员1的id
    @Column(name = "teammate_id_1")
    private Integer teammateId1;

    //队员2的id
    @Column(name = "teammate_id_2")
    private Integer teammateId2;

    //队员3的id
    @Column(name = "teammate_id_3")
    private Integer teammateId3;

    //获奖等级(1-一等奖，2-二等奖，3-三等奖，4-优胜奖)
    @Column(name = "prize_level")
    private Integer prizeLevel;

    //获奖时间
    @Column(name = "prize_time")
    private Date prizeTime;

    //指导教师id
    @Column(name = "teacher_id")
    private Integer teacherId;

    //创建时间
    @Column(name = "create_time")
    private Date createTime;

    //最后修改时间
    @Column(name = "last_modified_time")
    private Date lastModifiedTime;

    //是否已删除
    @Column(name = "is_deleted")
    private Integer isDeleted;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMatchName() {
        return matchName;
    }

    public void setMatchName(String matchName) {
        this.matchName = matchName;
    }

    public Integer getMatchLevel() {
        return matchLevel;
    }

    public void setMatchLevel(Integer matchLevel) {
        this.matchLevel = matchLevel;
    }

    public String getHostUnit() {
        return hostUnit;
    }

    public void setHostUnit(String hostUnit) {
        this.hostUnit = hostUnit;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public Integer getTeammateId1() {
        return teammateId1;
    }

    public void setTeammateId1(Integer teammateId1) {
        this.teammateId1 = teammateId1;
    }

    public Integer getTeammateId2() {
        return teammateId2;
    }

    public void setTeammateId2(Integer teammateId2) {
        this.teammateId2 = teammateId2;
    }

    public Integer getTeammateId3() {
        return teammateId3;
    }

    public void setTeammateId3(Integer teammateId3) {
        this.teammateId3 = teammateId3;
    }

    public Integer getPrizeLevel() {
        return prizeLevel;
    }

    public void setPrizeLevel(Integer prizeLevel) {
        this.prizeLevel = prizeLevel;
    }

    public Date getPrizeTime() {
        return prizeTime;
    }

    public void setPrizeTime(Date prizeTime) {
        this.prizeTime = prizeTime;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
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

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }
}