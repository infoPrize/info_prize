package com.nenu.info.service;

import com.nenu.info.common.dto.ACMPrizeDto;
import com.nenu.info.common.entities.ACMPrize;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:25
 * @description :
 */
public interface ACMService {

    /**
     * 添加ACM获奖信息
     * @param acmPrize
     */
    public void add(ACMPrize acmPrize);

    /**
     * 根据条件查询ACM获奖信息
     * @param matchLevel 比赛等级
     * @param matchName 比赛名
     * @param beginTime 开始时间
     * @param endTime 结束时间
     * @param prizeLevel 获奖等级
     * @param major 专业
     * @param stuName 学生名
     * @param teacherName 教师名
     * @param hostUnit 主办单位
     * @return
     */
    public List<ACMPrizeDto> listByConditions(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                                Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit);

}
