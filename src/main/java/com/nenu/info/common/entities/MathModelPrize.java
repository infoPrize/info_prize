package com.nenu.info.common.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 数学建模
 * @author: software-liuwang
 * @time: 2017/11/6 10:28
 * @description :
 */

@Entity
@Table(name = "t_math_model_prize")
public class MathModelPrize {

    //id
    @Id
    private Integer id;

    //比赛名称
    @Column(name = "match_name")
    private String matchName;

    //比赛等级
    @Column(name = "match_level")
    private Integer matchLevel;

    //主办单位
    @Column(name = "host_unit")
    private String hostUnit;

    //队伍名
    @Column(name = "team_name")
    private String teamName;

    //参赛队员1的id
    @Column(name = "teammate_id_1")
    private Integer teammateId1;

    //参赛队员2的id
    @Column(name = "teammate_id_2")
    private Integer teammateId2;

    //参赛队员3的id
    @Column(name = "teammate_id_3")
    private Integer teammateId3;

    //获奖时间
    @Column(name = "prize_time")
    private Date prizeTime;

    //指导教师id
    @Column(name = "teacher_id")
    private Integer teacherId;

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