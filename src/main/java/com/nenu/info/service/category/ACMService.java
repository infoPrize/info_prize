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
     * 根据id查询ACM获奖信息
     */
    public ACMPrizeDto selectById(Integer id);

    /**
     * 根据id对ACM获奖信息进行假删操作
     */
    public Integer falseDeleteById(Integer id);

    /**
     * 根据id删除ACM获奖信息
     */
    public Integer deleteById(Integer id);

    /**
     * 将dto转换为实体
     */
    public ACMPrize convertDtoToEntity(ACMPrizeDto acmPrizeDto) throws Exception;
}
