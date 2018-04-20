package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ScientificProjectDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.category.ScientificProject;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.ProjectTypeEnum;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.ScientificProjectService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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
        List<StudentDto> studentList = null;
        Integer stuId = null;
        StudentDto student = null;
        Integer teacherId = null;
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
        if(studentList == null) {
            idList = null;
        } else if(studentList.size() == 0) {
            //由于studentList.size为零，说明没有学生符合查询标准，所以应该返回空的patentList
            //但是我没有找到办法通过studentIdList使得查询结果为空的办法，所以只能从teacherId身上找。。
            teacherId = -1;
        } else {
            for(StudentDto s : studentList) {
                idList.add(s.getId());
            }
        }
        try {
            if(!teacherName.equals("")) {
                Teacher teacher = teacherDao.selectTeacherByName(teacherName);
                if(teacher != null) {
                    teacherId = teacher.getId();
                } else {
                    teacherId = -1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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
    public List<ScientificProjectDto> listScientificProjectByConditions(Map<String, Object> params) {
        List<ScientificProjectDto> scientificProjectDtoList = null;

        try {
            scientificProjectDtoList = scientificProjectDao.listScientificProjectByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //应前端要求，将成员姓名、学号、专业转换成数组
        if(scientificProjectDtoList != null) {
            for(ScientificProjectDto scientificProjectDto : scientificProjectDtoList) {
                String []stuNameArr = new String[5];
                String stuName1 = scientificProjectDto.getProjectManName() != null ? scientificProjectDto.getProjectManName() : "";
                String stuName2 = scientificProjectDto.getProjectMemberName1() != null ? scientificProjectDto.getProjectMemberName1() : "";
                String stuName3 = scientificProjectDto.getProjectMemberName2() != null ? scientificProjectDto.getProjectMemberName2() : "";
                String stuName4 = scientificProjectDto.getProjectMemberName3() != null ? scientificProjectDto.getProjectMemberName3() : "";
                String stuName5 = scientificProjectDto.getProjectMemberName4() != null ? scientificProjectDto.getProjectMemberName4() : "";
                stuNameArr[0] = stuName1;   stuNameArr[1] = stuName2;   stuNameArr[2] = stuName3;
                stuNameArr[3] = stuName4;   stuNameArr[4] = stuName5;
                scientificProjectDto.setStuNameArr(stuNameArr);

                String []stuNumberArr = new String[5];
                String stuNumber1 = scientificProjectDto.getProjectManStuNumber() != null ? scientificProjectDto.getProjectManStuNumber() : "";
                String stuNumber2 = scientificProjectDto.getProjectMemberStuNumber1() != null ? scientificProjectDto.getProjectMemberStuNumber1() : "";
                String stuNumber3 = scientificProjectDto.getProjectMemberStuNumber2() != null ? scientificProjectDto.getProjectMemberStuNumber2() : "";
                String stuNumber4 = scientificProjectDto.getProjectMemberStuNumber3() != null ? scientificProjectDto.getProjectMemberStuNumber3() : "";
                String stuNumber5 = scientificProjectDto.getProjectMemberStuNumber4() != null ? scientificProjectDto.getProjectMemberStuNumber4() : "";
                stuNumberArr[0] = stuNumber1;   stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                stuNumberArr[3] = stuNumber4;   stuNumberArr[4] = stuNumber5;
                scientificProjectDto.setStuNumberArr(stuNumberArr);

                String[] stuMajorArr = new String[5];
                String stuMajor1 = scientificProjectDto.getProjectManMajor() != null ? scientificProjectDto.getProjectManMajor() : "";
                String stuMajor2 = scientificProjectDto.getProjectMemberMajor1() != null ? scientificProjectDto.getProjectMemberMajor1() : "";
                String stuMajor3 = scientificProjectDto.getProjectMemberMajor2() != null ? scientificProjectDto.getProjectMemberMajor2() : "";
                String stuMajor4 = scientificProjectDto.getProjectMemberMajor3() != null ? scientificProjectDto.getProjectMemberMajor3() : "";
                String stuMajor5 = scientificProjectDto.getProjectMemberMajor4() != null ? scientificProjectDto.getProjectMemberMajor4() : "";
                stuMajorArr[0] = stuMajor1;     stuMajorArr[1] = stuMajor2;         stuMajorArr[2] = stuMajor3;
                stuMajorArr[3] = stuMajor4;     stuMajorArr[4] = stuMajor5;
                scientificProjectDto.setStuMajorArr(stuMajorArr);

            }
        }

        return scientificProjectDtoList;
    }

    @Override
    public ScientificProjectDto selectById(Integer id) {
        ScientificProjectDto scientificProjectDto = null;
        try {
            scientificProjectDto = scientificProjectDao.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return scientificProjectDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            scientificProjectDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            scientificProjectDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 1;
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
