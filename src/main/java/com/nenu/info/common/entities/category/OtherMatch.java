package com.nenu.info.common.entities.category;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 12:27
 * @description : 其他比赛实体类
 */
@Entity
@Table(name = "t_other_match")
public class OtherMatch {

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

    //队伍成员1的id
    @Column(name = "teammate_id_1")
    private Integer teammateId1;

    //队伍成员2的id
    @Column(name = "teammate_id_2")
    private Integer teammateId2;

    //队伍成员3的id
    @Column(name = "teammate_id_3")
    private Integer teammateId3;

    //队伍成员4的id
    @Column(name = "teammate_id_4")
    private Integer teammateId4;

    //队伍成员5的id
    @Column(name = "teammate_id_5")
    private Integer teammateId5;

    //队伍成员6的id
    @Column(name = "teammate_id_6")
    private Integer teammateId6;

    //队伍成员7的id
    @Column(name = "teammate_id_7")
    private Integer teammateId7;

    //队伍成员8的id
    @Column(name = "teammate_id_8")
    private Integer teammateId8;

    //项目名
    @Column(name = "project_name")
    private String projectName;

    //获奖时间
    @Column(name = "prize_time")
    private Date prizeTime;

    //获奖等级
    @Column(name = "prize_level")
    private Integer prizeLevel;

    //教师id
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

    public Integer getTeammateId7() {
        return teammateId7;
    }

    public void setTeammateId7(Integer teammateId7) {
        this.teammateId7 = teammateId7;
    }

    public Integer getTeammateId8() {
        return teammateId8;
    }

    public void setTeammateId8(Integer teammateId8) {
        this.teammateId8 = teammateId8;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getPrizeTime() {
        return prizeTime;
    }

    public void setPrizeTime(Date prizeTime) {
        this.prizeTime = prizeTime;
    }

    public Integer getPrizeLevel() {
        return prizeLevel;
    }

    public void setPrizeLevel(Integer prizeLevel) {
        this.prizeLevel = prizeLevel;
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
