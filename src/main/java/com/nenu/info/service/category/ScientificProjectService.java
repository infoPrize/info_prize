package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.ScientificProject;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/2 15:33
 * @description : 科研国创service
 */
public interface ScientificProjectService {

    /**
     * 新增科研国创项目
     * @param scientificProject
     */
    public void addScientificProject(ScientificProject scientificProject);

    /**
     * 根据条件查询国创科研列表
     * @param projectName 项目名
     * @param projectType 项目类型
     * @param setYear 立项年份
     * @param major 专业
     * @param teacherName 教师姓名
     * @param stuName 学生姓名
     * @param stuNumber 学号
     * @return
     */
    public List<ScientificProjectDto> listScientificProjectByConditions(String projectName, Integer projectType, String setYear, Integer major,
                                                                        String teacherName, String stuName, String stuNumber);

    /**
     * 查询所有国创科研信息
     * @return
     */
    public List<ScientificProjectDto> listAll();
}
