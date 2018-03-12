package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.category.Thesis;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 20:12
 * @description : 论文service
 */
public interface ThesisService {

    /**
     * 添加论文信息
     */
    public void add(Thesis thesis) throws Exception;

    /**
     * 将传递过来的参数加工为去数据库传递的参数
     */
    public Map<String, Object> getParams(Integer journalLevel, String journalName, String authorName, String authorStuNumber,
                                         Integer authorMajor, String authorGrade, Date beginTime, Date endTime, String teacherName) throws Exception;

    /**
     * 根据条件查询论文信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 查询所有论文信息
     */
    public List<ThesisDto> listAll() throws Exception;

    /**
     * 根据条件查询论文信息
     */
    public List<ThesisDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询论文信息
     */
    public ThesisDto selectById(Integer id) throws Exception;

    /**
     * 根据id对论文信息进行假删操作
     */
    public Integer falseDeleteById(Integer id);

    /**
     * 根据id删除论文获奖信息
     */
    public Integer deleteById(Integer id);

    /**
     * 将dto转换为实体
     */
    public Thesis convertDtoToEntity(ThesisDto thesisDto) throws Exception;

}
