package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.entities.category.OtherMatch;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.service.category.OtherMatchService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 8:12
 * @description : 其他比赛Controller
 */
@Controller
@RequestMapping(value = URLConstants.OTHER_MATCH_URL)
public class OtherMatchController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private OtherMatchService otherMatchService;

    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "other_match/other_match";
    }

    /**
     * 添加其他比赛获奖信息
     * @param matchName 比赛名
     * @param matchLevel 比赛等级
     * @param hostUnit 主办单位
     * @param teammateName1 队员1姓名
     * @param teammateStuNumber1 队员1学号
     * @param teammateName2 队员2姓名
     * @param teammateStuNumber2 队员2学号
     * @param teammateName3 队员3姓名
     * @param teammateStuNumber3 队员3学号
     * @param teammateName4 队员4姓名
     * @param teammateStuNumber4 队员4学号
     * @param teammateName5 队员5姓名
     * @param teammateStuNumber5 队员5学号
     * @param teammateName6 队员6姓名
     * @param teammateStuNumber6 队员6学号
     * @param teammateName7 队员7姓名
     * @param teammateStuNumber7 队员7学号
     * @param teammateName8 队员8姓名
     * @param teammateStuNumber8 队员8学号
     * @param projectName 项目名
     * @param prizeLevel 获奖等级
     * @param prizeTime 获奖时间
     * @param teacherName 教师姓名
     * @return 结果代码:
     *         1 - 成员1的姓名学号不匹配
     *         2 - 成员2的姓名学号不匹配
     *         3 - 成员3的姓名学号不匹配
     *         4 - 成员4的姓名学号不匹配
     *         5 - 成员5的姓名学号不匹配
     *         6 - 成员6的姓名学号不匹配
     *         7 - 成员7的姓名学号不匹配
     *         8 - 成员8的姓名学号不匹配
     *         9 - 该教师不存在
     *         10 - 插入成功
     *
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    @ResponseBody
    public Integer add(@RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                       @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                       @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
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

        OtherMatch otherMatch  = new OtherMatch();
        otherMatch.setMatchName(matchName);
        otherMatch.setMatchLevel(matchLevel);
        otherMatch.setHostUnit(hostUnit);
        if(student1 != null) {
            otherMatch.setTeammateId1(student1.getId());
        }
        if(student2 != null) {
            otherMatch.setTeammateId2(student2.getId());
        }
        if(student3 != null) {
            otherMatch.setTeammateId3(student3.getId());
        }
        if(student4 != null) {
            otherMatch.setTeammateId4(student4.getId());
        }
        if(student5 != null) {
            otherMatch.setTeammateId5(student5.getId());
        }
        if(student6 != null) {
            otherMatch.setTeammateId6(student6.getId());
        }
        if(student7 != null) {
            otherMatch.setTeammateId7(student7.getId());
        }
        if(student8 != null) {
            otherMatch.setTeammateId8(student8.getId());
        }
        otherMatch.setProjectName(projectName);
        otherMatch.setPrizeTime(prizeTime);
        otherMatch.setPrizeLevel(prizeLevel);
        if(teacher != null) {
            otherMatch.setTeacherId(teacher.getId());
        }

        otherMatchService.add(otherMatch);

        return 10;
    }


    @RequestMapping(value = "listByCondition/{curPage}", method = RequestMethod.GET)
    public String listByCondition(@PathVariable("curPage") Integer curPage,
                                  @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                  @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                  @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                  @RequestParam(value = "startTime", required = false) Date startTime,
                                  @RequestParam(value = "endTime", required = false) Date endTime,
                                  @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                  @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                  @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                  @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                  @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                  HttpServletRequest request,
                                  Model model) {
        Map<String, Object> params = null;
        params = otherMatchService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, stuName, majorCode, projectName, hostUnit, teacherName);

        int count = otherMatchService.countByCondition(params);
        int totalPage = count % pageSize == 0 ? count / pageSize : count / pageSize + 1;

        params = otherMatchService.getParams(params, curPage, totalPage);

        HttpSession session = request.getSession();
        session.setAttribute("otherMatchParams", params);

        List<OtherMatchDto> otherMatchDtoList = null;
        otherMatchDtoList = otherMatchService.listByCondition(params);


        model.addAttribute("otherMatchDtoList", otherMatchDtoList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPage", totalPage);

        return "other_match/other_match_list";
    }

    @RequestMapping(value = "toDetail/{id}")
    public String toDetail(@PathVariable("id") Integer id, Model model) {
        OtherMatchDto otherMatchDto = null;
        otherMatchDto = otherMatchService.selectById(id);

        model.addAttribute("otherMatchDto", otherMatchDto);
        return "other_match/detail";
    }

    @RequestMapping(value = "toPrevious")
    public String toPrevious(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = null;
        params = (Map)session.getAttribute("otherMatchParams");
        int totalPage = (int)params.get("totalPage");
        int curPage = (int)params.get("curPage");
        curPage -= 1;

        params = otherMatchService.getParams(params, curPage, totalPage);

        List<OtherMatchDto> otherMatchDtoList = null;
        otherMatchDtoList = otherMatchService.listByCondition(params);

        model.addAttribute("otherMatchDtoList", otherMatchDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

        return "other_match/other_match_list";

    }

    @RequestMapping(value = "toNext")
    public String toNext(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<String, Object> params = null;
        params = (Map)session.getAttribute("otherMatchParams");
        int totalPage = (int)params.get("totalPage");
        int curPage = (int)params.get("curPage");
        curPage += 1;

        params = otherMatchService.getParams(params, curPage, totalPage);

        List<OtherMatchDto> otherMatchDtoList = null;
        otherMatchDtoList = otherMatchService.listByCondition(params);

        model.addAttribute("otherMatchDtoList", otherMatchDtoList);
        model.addAttribute("curPage", params.get("curPage"));
        model.addAttribute("totalPage", params.get("totalPage"));

        return "other_match/other_match_list";

    }

}
