package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.category.ScientificProject;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/2 15:33
 * @description : 科研国创service
 */
public interface ScientificProjectService {

    /**
     * 新增科研国创项目
     */
    public void addScientificProject(ScientificProject scientificProject);

    /**
     * 根据条件查询相应信息的数量
     */
    public Integer countByCondition(Map<String, Object> params);

    /**
     * 将传递的参数加工为去数据库中查询的参数(与分页有关)
     */
    public Map<String, Object> getParams(String projectName, Integer projectType, String setYear,
                                         Integer majorCode, String teacherName, String stuName, String stuNumber);

    /**
     * 将传递的参数加工为去数据库中查询的参数(与分页无关)
     */
    public Map<String, Object> getParams(String projectName, Integer projectType, String setYear,
                                         Integer majorCode, String teacherName, String stuName, String stuNumber, Integer curPage, Integer totalPage);


    /**
     * 根据条件查询国创科研列表
     */
    public List<ScientificProjectDto> listScientificProjectByConditions(Map<String, Object> params);

    /**
     * 将dto转换为实体
     */
    public ScientificProject convertDtoToEntity(ScientificProjectDto scientificProjectDto) throws Exception;
}
