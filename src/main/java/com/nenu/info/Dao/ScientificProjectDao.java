package com.nenu.info.Dao;

import com.nenu.info.common.dto.ScientificProjectDto;
import com.nenu.info.common.entities.ScientificProject;
import com.nenu.info.common.entities.Student;
import org.apache.ibatis.annotations.Param;

import javax.json.JsonArray;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/30 15:33
 * @description : 科研国创项目的Dao接口
 */
public interface ScientificProjectDao {

    //新增科研国创项目
    public void addScientificProject(@Param("scientificProject") ScientificProject scientificProject);

    //学生删除科研国创 - 假删
    public void deleteScientificProjectByStudent();

    //教师审核删除科研国创项目 - 真删
    public void deleteScientificProjectByAdmin();

    //学生修改国创科研信息
    public void updateScientificProjectByStudent(ScientificProject scientificProject);

    //教师审核修改国创科研信息
    public void updateScientificProjectByAdmin(ScientificProject scientificProject);

    //查询所有国创科研信息
    public List<ScientificProject> listAllScientificProject();

    /**
     * 根据条件查询国创科研信息
     * @param params 参数Map
     * @return
     * @throws Exception
     */
    public List<ScientificProjectDto> listScientificProjectByCondition(Map<String, Object> params) throws Exception;

}
