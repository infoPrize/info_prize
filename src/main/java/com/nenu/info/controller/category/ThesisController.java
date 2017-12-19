package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.common.entities.Thesis;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.category.ThesisService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 14:15
 * @description : 论文Controller
 */

@Controller
@RequestMapping(value = URLConstants.THESIS_URL)
public class ThesisController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ThesisService thesisService;

    /**
     * 添加论文信息
     * @param journameName
     * @param journalLevel
     * @param thesisTitle
     * @param publishTime
     * @param authorName1
     * @param authorStuNumber1
     * @param authorName2
     * @param authorStuNumber2
     * @param authorName3
     * @param authorStuNumber3
     * @param authorName4
     * @param authorStuNumber4
     * @param authorName5
     * @param authorStuNumber5
     * @param teacherName
     * @param thesisAbstract
     * @return  1 - 插入成功
     *          2 - 第一位学生 学号姓名不匹配
     *          3 - 第二位学生 学号姓名不匹配
     *          4 - 第三位学生 学号姓名不匹配
     *          5 - 第四位学生 学号姓名不匹配
     *          6 - 第五位学生 学号姓名不匹配
     *          7 - 教师不存在
     *
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "journalName", required = false, defaultValue = "") String journameName,
                       @RequestParam(value = "journalLevel", required = false, defaultValue = "-1") Integer journalLevel,
                       @RequestParam(value = "thesisTitle", required = false, defaultValue = "") String thesisTitle,
                       @RequestParam(value = "publishTime", required = false) Date publishTime,
                       @RequestParam(value = "authorName1", required = false, defaultValue = "") String authorName1,
                       @RequestParam(value = "authorStuNumber1", required = false, defaultValue = "") String authorStuNumber1,
                       @RequestParam(value = "authorLevel1", required = false, defaultValue = "-1") Integer authorLevel1,
                       @RequestParam(value = "authorName2", required = false, defaultValue = "") String authorName2,
                       @RequestParam(value = "authorStuNumber2", required = false, defaultValue = "") String authorStuNumber2,
                       @RequestParam(value = "authorLevel2", required = false, defaultValue = "-1") Integer authorLevel2,
                       @RequestParam(value = "authorName3", required = false, defaultValue = "") String authorName3,
                       @RequestParam(value = "authorStuNumber3", required = false, defaultValue = "") String authorStuNumber3,
                       @RequestParam(value = "authorLevel3", required = false, defaultValue = "-1") Integer authorLevel3,
                       @RequestParam(value = "authorName4", required = false, defaultValue = "") String authorName4,
                       @RequestParam(value = "authorStuNumber4", required = false, defaultValue = "") String authorStuNumber4,
                       @RequestParam(value = "authorLevel4", required = false, defaultValue = "-1") Integer authorLevel4,
                       @RequestParam(value = "authorName5", required = false, defaultValue = "") String authorName5,
                       @RequestParam(value = "authorStuNumber5", required = false, defaultValue = "") String authorStuNumber5,
                       @RequestParam(value = "authorLevel5", required = false, defaultValue = "-1") Integer authorLevel5,
                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                       @RequestParam(value = "thesisAbstract", required = false, defaultValue = "") String thesisAbstract) {
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

        if(!authorStuNumber1.equals("")) {
            try {
                student1 = studentService.selectStudentByStuNumber(authorStuNumber1);
                if(!authorName1.equals(student1.getName())) {
                    return 2;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(student1 != null) {
            studentId1 = student1.getId();
        }

        if(!authorStuNumber2.equals("")) {
            try {
                student2 = studentService.selectStudentByStuNumber(authorStuNumber2);
                if(!authorName2.equals(student2.getName())) {
                    return 3;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if(student2 != null) {
            studentId2 = student2.getId();
        }

        if(!authorStuNumber3.equals("")) {
            try {
                student3 = studentService.selectStudentByStuNumber(authorStuNumber3);
                if(!authorName3.equals(student3.getName())) {
                    return 4;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        if(student3 != null) {
            studentId3 = student3.getId();
        }

        if(!authorStuNumber4.equals("")) {
            try {
                student4 = studentService.selectStudentByStuNumber(authorStuNumber4);
                if(!authorName4.equals(student4.getName())) {
                    return 5;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(student4 != null) {
            studentId4 = student4.getId();
        }

        if(!authorStuNumber5.equals("")) {
            try {
                student5 = studentService.selectStudentByStuNumber(authorStuNumber5);
                if(!authorName5.equals(student5.getName())) {
                    return 6;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if(student5 != null) {
            studentId5 = student5.getId();
        }

        if(!teacherName.equals("")) {
            try {
                teacher = teacherService.selectTeacherByName(teacherName);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (teacher == null) {
                return 7;
            }
        }
        if(teacher != null) {
            teacherId = teacher.getId();
        }

        Thesis thesis = new Thesis();
        thesis.setThesisTitle(thesisTitle);
        if(studentId1 != null) {
            thesis.setAuthorId1(studentId1);
            thesis.setAuthorLevel1(authorLevel1);
        }

        if(student2 != null) {
            thesis.setAuthorId2(studentId2);
            thesis.setAuthorLevel2(authorLevel2);
        }

        if(student3 != null) {
            thesis.setAuthorId3(studentId3);
            thesis.setAuthorLevel3(authorLevel3);
        }

        if(student4 != null) {
            thesis.setAuthorId4(studentId4);
            thesis.setAuthorLevel4(authorLevel4);
        }

        if(student5 != null) {
            thesis.setAuthorId5(studentId5);
            thesis.setAuthorLevel5(authorLevel5);
        }

        thesis.setPublishTime(publishTime);
        if(journalLevel > 0) {
            thesis.setJournalLevel(journalLevel);
        }
        thesis.setJournalName(journameName);
        thesis.setThesisAbstract(thesisAbstract);
        thesis.setTeacherId(teacherId);

        try {
            thesisService.add(thesis);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }


    @RequestMapping(value = "toThesis")
    public String toThesis(Model model) {
        List<ThesisDto> thesisDtoList = new ArrayList<>();

        try {
            thesisDtoList = thesisService.listAll();
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("thesisDtoList", thesisDtoList);

        return "thesis";

    }

    @RequestMapping(value = "listByCondition")
    public String listByConditions(@RequestParam("journalLevel") Integer journalLevel,
                                   @RequestParam("journalName") String journalName,
                                   @RequestParam("authorName") String authorName,
                                   @RequestParam("authorStuNumber") String authorStuNumber,
                                   @RequestParam("authorMajor") Integer authorMajor,
                                   @RequestParam("authorGrade") String authorGrade,
                                   @RequestParam("beginTime") Date beginTime,
                                   @RequestParam("endTime") Date endTime,
                                   @RequestParam("teacherName") String teacherName,
                                   Model model) {
        List<ThesisDto> thesisDtoList = null;

        try {
            thesisDtoList = thesisService.listByConditions(journalLevel, journalName, authorName, authorStuNumber, authorMajor, authorGrade,
                                                            beginTime, endTime, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("thesisDtoList", thesisDtoList);

        return "thesis";
    }

}
