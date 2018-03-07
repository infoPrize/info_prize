package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.InternetPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 19:03
 * @description: 互联网+Service
 */
public interface InternetPlusService {

    /**
     * 新增互联网+获奖信息
     * @param internetPlus
     * @throws Exception
     */
    public void add(InternetPlus internetPlus) throws Exception;

    /**
     * 将传递来的参数加工为去数据库搜索的参数(与分页无关)
     */
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime,
                                         Date endTime, String teamName, String stuName, Integer majorCode, String projectName,
                                         String hostUnit, String teacherName) throws Exception;

    /**
     * 将传递来的参数加工为去数据库搜索的参数(与分页有关)
     */
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage) throws Exception;

    /**
     * 根据条件查询获奖信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询获奖信息
     */
    public List<InternetPlusDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 将dto转换为实体
     */
    public InternetPlus convertDtoToEntity(InternetPlusDto internetPlusDto) throws Exception;

}
