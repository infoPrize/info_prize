package com.nenu.info.controller;

import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.entities.ScientificProject;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.service.ScientificProjectService;
import com.nenu.info.service.StudentService;
import com.nenu.info.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author: software-liuwang
 * @time: 2017/11/30 16:43
 * @description : 科研国创项目Controller
 */
@Controller
@RequestMapping(value = URLConstants.SCIENTIFIC_PROJECT_URL)
public class ScientificProjectController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ScientificProjectService scientificProjectService;

    /**
     * 单条插入国创/科研项目信息
     * @param projectName 项目名
     * @param projectType 项目类型(0-未知，1-一般培育项目，2-专项计划项目，3-重点培育项目，4-国创)
     * @param setTime 立项时间
     * @param projectManName 项目负责人姓名
     * @param projectManStuNumber 项目负责人学号
     * @param teacherName 指导教师姓名
     * @param projectMemberName1 项目成员1姓名
     * @param projectMemberStuNumber1 项目成员1学号
     * @param projectMemberName2 项目成员2姓名
     * @param projectMemberStuNumber2 项目成员2学号
     * @param projectMemberName3 项目成员3姓名
     * @param projectMemberStuNumber3 项目成员3学号
     * @param projectMemberName4 项目成员4姓名
     * @param projectMemberStuNumber4 项目成员4学号
     * @param fundsLimit 经费额度
     * @param projectIntroduce 项目简介
     *
     * @return 状态码(-1 - 学号输入错误
     *               0  - 项目负责人学号姓名不匹配
     *               1  - 成员1学号姓名不匹配
     *               2  - 成员2学号姓名不匹配
     *               3  - 成员3学号姓名不匹配
     *               4  - 成员4学号姓名不匹配
     *               5  - 指导教师姓名错误
     *               6  - 添加成功)
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer addScientificProject(@RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                        @RequestParam(value = "projectType", required = false, defaultValue = "0") Integer projectType,
                                        @RequestParam(value = "setTime", required = false, defaultValue = "2018-01-01") Date setTime,
                                        @RequestParam(value = "projectManName", required = false, defaultValue = "") String projectManName,
                                        @RequestParam(value = "projectManStuNumber", required = false, defaultValue = "") String projectManStuNumber,
                                        @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                        @RequestParam(value = "projectMemberName1", required = false, defaultValue = "") String projectMemberName1,
                                        @RequestParam(value = "projectMemberStuNumber1", required = false, defaultValue = "") String projectMemberStuNumber1,
                                        @RequestParam(value = "projectMemberName2", required = false, defaultValue = "") String projectMemberName2,
                                        @RequestParam(value = "projectMemberStuNumber2", required = false, defaultValue = "") String projectMemberStuNumber2,
                                        @RequestParam(value = "projectMemberName3", required = false, defaultValue = "") String projectMemberName3,
                                        @RequestParam(value = "projectMemberStuNumber3", required = false, defaultValue = "") String projectMemberStuNumber3,
                                        @RequestParam(value = "projectMemberName4", required = false, defaultValue = "") String projectMemberName4,
                                        @RequestParam(value = "projectMemberStuNumber4", required = false, defaultValue = "") String projectMemberStuNumber4,
                                        @RequestParam(value = "fundsLimit", required = false, defaultValue = "0") Integer fundsLimit,
                                        @RequestParam(value = "projectIntroduce", required = false, defaultValue = "") String projectIntroduce) {


        Student projectMan = null;
        Student projectMember1 = null;
        Student projectMember2 = null;
        Student projectMember3 = null;
        Student projectMember4 = null;
        Teacher teacher = null;

        //首先检查五个项目组成员是否有错
        try {
            projectMan = studentService.selectStudentByStuNumber(projectManStuNumber);
            projectMember1 = studentService.selectStudentByStuNumber(projectMemberStuNumber1);
            projectMember2 = studentService.selectStudentByStuNumber(projectMemberStuNumber2);
            projectMember3 = studentService.selectStudentByStuNumber(projectMemberStuNumber3);
            projectMember4 = studentService.selectStudentByStuNumber(projectMemberStuNumber4);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        //检查五个人中是否有人姓名学号不匹配
        if(projectMan == null || !projectManName.equals(projectMan.getName())) {
            return 0;
        } else if(projectMember1 == null || !projectMemberName1.equals(projectMember1.getName())) {
            return 1;
        } else if(projectMember2 == null || !projectMemberName2.equals(projectMember2.getName())) {
            return 2;
        } else if(projectMember3 == null || !projectMemberName3.equals(projectMember3.getName())) {
            return 3;
        } else if(projectMember4 == null || !projectMemberName4.equals(projectMember4.getName())) {
            return 4;
        }

        //检查教师是否存在
        try {
            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(teacher == null ) {
            return 5;
        }

        ScientificProject scientificProject = new ScientificProject();

        scientificProject.setProjectName(projectName);
        if(projectType >= 0) {
            scientificProject.setProjectType(projectType);
        } else {
            scientificProject.setProjectType(0);
        }
        scientificProject.setSetTime(setTime);
        scientificProject.setProjectManId(projectMan.getId());
        scientificProject.setProjectMemberId1(projectMember1.getId());
        scientificProject.setProjectMemberId2(projectMember2.getId());
        scientificProject.setProjectMemberId3(projectMember3.getId());
        scientificProject.setProjectMemberId4(projectMember4.getId());

        scientificProject.setTeacherId(teacher.getId());
        if(fundsLimit >= 0) {
            scientificProject.setFundsLimit(fundsLimit);
        } else {
            scientificProject.setFundsLimit(0);
        }
        scientificProject.setProjectIntroduce(projectIntroduce);

        scientificProjectService.addScientificProject(scientificProject);
        return 6;
    }

}
