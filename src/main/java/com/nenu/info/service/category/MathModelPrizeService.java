package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.MathModelPrize;

import java.util.Date;
import java.util.List;
//下面的不也都是铁锈吗
//反正贼难喝
//要不你去蓝旭给我偷点儿水喝？
//逗你玩儿的
//你不在这儿我喝啥/xk
/**
 * @author: software-liuwang
 * @time: 2017/12/11 15:04
 * @description : 数学建模获奖service接口
 */
public interface MathModelPrizeService {

    /**
     * 数学建模添加信息
     * @param mathModelPrize
     */
    public void add(MathModelPrize mathModelPrize);

    /**
     * 根据条件查询数学建模获奖信息
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
    public List<MathModelPrizeDto> listByConditions(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                                    Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit);

}
