package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.category.MathModelPrize;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.MathModelPrizeService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping(value = "listByCondition/{curPage}", method = RequestMethod.GET)
//    @ResponseBody
    public String listByCondition(@PathVariable("curPage") Integer curPage,
                                  @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                  @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                  @RequestParam(value = "beginTime", required = false) Date beginTime,
                                  @RequestParam(value = "endTime", required = false) Date endTime,
                                  @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                  @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                                  @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                  @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                  @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                  Model model, HttpServletRequest request) {
//        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = mathModelPrizeService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);
        int count = 0;
        count = mathModelPrizeService.countByConditions(params);

        int pageSize = WebConstants.pageSize;
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        if(curPage <= 0) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        params = mathModelPrizeService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit, curPage, totalPage);

        HttpSession session = request.getSession();
        session.setAttribute("mathModelParams", params);
//        session.setAttribute("mathModelTotalPage", totalPage);

        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
            Date prizeTime = mathModelPrizeDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);

            mathModelPrizeDto.setPrizeTimeStr(prizeTimeStr);
        }

        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("curPage", curPage);
//        for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
//            JSONObject jsonObject = new JSONObject();
//
//            jsonObject.put("matchLevel", mathModelPrizeDto.getMatchLevel());
//            jsonObject.put("matchName", mathModelPrizeDto.getMatchName());
//            jsonObject.put("hostUnit", mathModelPrizeDto.getHostUnit());
//            jsonObject.put("prizeTime", mathModelPrizeDto.getPrizeTime());
//            jsonObject.put("prizeLevel", mathModelPrizeDto.getPrizeLevel());
//            jsonObject.put("teamName", mathModelPrizeDto.getTeamName());
//            jsonObject.put("teammateName1", mathModelPrizeDto.getTeammateName1());
//            jsonObject.put("teammateStuNumber1", mathModelPrizeDto.getTeammateStuNumber1());
//            jsonObject.put("teammateMajor1", mathModelPrizeDto.getTeammateMajor1());
//            jsonObject.put("teammateName2", mathModelPrizeDto.getTeammateName2());
//            jsonObject.put("teammateStuNumber2", mathModelPrizeDto.getTeammateStuNumber2());
//            jsonObject.put("teammateMajor2", mathModelPrizeDto.getTeammateMajor2());
//            jsonObject.put("teammateName3", mathModelPrizeDto.getTeammateName3());
//            jsonObject.put("teammateStuNumber3", mathModelPrizeDto.getTeammateStuNumber3());
//            jsonObject.put("teammateMajor3", mathModelPrizeDto.getTeammateMajor3());
//            jsonObject.put("teacherName", mathModelPrizeDto.getTeacherName());
//
//            jsonArray.add(jsonObject);
//        }
//        return jsonArray;

        return "math_model";
    }

//    @RequestMapping(value = "toMathModel")
//    public String toMathModel(Model model) {
//        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(-1, "", null, null,-1, -1,"", "", "");
//        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
//
//        return "math_model";
//    }

    @RequestMapping(value = "toPrevious")
    public String toPrevious(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = (Map)session.getAttribute("mathModelParams");

        int curPage = (int)params.get("curPage");
        curPage -= 1;

        int totalPage = (int)params.get("totalPage");

        if(curPage <= 0) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        params.put("curPage", curPage);

        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
            Date prizeTime = mathModelPrizeDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);

            mathModelPrizeDto.setPrizeTimeStr(prizeTimeStr);
        }

        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);

        return "math_model";
    }

    @RequestMapping(value = "toNext")
    public String toNext(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = (Map)session.getAttribute("mathModelParams");

        int curPage = (int)params.get("curPage");
        curPage += 1;

        int totalPage = (int)params.get("totalPage");

        if(curPage <= 0) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        params.put("curPage", curPage);

        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
            Date prizeTime = mathModelPrizeDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);

            mathModelPrizeDto.setPrizeTimeStr(prizeTimeStr);
        }

        model.addAttribute("mathModelPrizeDtoList", mathModelPrizeDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);

        return "math_model";
    }
}