package com.nenu.info.common.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * 实体类 - 其他专业比赛
 * 如 ：
 * “理想杯”PPT、PS大赛
 * “理想杯”静态网页制作大赛
 * “理想杯”动态网页制作大赛
 * 互联网+校赛、省赛
 * 挑战杯、家曦杯、北斗杯  等
 *
 * @author: software-liuwang
 * @time: 2017/11/5 20:13
 * @description :
 */

@Entity
@Table(name = "t_pro_match")
public class ProfessionalMatch {

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

    //获奖队员1的id
    @Column(name = "teammate_id_1")
    private Integer teammateId1;

    //获奖队员2的id
    @Column(name = "teammate_id_2")
    private Integer teammateId2;

    //获奖队员3的id
    @Column(name = "teammate_id_3")
    private Integer teammateId3;

    //获奖队员4的id
    @Column(name = "teammate_id_4")
    private Integer teammateId4;

    //获奖队员5的id
    @Column(name = "teammate_id_5")
    private Integer teammateId5;

    //获奖队员6的id
    @Column(name = "teammate_id_6")
    private Integer teammateId6;

    //其他参赛成员
    @Column(name = "other_teammate")
    private String otherTeammate;

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

    public Integer getTeammateId4() {
        return teammateId4;
    }

    public void setTeammateId4(Integer teammateId4) {
        this.teammateId4 = teammateId4;
    }

    public Integer getTeammateId5() {
        return teammateId5;
    }

    public void setTeammateId5(Integer teammateId5) {
        this.teammateId5 = teammateId5;
    }

    public Integer getTeammateId6() {
        return teammateId6;
    }

    public void setTeammateId6(Integer teammateId6) {
        this.teammateId6 = teammateId6;
    }

    public String getOtherTeammate() {
        return otherTeammate;
    }

    public void setOtherTeammate(String otherTeammate) {
        this.otherTeammate = otherTeammate;
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
}
