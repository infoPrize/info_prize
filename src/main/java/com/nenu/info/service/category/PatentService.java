package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 12:04
 * @description : 专利service接口
 */
public interface PatentService {

    /**
     * 新增专利信息
     */
    public void add(Patent patent) throws Exception;

    public Map<String, Object> getParams(Integer patentType, String patentName, Date beginTime, Date endTime, Integer majorCode,
                                         String grade, String stuNumber, String stuName, String teacherName) throws Exception;

    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 查询所有专利信息
     */
    public List<PatentDto> listAll() throws Exception;

    /**
     * 根据条件查询专利信息
     */
    public List<PatentDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询专利信息
     */
    public PatentDto selectById(Integer id) throws Exception;

    /**
     * 根据id对专利信息进行假删操作
     */
    public Integer falseDeleteById(Integer id);

    /**
     * 根据id删除专利信息
     */
    public Integer deleteById(Integer id);

    /**
     * 将dto转换为实体
     */
    public Patent convertDtoToEntity(PatentDto patentDto) throws Exception;

}
