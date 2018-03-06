package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.category.PatentService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 11:38
 * @description : 专利controller
 */
@Controller
@RequestMapping(value = URLConstants.PATENT_URL)
public class PatentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private PatentService patentService;

    /**
     * 添加专利信息
     * @param patentType
     * @param patentName
     * @param applyTime
     * @param applierName1
     * @param applierStuNumber1
     * @param applierName2
     * @param applierStuNumber2
     * @param applierName3
     * @param applierStuNumber3
     * @param applierName4
     * @param applierStuNumber4
     * @param applierName5
     * @param applierStuNumber5
     * @param teacherName
     * @param patentIntroduce
     * @return 1 - 申请者1姓名学号不匹配
     *         2 - 申请者2姓名学号不匹配
     *         3 - 申请者3姓名学号不匹配
     *         4 - 申请者4姓名学号不匹配
     *         5 - 申请者5姓名学号不匹配
     *         6 - 教师不存在
     *         7 - 插入成功
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "patentType", required = false, defaultValue = "-1") Integer patentType,
                       @RequestParam(value = "patentName", required = false, defaultValue = "") String patentName,
                       @RequestParam(value = "applyTime", required = false) Date applyTime,
                       @RequestParam(value = "applierName1", required = false, defaultValue = "") String applierName1,
                       @RequestParam(value = "applierStuNumber1", required = false, defaultValue = "") String applierStuNumber1,
                       @RequestParam(value = "applierName2", required = false, defaultValue = "") String applierName2,
                       @RequestParam(value = "applierStuNumber2", required = false, defaultValue = "") String applierStuNumber2,
                       @RequestParam(value = "applierName3", required = false, defaultValue = "") String applierName3,
                       @RequestParam(value = "applierStuNumber3", required = false, defaultValue = "") String applierStuNumber3,
                       @RequestParam(value = "applierName4", required = false, defaultValue = "") String applierName4,
                       @RequestParam(value = "applierStuNumber4", required = false, defaultValue = "") String applierStuNumber4,
                       @RequestParam(value = "applierName5", required = false, defaultValue = "") String applierName5,
                       @RequestParam(value = "applierStuNumber5", required = false, defaultValue = "") String applierStuNumber5,
                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                       @RequestParam(value = "patentIntroduce", required = false, defaultValue = "") String patentIntroduce) {

        Student student1 = null;
        Integer studentId1 = null;
        Student student2 = null;
        Integer studentId2 = null;
        Student student3 = null;
        Integer studentId3 = null;
        Student student4 = null;
        Integer studentId4 = null;
        Student student5 = null;
        Integer studentId5 = null;

        Teacher teacher = null;
        Integer teacherId = null;

        try {
            if(!applierName1.equals("")) {
                student1 = studentService.selectStudentByStuNumber(applierStuNumber1);
                if(student1 == null || !applierName1.equals(student1.getName())) {
                    return 1;
                }
                studentId1 = student1.getId();
            }
            if(!applierName2.equals("")) {
                student2 = studentService.selectStudentByStuNumber(applierStuNumber2);
                if(student2 == null || !applierName2.equals(student2.getName())) {
                    return 2;
                }
                studentId2 = student2.getId();
            }
            if(!applierName3.equals("")) {
                student3 = studentService.selectStudentByStuNumber(applierStuNumber3);
                if(student3 == null || !applierName3.equals(student3.getName())) {
                    return 3;
                }
                studentId3 = student3.getId();
            }
            if(!applierName4.equals("")) {
                student4 = studentService.selectStudentByStuNumber(applierStuNumber4);
                if(student4 == null || !applierName4.equals(student4.getName())) {
                    return 4;
                }
                studentId4 = student4.getId();
            }
            if(!applierName5.equals("")) {
                student5 = studentService.selectStudentByStuNumber(applierStuNumber5);
                if(student5 == null || !applierName5.equals(student5.getName())) {
                    return 5;
                }
                studentId5 = student5.getId();
            }
            if(!teacherName.equals("")) {
                teacher = teacherService.selectTeacherByName(teacherName);
                if(teacher == null) {
                    return 6;
                }
                teacherId = teacher.getId();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Patent patent = new Patent();
        patent.setPatentType(patentType);
        patent.setPatentName(patentName);
        patent.setApplyTime(applyTime);
        patent.setOwnerId1(studentId1);
        patent.setOwnerId2(studentId2);
        patent.setOwnerId3(studentId3);
        patent.setOwnerId4(studentId4);
        patent.setOwnerId5(studentId5);
        patent.setTeacherId(teacherId);
        patent.setPatentIntroduce(patentIntroduce);

        try {
            patentService.add(patent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 7;
    }

    @RequestMapping(value = "toPatent", method = RequestMethod.GET)
    public String toPatent(Model model, @RequestParam(value = "message", required = false, defaultValue = "") String message) {
        List<PatentDto> patentDtoList = null;
        try {
            patentDtoList = patentService.listAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("message",message);
        model.addAttribute("patentDtoList", patentDtoList);

        return "patent";
    }

    @RequestMapping(value = "listByConditions", method = RequestMethod.POST)
    public String listByConditions(@RequestParam(value = "patentType", required = false, defaultValue = "-1") Integer patentType,
                                   @RequestParam(value = "patentName", required = false, defaultValue = "") String patentName,
                                   @RequestParam(value = "beginTime", required = false) Date beginTime,
                                   @RequestParam(value = "endTime", required = false) Date endTime,
                                   @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                   @RequestParam(value = "grade", required = false, defaultValue = "") String grade,
                                   @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                   @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                   @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                   Model model) {
        List<PatentDto> patentDtoList = null;

        try {
            patentDtoList = patentService.listByConditions(patentType, patentName, beginTime, endTime, majorCode, grade, stuNumber, stuName, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("patentDtoList", patentDtoList);

        return "patent";
    }



}
