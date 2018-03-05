package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.InternetPlus;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.controller.common.StudentController;
import com.nenu.info.service.category.InternetPlusService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.Table;
import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2018/1/24 17:57
 * @description: 互联网+Controller
 */
@Controller
@RequestMapping(value = URLConstants.INTERNET_PLUS_URL)
public class InternetPlusController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private InternetPlusService internetPlusService;

    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "internet_plus/internet_plus_add_test";
    }

    @RequestMapping(value = "toList")
    public String toList() {
        return "internet_plus/internet_plus_listByCondition_test";
    }

    /**
     * 添加互联网+获奖信息
     * @return  插入情况的代码：
     *          1 - 成员1的姓名学号不匹配
     *          2 - 成员2的姓名学号不匹配
     *          3 - 成员3的姓名学号不匹配
     *          4 - 成员4的姓名学号不匹配
     *          5 - 成员5的姓名学号不匹配
     *          6 - 成员6的姓名学号不匹配
     *          7 - 成员7的姓名学号不匹配
     *          8 - 成员8的姓名学号不匹配
     *          9 - 该教师不存在
     *          10 - 插入成功
     */
    @RequestMapping(value = "add")
    @ResponseBody
    public Integer add(@RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                       @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                       @RequestParam(value = "teamName", required = false, defaultValue = "") String teamName,
                       @RequestParam(value = "teammateName1", required = false, defaultValue = "") String teammateName1,
                       @RequestParam(value = "teammateStuNumber1", required = false, defaultValue = "") String teammateStuNumber1,
                       @RequestParam(value = "teammateName2", required = false, defaultValue = "") String teammateName2,
                       @RequestParam(value = "teammateStuNumber2", required = false, defaultValue = "") String teammateStuNumber2,
                       @RequestParam(value = "teammateName3", required = false, defaultValue = "") String teammateName3,
                       @RequestParam(value = "teammateStuNumber3", required = false, defaultValue = "") String teammateStuNumber3,
                       @RequestParam(value = "teammateName4", required = false, defaultValue = "") String teammateName4,
                       @RequestParam(value = "teammateStuNumber4", required = false, defaultValue = "") String teammateStuNumber4,
                       @RequestParam(value = "teammateName5", required = false, defaultValue = "") String teammateName5,
                       @RequestParam(value = "teammateStuNumber5", required = false, defaultValue = "") String teammateStuNumber5,
                       @RequestParam(value = "teammateName6", required = false, defaultValue = "") String teammateName6,
                       @RequestParam(value = "teammateStuNumber6", required = false, defaultValue = "") String teammateStuNumber6,
                       @RequestParam(value = "teammateName7", required = false, defaultValue = "") String teammateName7,
                       @RequestParam(value = "teammateStuNumber7", required = false, defaultValue = "") String teammateStuNumber7,
                       @RequestParam(value = "teammateName8", required = false, defaultValue = "") String teammateName8,
                       @RequestParam(value = "teammateStuNumber8", required = false, defaultValue = "") String teammateStuNumber8,
                       @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                       @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                       @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                       @RequestParam(value = "prizeTime", required = false) Date prizeTime,
                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName) {
        try {
            //先处理八名同学的输入是否合法
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName1, teammateStuNumber1)) {
                return 1;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName2, teammateStuNumber2)) {
                return 2;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName3, teammateStuNumber3)) {
                return 3;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName4, teammateStuNumber4)) {
                return 4;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName5, teammateStuNumber5)) {
                return 5;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName6, teammateStuNumber6)) {
                return 6;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName7, teammateStuNumber7)) {
                return 7;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName8, teammateStuNumber8)) {
                return 8;
            }

            //再检查教师是否存在
            if(!teacherService.checkTeacherExist(teacherName)) {
                return 9;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Student student1 = null;        Student student2 = null;
        Student student3 = null;        Student student4 = null;
        Student student5 = null;        Student student6 = null;
        Student student7 = null;        Student student8 = null;
        Teacher teacher = null;
        try {
            student1 = studentService.selectStudentByStuNumber(teammateStuNumber1);
            student2 = studentService.selectStudentByStuNumber(teammateStuNumber2);
            student3 = studentService.selectStudentByStuNumber(teammateStuNumber3);
            student4 = studentService.selectStudentByStuNumber(teammateStuNumber4);
            student5 = studentService.selectStudentByStuNumber(teammateStuNumber5);
            student6 = studentService.selectStudentByStuNumber(teammateStuNumber6);
            student7 = studentService.selectStudentByStuNumber(teammateStuNumber7);
            student8 = studentService.selectStudentByStuNumber(teammateStuNumber8);

            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        InternetPlus internetPlus = new InternetPlus();
        internetPlus.setProjectName(projectName);
        internetPlus.setTeamName(teamName);
        internetPlus.setHostUnit(hostUnit);
        if(student1 != null) {
            internetPlus.setTeammateId1(student1.getId());
        }
        if(student2 != null) {
            internetPlus.setTeammateId2(student2.getId());
        }
        if(student3 != null) {
            internetPlus.setTeammateId3(student3.getId());
        }
        if(student4 != null) {
            internetPlus.setTeammateId4(student4.getId());
        }
        if(student5 != null) {
            internetPlus.setTeammateId5(student5.getId());
        }
        if(student6 != null) {
            internetPlus.setTeammateId6(student6.getId());
        }
        if(student7 != null) {
            internetPlus.setTeammateId7(student7.getId());
        }
        if(student8 != null) {
            internetPlus.setTeammateId8(student8.getId());
        }
        internetPlus.setTeacherId(teacher.getId());
        internetPlus.setMatchName(matchName);
        internetPlus.setMatchLevel(matchLevel);
        internetPlus.setPrizeLevel(prizeLevel);
        internetPlus.setPrizeTime(prizeTime);

        try {
            internetPlusService.add(internetPlus);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 10;
    }


    @RequestMapping(value = "listByCondition")
//    @ResponseBody
    public String listByCondition(@RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                  @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                  @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                  @RequestParam(value = "startTime", required = false) Date startTime,
                                  @RequestParam(value = "endTime", required = false) Date endTime,
                                  @RequestParam(value = "teamName", required = false, defaultValue = "") String teamName,
                                  @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                  @RequestParam(value = "majorCode", required = false, defaultValue = "") Integer majorCode,
                                  @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                  @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                  @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                  Model model) {

        List<InternetPlusDto> internetPlusDtoList = null;
//        JSONArray jsonArray = new JSONArray();

        try {
            internetPlusDtoList = internetPlusService.listByCondition(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName, majorCode, projectName,
                                                                                            hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

//        if(internetPlusDtoList != null) {
//            for (InternetPlusDto internetPlusDto : internetPlusDtoList) {
//                JSONObject jsonObject = new JSONObject();
//                jsonObject.put("matchLevel", internetPlusDto.getMatchLevel());
//                jsonObject.put("matchName", internetPlusDto.getMatchName());
//                jsonObject.put("projectName", internetPlusDto.getProjectName());
//                jsonObject.put("teamName", internetPlusDto.getTeamName());
//                jsonObject.put("stuName1", internetPlusDto.getStuName1());
//                jsonObject.put("stuNumber1", internetPlusDto.getStuNumber1());
//                jsonObject.put("stuName2", internetPlusDto.getStuName2());
//                jsonObject.put("stuNumber2", internetPlusDto.getStuNumber2());
//                jsonObject.put("stuName3", internetPlusDto.getStuName3());
//                jsonObject.put("stuNumber3", internetPlusDto.getStuNumber3());
//                jsonObject.put("stuName4", internetPlusDto.getStuName4());
//                jsonObject.put("stuNumber4", internetPlusDto.getStuNumber4());
//                jsonObject.put("stuName5", internetPlusDto.getStuName5());
//                jsonObject.put("stuNumber5", internetPlusDto.getStuNumber5());
//                jsonObject.put("stuName6", internetPlusDto.getStuName6());
//                jsonObject.put("stuNumber6", internetPlusDto.getStuNumber6());
//                jsonObject.put("stuName7", internetPlusDto.getStuName7());
//                jsonObject.put("stuNumber7", internetPlusDto.getStuNumber7());
//                jsonObject.put("stuName8", internetPlusDto.getStuName8());
//                jsonObject.put("stuNumber8", internetPlusDto.getStuNumber8());
//                jsonObject.put("prizeLevel", internetPlusDto.getPrizeLevel());
//                jsonObject.put("prizeTime", internetPlusDto.getPrizeTime());
//                jsonObject.put("hostUnit", internetPlusDto.getHostUnit());
//                jsonObject.put("teacherName", internetPlusDto.getTeacherName());
//
//                jsonArray.add(jsonObject);
//            }
//        }

        model.addAttribute("internetPlusDtoList", internetPlusDtoList);

        return "internet_plus/internet_plus_listByCondition_test";

    }



}
