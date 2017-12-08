package com.nenu.info.controller;

import com.nenu.info.common.entities.ACMPrize;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.ACMService;
import com.nenu.info.service.StudentService;
import com.nenu.info.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 13:53
 * @description :
 */
@Controller
@RequestMapping(value = URLConstants.ACM_URL)
public class ACMController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ACMService acmService;

    /**
     * 添加ACM获奖信息
     * @param matchLevel 比赛等级
     * @param matchName 比赛名
     * @param prizeTime 获奖时间
     * @param prizeLevel  获奖等级
     * @param hostUnit 主办方
     * @param teamName 队伍名
     * @param teammateName1 队员1姓名
     * @param teammateStuNumber1 队员1学号
     * @param teammateName2 队员2姓名
     * @param teammateStuNumber2 队员2学号
     * @param teammateName3 队员3姓名
     * @param teammateStuNumber3 队员3学号
     * @param teacherName 教师姓名
     * @return 结果代码(-1 - 输入错误
     *                  1 - 队员1的姓名学号不匹配
     *                  2 - 队员2的姓名学号不匹配
     *                  3 - 队员3的姓名学号不匹配
     *                  4 - 该教师不存在
     *                  5 - 插入成功)
     */
    @RequestMapping(value = "add")
    @ResponseBody
    public Integer add(@RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                    @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                    @RequestParam(value = "prizeTime", required = false, defaultValue = "2018/01/01") Date prizeTime,
                    @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                    @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                    @RequestParam(value = "teamName", required = false, defaultValue = "") String teamName,
                    @RequestParam(value = "teammateName1", required = false, defaultValue = "") String teammateName1,
                    @RequestParam(value = "teammateStuNumber1", required = false, defaultValue = "") String teammateStuNumber1,
                    @RequestParam(value = "teammateName2", required = false, defaultValue = "") String teammateName2,
                    @RequestParam(value = "teammateStuNumber2", required = false, defaultValue = "") String teammateStuNumber2,
                    @RequestParam(value = "teammateName3", required = false, defaultValue = "") String teammateName3,
                    @RequestParam(value = "teammateStuNumber3", required = false, defaultValue = "") String teammateStuNumber3,
                    @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName) {

        Student teammate1 = null;
        Student teammate2 = null;
        Student teammate3 = null;
        Teacher teacher = null;

        //检查三个队员是否有错
        try {
            teammate1 = studentService.selectStudentByStuNumber(teammateStuNumber1);
            teammate2 = studentService.selectStudentByStuNumber(teammateStuNumber2);
            teammate3 = studentService.selectStudentByStuNumber(teammateStuNumber3);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        //检查三个人是都有人姓名学号不匹配
        if(teammate1 == null || !teammateName1.equals(teammate1.getName())) {
            return 1;
        } else if(teammate2 == null || !teammateName2.equals(teammate2.getName())) {
            return 2;
        } else if(teammate3 == null || !teammateName3.equals(teammate3.getName())) {
            return 3;
        }

        //检查教师是否存在
        try {
            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(teacher == null) {
            return 4;
        }

        ACMPrize acmPrize = new ACMPrize();
        if(matchLevel > 0) {
            acmPrize.setMatchLevel(matchLevel);
        } else {
            acmPrize.setMatchLevel(8);
        }
        acmPrize.setMatchName(matchName);
        acmPrize.setHostUnit(hostUnit);
        acmPrize.setPrizeTime(prizeTime);
        acmPrize.setTeacherId(teacher.getId());
        acmPrize.setTeammateId1(teammate1.getId());
        acmPrize.setTeammateId2(teammate2.getId());
        acmPrize.setTeammateId3(teammate3.getId());
        acmPrize.setTeamName(teamName);

        acmService.add(acmPrize);

        return 5;
    }

}
