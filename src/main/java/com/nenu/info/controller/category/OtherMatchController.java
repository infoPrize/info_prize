package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.category.OtherMatch;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.FileUtil;
import com.nenu.info.common.utils.MessageInfo;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.ZipUtil;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.OtherMatchService;
import com.nenu.info.service.common.MaterialService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
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
public class OtherMatchController extends AbstractController {

    /**
     * 去往其他比赛添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "other_match/other_match_add";
    }

    /**
     * 去往其他比赛列表页
     */
    @RequestMapping(value = "toList")
    public String toList() {
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
    @RequestMapping(value = "add", method = RequestMethod.POST)
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

        //如果第一名同学都没有输入，则返回1
        if(teammateName1.equals("") && teammateStuNumber1.equals("")) {
            return 1;
        }

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

        StudentDto student1 = null;        StudentDto student2 = null;
        StudentDto student3 = null;        StudentDto student4 = null;
        StudentDto student5 = null;        StudentDto student6 = null;
        StudentDto student7 = null;        StudentDto student8 = null;
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


    @RequestMapping(value = "listByCondition", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listByCondition(@RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                      @RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                      @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                      @RequestParam(value = "startTime", required = false) Date startTime,
                                      @RequestParam(value = "endTime", required = false) Date endTime,
                                      @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                      @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                      @RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                      @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                      @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                      HttpServletResponse response) {
//        response.setHeader("Access-Control-Allow-Origin", "*");
        JSONArray jsonArray = new JSONArray();
        Map<String, Object> params = null;
        params = otherMatchService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, stuName, majorCode, projectName, hostUnit, teacherName);

        List<OtherMatchDto> otherMatchDtoList = null;
        otherMatchDtoList = otherMatchService.listByCondition(params);

        if(otherMatchDtoList != null) {
            for(OtherMatchDto otherMatchDto : otherMatchDtoList) {
                JSONObject jsonObject  = new JSONObject();
                jsonObject.put("id", otherMatchDto.getId());
                if(otherMatchDto.getMatchLevel() != null) {
                    jsonObject.put("matchLevel", otherMatchDto.getMatchLevel());
                } else {
                    jsonObject.put("matchLevel", "");
                }
                if(otherMatchDto.getMatchName() != null) {
                    jsonObject.put("matchName", otherMatchDto.getMatchName());
                } else {
                    jsonObject.put("matchName", "");
                }
                if(otherMatchDto.getHostUnit() != null) {
                    jsonObject.put("hostUnit", otherMatchDto.getHostUnit());
                } else {
                    jsonObject.put("hostUnit", "");
                }
                jsonObject.put("stuNameArr", otherMatchDto.getStuNameArr());
                jsonObject.put("stuNumberArr", otherMatchDto.getStuNumberArr());
                jsonObject.put("stuMajorArr", otherMatchDto.getStuMajorArr());
                if(otherMatchDto.getProjectName() != null) {
                    jsonObject.put("projectName", otherMatchDto.getProjectName());
                } else {
                    jsonObject.put("projectName", "");
                }
                if(otherMatchDto.getPrizeTimeStr() != null) {
                    jsonObject.put("prizeTime", otherMatchDto.getPrizeTimeStr());
                } else {
                    jsonObject.put("prizeTime", "");
                }
                if(otherMatchDto.getPrizeLevel() != null) {
                    jsonObject.put("prizeLevel", otherMatchDto.getPrizeLevel());
                } else {
                    jsonObject.put("prizeLevel", "");
                }
                if(otherMatchDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", otherMatchDto.getTeacherName());
                } else {
                    jsonObject.put("teacherName", "");
                }

                jsonArray.add(jsonObject);
            }
        }

        return sendJSONArray(jsonArray);
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId, Model model) throws Exception {
        OtherMatchDto otherMatchDto = null;
        List<Material> materialList = null;

        otherMatchDto = otherMatchService.selectById(materialId);
        materialList = materialService.listByTypeAndId(materialId,8);

        if(otherMatchDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("otherMatchDto", otherMatchDto);
        model.addAttribute("list", materialList);
        
        return "other_match/detail";
    }

    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = otherMatchService.falseDeleteById(id);
        return code;
    }

    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = otherMatchService.deleteById(id);
        return code;
    }

    @RequestMapping(value="/upload/{materialId}/{projectName}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("projectName") String projectName) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/otherMatch/"+projectName);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(8);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/otherMatch/"+projectName+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/otherMatch/toDetail/"+materialId;
    }

    @RequestMapping("/down/{projectName}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("projectName") String projectName) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/otherMatch/"+projectName);
        ZipUtil.toZip(path,out,true);

    }

    @RequestMapping(value = "delete/material",method = RequestMethod.GET)
    public String delete(Material material,Model model,HttpServletRequest request) throws Exception{

        String path = request.getSession().getServletContext().getRealPath(material.getMaterialUrl());
        FileUtil.delete(path);
        Integer code = materialService.DelById(material.getId());
        if(code == 1){
            model.addAttribute("message", MessageInfo.DELETE_SUCCESS);
        }else {
            model.addAttribute("message", MessageInfo.DELETE_FAIL);
        }
        return "redirect:/otherMatch/toDetail/"+material.getMatchId();
    }


}
