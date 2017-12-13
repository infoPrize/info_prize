package com.nenu.info.controller;

import com.nenu.info.common.dto.ACMPrizeDto;
import com.nenu.info.common.dto.MathModelPrizeDto;
import com.nenu.info.common.entities.MathModelPrize;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.MathModelPrizeService;
import com.nenu.info.service.StudentService;
import com.nenu.info.service.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/11 9:23
 * @description : 数学建模Controller
 */

@Controller
@RequestMapping(value = URLConstants.MATH_MODEL_URL)
public class MathModelPrizeController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private MathModelPrizeService mathModelPrizeService;

    /**
     * 添加数学建模获奖信息
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

        MathModelPrize mathModelPrize = new MathModelPrize();
        if(matchLevel > 0) {
            mathModelPrize.setMatchLevel(matchLevel);
        } else {
            mathModelPrize.setMatchLevel(8);
        }
        if(prizeLevel > 0) {
            mathModelPrize.setPrizeLevel(prizeLevel);
        } else {
            mathModelPrize.setPrizeLevel(5);
        }
        mathModelPrize.setMatchName(matchName);
        mathModelPrize.setHostUnit(hostUnit);
        mathModelPrize.setPrizeTime(prizeTime);
        mathModelPrize.setTeacherId(teacher.getId());
        mathModelPrize.setTeammateId1(teammate1.getId());
        mathModelPrize.setTeammateId2(teammate2.getId());
        mathModelPrize.setTeammateId3(teammate3.getId());
        mathModelPrize.setTeamName(teamName);

        mathModelPrizeService.add(mathModelPrize);

        return 5;

    }

    @RequestMapping(value = "listByCondition", method = RequestMethod.POST)
    public JSONArray listByCondition(@RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                     @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                     @RequestParam(value = "beginTime", required = false) Date beginTime,
                                     @RequestParam(value = "endTime", required = false) Date endTime,
                                     @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                     @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                                     @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                     @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                     @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit) {
        JSONArray jsonArray = new JSONArray();
        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);
        for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
            JSONObject jsonObject = new JSONObject();

            jsonObject.put("matchLevel", mathModelPrizeDto.getMatchLevel());
            jsonObject.put("matchName", mathModelPrizeDto.getMatchName());
            jsonObject.put("hostUnit", mathModelPrizeDto.getHostUnit());
            jsonObject.put("prizeTime", mathModelPrizeDto.getPrizeTime());
            jsonObject.put("prizeLevel", mathModelPrizeDto.getPrizeLevel());
            jsonObject.put("teamName", mathModelPrizeDto.getTeamName());
            jsonObject.put("teammateName1", mathModelPrizeDto.getTeammateName1());
            jsonObject.put("teammateStuNumber1", mathModelPrizeDto.getTeammateStuNumber1());
            jsonObject.put("teammateMajor1", mathModelPrizeDto.getTeammateMajor1());
            jsonObject.put("teammateName2", mathModelPrizeDto.getTeammateName2());
            jsonObject.put("teammateStuNumber2", mathModelPrizeDto.getTeammateStuNumber2());
            jsonObject.put("teammateMajor2", mathModelPrizeDto.getTeammateMajor2());
            jsonObject.put("teammateName3", mathModelPrizeDto.getTeammateName3());
            jsonObject.put("teammateStuNumber3", mathModelPrizeDto.getTeammateStuNumber3());
            jsonObject.put("teammateMajor3", mathModelPrizeDto.getTeammateMajor3());
            jsonObject.put("teacherName", mathModelPrizeDto.getTeacherName());

            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }

}