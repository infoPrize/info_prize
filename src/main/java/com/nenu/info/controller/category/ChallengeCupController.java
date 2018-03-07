package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.ChallengeCup;
import com.nenu.info.common.entities.category.InternetPlus;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.ChallengeCupService;
import com.nenu.info.service.category.InternetPlusService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/2/2 18:26
 * @description: 挑战杯Controller
 */
@Controller
@RequestMapping(value = URLConstants.CHALLENGE_CUP_URL)
public class ChallengeCupController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ChallengeCupService challengeCupService;

    @RequestMapping(value = "toAdd")
    public String toChallengeCupAdd() {
        return "challenge_cup/challenge_cup_add_test";
    }

    @RequestMapping(value = "toList")
    public String toChallengeCupListByCondition() {
        return "challenge_cup/challenge_cup_listByCondition_test";
    }


    /**
     * 添加挑战杯获奖信息
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
    @RequestMapping(value = "add", method = RequestMethod.POST)
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

        ChallengeCup challengeCup = new ChallengeCup();
        challengeCup.setProjectName(projectName);
        challengeCup.setTeamName(teamName);
        challengeCup.setHostUnit(hostUnit);
        if(student1 != null) {
            challengeCup.setTeammateId1(student1.getId());
        }
        if(student2 != null) {
            challengeCup.setTeammateId2(student2.getId());
        }
        if(student3 != null) {
            challengeCup.setTeammateId3(student3.getId());
        }
        if(student4 != null) {
            challengeCup.setTeammateId4(student4.getId());
        }
        if(student5 != null) {
            challengeCup.setTeammateId5(student5.getId());
        }
        if(student6 != null) {
            challengeCup.setTeammateId6(student6.getId());
        }
        if(student7 != null) {
            challengeCup.setTeammateId7(student7.getId());
        }
        if(student8 != null) {
            challengeCup.setTeammateId8(student8.getId());
        }
        challengeCup.setTeacherId(teacher.getId());
        challengeCup.setMatchName(matchName);
        challengeCup.setMatchLevel(matchLevel);
        challengeCup.setPrizeLevel(prizeLevel);
        challengeCup.setPrizeTime(prizeTime);

        try {
            challengeCupService.add(challengeCup);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 10;
    }


    @RequestMapping(value = "listByCondition/{curPage}", method = RequestMethod.GET)
//    @ResponseBody
    public String listByCondition(@PathVariable("curPage") Integer curPage,
                                  @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
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
                                  @RequestParam(value = "message", required = false, defaultValue = "") String message,
                                  Model model,
                                  HttpServletRequest request ) {

        List<ChallengeCupDto> challengeCupDtoList = null;
//        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = null;
        try {
            params = challengeCupService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName,
                    majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int count = 0;

        try {
            count = challengeCupService.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        int pageSize = WebConstants.pageSize;
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        try {
            params = challengeCupService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("challengeCupParams", params);

        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(challengeCupDtoList != null) {
            for (ChallengeCupDto challengCupDto : challengeCupDtoList) {
                Date prizeTime = challengCupDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                challengCupDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        model.addAttribute("challengeCupDtoList", challengeCupDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);


//        if(challengeCupDtoList != null) {
//            for (ChallengeCupDto challengeCupDto : challengeCupDtoList) {
//                JSONObject jsonObject = new JSONObject();
//                jsonObject.put("matchLevel", challengeCupDto.getMatchLevel());
//                jsonObject.put("matchName", challengeCupDto.getMatchName());
//                jsonObject.put("projectName", challengeCupDto.getProjectName());
//                jsonObject.put("teamName", challengeCupDto.getTeamName());
//                jsonObject.put("stuName1", challengeCupDto.getStuName1());
//                jsonObject.put("stuNumber1", challengeCupDto.getStuNumber1());
//                jsonObject.put("stuName2", challengeCupDto.getStuName2());
//                jsonObject.put("stuNumber2", challengeCupDto.getStuNumber2());
//                jsonObject.put("stuName3", challengeCupDto.getStuName3());
//                jsonObject.put("stuNumber3", challengeCupDto.getStuNumber3());
//                jsonObject.put("stuName4", challengeCupDto.getStuName4());
//                jsonObject.put("stuNumber4", challengeCupDto.getStuNumber4());
//                jsonObject.put("stuName5", challengeCupDto.getStuName5());
//                jsonObject.put("stuNumber5", challengeCupDto.getStuNumber5());
//                jsonObject.put("stuName6", challengeCupDto.getStuName6());
//                jsonObject.put("stuNumber6", challengeCupDto.getStuNumber6());
//                jsonObject.put("stuName7", challengeCupDto.getStuName7());
//                jsonObject.put("stuNumber7", challengeCupDto.getStuNumber7());
//                jsonObject.put("stuName8", challengeCupDto.getStuName8());
//                jsonObject.put("stuNumber8", challengeCupDto.getStuNumber8());
//                jsonObject.put("prizeLevel", challengeCupDto.getPrizeLevel());
//                jsonObject.put("prizeTime", challengeCupDto.getPrizeTime());
//                jsonObject.put("hostUnit", challengeCupDto.getHostUnit());
//                jsonObject.put("teacherName", challengeCupDto.getTeacherName());
//
//                jsonArray.add(jsonObject);
//            }
//        }

//        return jsonArray;
        model.addAttribute("message",message);

        return "challenge_cup/challenge_cup_listByCondition_test";
    }

    @RequestMapping(value = "toPrevious")
    public String toPrevious(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        Map<String, Object> params = (Map)session.getAttribute("challengeCupParams");
        int curPage = (int)params.get("curPage");
        int totalPage = (int)params.get("totalPage");

        curPage -= 1;

        try {
            params = challengeCupService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<ChallengeCupDto> challengeCupDtoList = null;
        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(challengeCupDtoList != null) {
            for (ChallengeCupDto challengCupDto : challengeCupDtoList) {
                Date prizeTime = challengCupDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                challengCupDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        model.addAttribute("challengeCupDtoList", challengeCupDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

        return "challenge_cup/challenge_cup_listByCondition_test";
    }

    @RequestMapping(value = "toNext")
    public String toNext(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();

        Map<String, Object> params = (Map)session.getAttribute("challengeCupParams");
        int curPage = (int)params.get("curPage");
        int totalPage = (int)params.get("totalPage");

        curPage += 1;

        try {
            params = challengeCupService.getParams(params, curPage, totalPage);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<ChallengeCupDto> challengeCupDtoList = null;
        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(challengeCupDtoList != null) {
            for (ChallengeCupDto challengCupDto : challengeCupDtoList) {
                Date prizeTime = challengCupDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                challengCupDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        model.addAttribute("challengeCupDtoList", challengeCupDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

        return "challenge_cup/challenge_cup_listByCondition_test";
    }

}
