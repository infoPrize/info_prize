package com.nenu.info.Dao;

import com.nenu.info.common.entities.ScientificProject;
import org.apache.ibatis.annotations.Param;

import javax.json.JsonArray;
import java.util.Date;
import java.util.List;

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
    public List listAllScientificProject();

    //根据条件查询国创科研信息
    public List listScientificProjectByCondition(@Param("projectName") String projectName,
                                                 @Param("projectType") Integer projectType,
                                                 @Param("beginTime") Date beginTime,
                                                 @Param("stuMajor") Integer stuMajor,
                                                 @Param("teacherName") String teacherName,
                                                 @Param("studentName") String studentName,
                                                 @Param("stuNumber") String stuNumber);



}
