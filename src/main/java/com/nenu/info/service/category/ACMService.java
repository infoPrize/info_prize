package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.entities.category.ACMPrize;

import javax.servlet.http.HttpServletRequest;
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
     */
    public void add(ACMPrize acmPrize);


    public Integer countByCondition(Map<String, Object> params);

    /**
     * 根据条件查询ACM获奖信息
     */
    public List<ACMPrizeDto> listByConditions(Map<String, Object> params);

    /**
     * 将传过来的参数加工为去DAO层查询的参数(与分页无关)
     */
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName,
                                         String hostUnit);

    /**
     * 将传过来的参数加工为去DAO层查询的参数(与分页有关)
     */
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName,
                                         String hostUnit, Integer curPage, Integer totalPage);

    /**
     * 将dto转换为实体
     */
    public ACMPrize convertDtoToEntity(ACMPrizeDto acmPrizeDto) throws Exception;
}
