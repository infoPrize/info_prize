package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.entities.category.ACMPrize;

import java.util.Date;
import java.util.List;
import java.util.Map;

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


    public Integer countByCondition(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                    Integer prizeLevel, Integer major, String stuName, String teacherName,
                                    String hostUnit);

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
     * @param page 页号
     */
    public List<ACMPrizeDto> listByConditions(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                                Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit, Integer curPage);

    /**
     * 将传过来的参数加工为去DAO层查询的参数
     */
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName,
                                         String hostUnit, Integer curPage);

}
