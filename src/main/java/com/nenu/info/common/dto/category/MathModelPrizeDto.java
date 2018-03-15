package com.nenu.info.common.dto.category;

import java.util.Date;

/**
 * @author: software-liuwang
 * @time: 2017/12/11 21:01
 * @description : 数学建模DTO
 */
public class MathModelPrizeDto {

    //id
    private Integer id;

    //比赛等级
    private String matchLevel;

    //比赛名称
    private String matchName;

    //主办单位
    private String hostUnit;

    //获奖时间
    private Date prizeTime;

    //获奖时间(字符串)
    private String prizeTimeStr;

    //获奖等级
    private String prizeLevel;

    //团队名称
    private String teamName;

    //参赛人员1姓名
    private String teammateName1;

    //参赛人员1学号
    private String teammateStuNumber1;

    //参赛人员1专业
    private String teammateMajor1;

    //参赛人员2姓名
    private String teammateName2;

    //参赛人员2学号
    private String teammateStuNumber2;

    //参赛人员2专业
    private String teammateMajor2;

    //参赛人员3姓名
    private String teammateName3;

    //参赛人员3学号
    private String teammateStuNumber3;

    //参赛人员3专业
    private String teammateMajor3;

    private String[] stuNameArr;

    private String[] stuNumberArr;

    private String[] majorArr;

    //指导老师
    private String teacherName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMatchLevel() {
        return matchLevel;
    }

    public void setMatchLevel(String matchLevel) {
        this.matchLevel = matchLevel;
    }

    public String getMatchName() {
        return matchName;
    }

    public void setMatchName(String matchName) {
        this.matchName = matchName;
    }

    public String getHostUnit() {
        return hostUnit;
    }

    public void setHostUnit(String hostUnit) {
        this.hostUnit = hostUnit;
    }

    public Date getPrizeTime() {
        return prizeTime;
    }

    public void setPrizeTime(Date prizeTime) {
        this.prizeTime = prizeTime;
    }

    public String getPrizeTimeStr() {
        return prizeTimeStr;
    }

    public void setPrizeTimeStr(String prizeTimeStr) {
        this.prizeTimeStr = prizeTimeStr;
    }

    public String getPrizeLevel() {
        return prizeLevel;
    }

    public void setPrizeLevel(String prizeLevel) {
        this.prizeLevel = prizeLevel;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeammateName1() {
        return teammateName1;
    }

    public void setTeammateName1(String teammateName1) {
        this.teammateName1 = teammateName1;
    }

    public String getTeammateStuNumber1() {
        return teammateStuNumber1;
    }

    public void setTeammateStuNumber1(String teammateStuNumber1) {
        this.teammateStuNumber1 = teammateStuNumber1;
    }

    public String getTeammateMajor1() {
        return teammateMajor1;
    }

    public void setTeammateMajor1(String teammateMajor1) {
        this.teammateMajor1 = teammateMajor1;
    }

    public String getTeammateName2() {
        return teammateName2;
    }

    public void setTeammateName2(String teammateName2) {
        this.teammateName2 = teammateName2;
    }

    public String getTeammateStuNumber2() {
        return teammateStuNumber2;
    }

    public void setTeammateStuNumber2(String teammateStuNumber2) {
        this.teammateStuNumber2 = teammateStuNumber2;
    }

    public String getTeammateMajor2() {
        return teammateMajor2;
    }

    public void setTeammateMajor2(String teammateMajor2) {
        this.teammateMajor2 = teammateMajor2;
    }

    public String getTeammateName3() {
        return teammateName3;
    }

    public void setTeammateName3(String teammateName3) {
        this.teammateName3 = teammateName3;
    }

    public String getTeammateStuNumber3() {
        return teammateStuNumber3;
    }

    public void setTeammateStuNumber3(String teammateStuNumber3) {
        this.teammateStuNumber3 = teammateStuNumber3;
    }

    public String getTeammateMajor3() {
        return teammateMajor3;
    }

    public void setTeammateMajor3(String teammateMajor3) {
        this.teammateMajor3 = teammateMajor3;
    }

    public String[] getStuNameArr() {
        return stuNameArr;
    }

    public void setStuNameArr(String[] stuNameArr) {
        this.stuNameArr = stuNameArr;
    }

    public String[] getStuNumberArr() {
        return stuNumberArr;
    }

    public void setStuNumberArr(String[] stuNumberArr) {
        this.stuNumberArr = stuNumberArr;
    }

    public String[] getMajorArr() {
        return majorArr;
    }

    public void setMajorArr(String[] majorArr) {
        this.majorArr = majorArr;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }
}
