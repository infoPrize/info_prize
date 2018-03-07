package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.entities.category.ChallengeCup;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 19:03
 * @description: 挑战杯Service
 */
public interface ChallengeCupService {

    /**
     * 新增挑战杯获奖信息
     */
    public void add(ChallengeCup challengeCup) throws Exception;

    /**
     * 将传过来的参数加工为去数据库中查询的条件(与分页无关)
     */
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime,
                                         Date endTime, String teamName, String stuName, Integer majorCode, String projectName,
                                         String hostUnit, String teacherName) throws Exception;

    /**
     * 将传过来的参数加工为去数据库中查询的条件(与分页有关)
     */
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage) throws Exception;

    /**
     * 根据条件查询相应获奖信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询挑战杯信息
     */
    public List<ChallengeCupDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 将dto转换为实体
     */
    public ChallengeCup convertDtoToEntity(ChallengeCupDto challengeCupDto) throws Exception;
}
