package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.category.Thesis;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 20:12
 * @description : 论文service
 */
public interface ThesisService {

    /**
     * 添加论文信息
     * @param thesis
     * @throws Exception
     */
    public void add(Thesis thesis) throws Exception;

    /**
     * 查询所有论文信息
     * @return
     * @throws Exception
     */
    public List<ThesisDto> listAll() throws Exception;

    /**
     * 根据条件查询论文信息
     * @param journalLevel
     * @param journalName
     * @param authorName
     * @param authorStuNumber
     * @param authorMajor
     * @param authorGrade
     * @param beginTime
     * @param endTime
     * @param teacherName
     * @return
     */
    public List<ThesisDto> listByConditions(Integer journalLevel, String journalName, String authorName,
                                            String authorStuNumber, Integer authorMajor, String authorGrade,
                                            Date beginTime, Date endTime, String teacherName) throws Exception;

    /**
     * 将dto转换为实体
     * @param thesisDto
     * @return
     * @throws Exception
     */
    public Thesis convertDtoToEntity(ThesisDto thesisDto) throws Exception;

}
