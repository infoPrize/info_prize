package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.category.MathModelPrize;

import java.util.Date;
import java.util.List;
import java.util.Map;
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

    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit);

    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit,
                                         Integer curPage, Integer totalPage);

    /**
     * 根绝条件查询信息的数量
     */
    public Integer countByConditions(Map<String, Object> params);

    /**
     * 根据条件查询数学建模获奖信息
     */
    public List<MathModelPrizeDto> listByConditions(Map<String, Object> params);

    /**
     * 将dto转换为实体
     */
    public MathModelPrize convertDtoToEntity(MathModelPrizeDto mathModelPrizeDto) throws Exception;
}
