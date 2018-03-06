package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ScientificProjectDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.category.ScientificProject;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.ProjectTypeEnum;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.ScientificProjectService;
import com.nenu.info.service.common.StudentService;
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

    @Autowired
    private StudentService studentService;

    @Override
    public void addScientificProject(ScientificProject scientificProject) {
        scientificProjectDao.addScientificProject(scientificProject);
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) {
        Integer count = null;

        try {
            count = scientificProjectDao.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public Map<String, Object> getParams(String projectName, Integer projectType, String setYear, Integer majorCode, String teacherName, String stuName, String stuNumber) {
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
        if(teacher != null) {
            teacherId = teacher.getId();
        }

        Map<String, Object> params = new HashMap<>();
        params.put("projectName", projectName);
        params.put("projectType", projectType);
        params.put("setYear", setYear);
        params.put("teacherId", teacherId);
        params.put("stuId", stuId);
        params.put("idList", idList);

        return params;

    }

    @Override
    public Map<String, Object> getParams(String projectName, Integer projectType, String setYear, Integer majorCode, String teacherName, String stuName, String stuNumber, Integer curPage, Integer totalPage) {
        Map<String, Object> params = getParams(projectName, projectType, setYear, majorCode, teacherName, stuName, stuNumber);

        if(curPage <= 0 && curPage != -500) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        int pageSize = WebConstants.pageSize;
        int startNum = (curPage - 1) * pageSize;

        params.put("curPage", curPage);
        params.put("totalPage", totalPage);
        params.put("pageSize", WebConstants.pageSize);
        params.put("startNum", startNum);

        return params;
    }

    @Override
    public List<ScientificProjectDto> listScientificProjectByConditions(Map<String, Object> params) {
        List<ScientificProjectDto> scientificProjectDtoList = null;

        int startNum = ((int)params.get("curPage") - 1) * WebConstants.pageSize;
        params.put("startNum", startNum);

        try {
            scientificProjectDtoList = scientificProjectDao.listScientificProjectByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scientificProjectDtoList;
    }

    public ScientificProject convertDtoToEntity(ScientificProjectDto scientificProjectDto) throws Exception{

        ScientificProject scientificProject = new ScientificProject();
        scientificProject.setProjectName(scientificProjectDto.getProjectName());
        scientificProject.setProjectType(ProjectTypeEnum.getIdByValue(scientificProjectDto.getProjectType()));
        scientificProject.setSetYear(scientificProjectDto.getSetYear());
        if(studentService.nameEqualOrNot(scientificProjectDto.getProjectManStuNumber(),scientificProjectDto.getProjectManName())){
            scientificProject.setProjectManId(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectManStuNumber()).getId());
        }
        if(studentService.nameEqualOrNot(scientificProjectDto.getProjectMemberStuNumber1(),scientificProjectDto.getProjectMemberName1()) ){
            scientificProject.setProjectMemberId1(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber1()).getId());
        }
        if(studentService.nameEqualOrNot(scientificProjectDto.getProjectMemberStuNumber2(),scientificProjectDto.getProjectMemberName2())){
            scientificProject.setProjectMemberId2(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(scientificProjectDto.getProjectMemberStuNumber3(),scientificProjectDto.getProjectMemberName3())){
            scientificProject.setProjectMemberId3(studentDao.selectStudentByStuNumber(scientificProjectDto.getProjectMemberStuNumber3()).getId());
        }
        if(studentService.nameEqualOrNot(scientificProjectDto.getProjectMemberStuNumber4(),scientificProjectDto.getProjectMemberName4()) ){
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
