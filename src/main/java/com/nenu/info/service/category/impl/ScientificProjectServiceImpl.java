package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ScientificProjectDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.category.ScientificProject;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.ProjectTypeEnum;
import com.nenu.info.service.category.ScientificProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/2 15:34
 * @description : 国创科研service
 */
@Service(value = "scientificProjectService")
public class ScientificProjectServiceImpl implements ScientificProjectService {

    @Autowired
    private ScientificProjectDao scientificProjectDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    /**
     * 新增科研国创项目
     * @param scientificProject
     */
    @Override
    public void addScientificProject(ScientificProject scientificProject) {
        scientificProjectDao.addScientificProject(scientificProject);
    }

    /**
     * 根据条件查询项目列表
     *
     * @param projectName 项目名
     * @param projectType 项目类型
     * @param setYear     立项年份
     * @param majorCode   专业代码
     * @param teacherName 教师姓名
     * @param stuName     学生姓名
     * @param stuNumber   学号
     * @return
     */
    @Override
    public List<ScientificProjectDto> listScientificProjectByConditions(String projectName, Integer projectType, String setYear, Integer majorCode, String teacherName, String stuName, String stuNumber) {
        List<Student> studentList = null;
        Integer stuId = null;
        Student student = null;
        List<Integer> idList = new ArrayList<>();

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);
            student = studentDao.selectStudentByStuNumber(stuNumber);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(student != null) {
            stuId = student.getId();
        }
        if(studentList != null) {
            for (Student student1 : studentList) {
                Integer id = student1.getId();
                idList.add(id);
            }
        }

        Teacher teacher = null;
        try {
            teacher = teacherDao.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer teacherId = null;
        if(teacher == null) {
            return null;
        } else {
            teacherId = teacher.getId();
        }
        List<ScientificProjectDto> scientificProjectDtoList = null;

        Map<String, Object> params = new HashMap<>();
        params.put("projectName", projectName);
        params.put("projectType", projectType);
        params.put("setYear", setYear);
        params.put("teacherId", teacherId);
        params.put("stuId", stuId);
        params.put("idList", idList);

        try {
            scientificProjectDtoList = scientificProjectDao.listScientificProjectByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scientificProjectDtoList;
    }

    @Override
    public List<ScientificProjectDto> listAll() {
        List<ScientificProjectDto> scientificProjectDtoList = null;
        try {
            scientificProjectDtoList = scientificProjectDao.listAll();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scientificProjectDtoList;
    }

    /**
     * 将dto转换为实体
     * @param scientificProjectDto
     * @return
     * @throws Exception
     */
    public ScientificProject convertDtoToEntity(ScientificProjectDto scientificProjectDto) throws Exception{

        ScientificProject scientificProject = new ScientificProject();
        scientificProject.setProjectName(scientificProjectDto.getProjectName());
        scientificProject.setProjectType(ProjectTypeEnum.getIdByValue(scientificProjectDto.getProjectType()));
        scientificProject.setSetYear(scientificProjectDto.getSetYear());
        if(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectManStuNumber()) != null){
            scientificProject.setProjectManId(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectManStuNumber()).getId());
        }
        if(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber1()) != null){
            scientificProject.setProjectMemberId1(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber1()).getId());
        }
        if(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber2()) != null){
            scientificProject.setProjectMemberId2(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber2()).getId());
        }
        if(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber3()) != null){
            scientificProject.setProjectMemberId3(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber3()).getId());
        }
        if(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber4()) != null){
            scientificProject.setProjectMemberId4(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber4()).getId());
        }
        if(teacherDao.selectTeacherByName(scientificProjectDto.getTeacherName()) != null){
            scientificProject.setTeacherId(teacherDao.selectTeacherByName(scientificProjectDto.getTeacherName()).getId());
        }
        scientificProject.setFundsLimit(scientificProjectDto.getFundsLimit());
        scientificProject.setProjectIntroduce(scientificProjectDto.getProjectIntroduce());

        return scientificProject;

    }
}
