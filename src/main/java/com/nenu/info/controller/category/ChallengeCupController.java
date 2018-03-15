package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.entities.category.ChallengeCup;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.*;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.ChallengeCupService;
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
public class ChallengeCupController extends AbstractController{

    /**
     * 去往挑战杯添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "challenge_cup/challenge_cup_add";
    }

    /**
     * 去往挑战杯添加页面
     */
    @RequestMapping(value = "toList")
    public String toList() {
        return "challenge_cup/challenge_cup";
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
        if(teacher != null) {
            challengeCup.setTeacherId(teacher.getId());
        }
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

    @RequestMapping(value = "listByCondition", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listByCondition(@RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
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
                                      HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        List<ChallengeCupDto> challengeCupDtoList = null;
        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = null;
        try {
            params = challengeCupService.getParams(matchName, matchLevel, prizeLevel, startTime, endTime, teamName, stuName,
                    majorCode, projectName, hostUnit, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            challengeCupDtoList = challengeCupService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(challengeCupDtoList != null) {
            for(ChallengeCupDto challengeCupDto : challengeCupDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", challengeCupDto.getId());
                if(challengeCupDto.getMatchLevel() != null) {
                    jsonObject.put("matchLevel", challengeCupDto.getMatchLevel());
                } else {
                    jsonObject.put("matchLevel", "");
                }
                if(challengeCupDto.getMatchName() != null) {
                    jsonObject.put("matchName", challengeCupDto.getMatchName());
                } else {
                    jsonObject.put("matchName", "");
                }
                if(challengeCupDto.getProjectName() != null) {
                    jsonObject.put("projectName", challengeCupDto.getProjectName());
                } else {
                    jsonObject.put("projectName", "");
                }
                if(challengeCupDto.getTeamName() != null) {
                    jsonObject.put("teamName", challengeCupDto.getTeamName());
                } else {
                    jsonObject.put("teamName", "");
                }
                jsonObject.put("stuNameArr", challengeCupDto.getStuNameArr());
                jsonObject.put("stuNumberArr", challengeCupDto.getStuNumberArr());
                jsonObject.put("stuMajorArr", challengeCupDto.getStuMajorArr());
                if(challengeCupDto.getPrizeLevel() != null) {
                    jsonObject.put("prizeLevel", challengeCupDto.getPrizeLevel());
                } else {
                    jsonObject.put("prizeLevel", "");
                }
                if(challengeCupDto.getPrizeTimeStr() != null) {
                    jsonObject.put("prizeTime", challengeCupDto.getPrizeTimeStr());
                } else {
                    jsonObject.put("prizeTime", "");
                }
                if(challengeCupDto.getHostUnit() != null) {
                    jsonObject.put("hostUnit", challengeCupDto.getHostUnit());
                } else {
                    jsonObject.put("hostUnit", "");
                }
                if(challengeCupDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", challengeCupDto.getTeacherName());
                } else {
                    jsonObject.put("teacherName", "");
                }
                jsonArray.add(jsonObject);
            }
        }

        return sendJSONArray(jsonArray);
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId, Model model) {
        ChallengeCupDto challengeCupDto = null;
        List<Material> materialList = null;
        try {
            challengeCupDto = challengeCupService.selectById(materialId);
            materialList = materialService.listByTypeAndId(materialId,6);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("challengeCupDto", challengeCupDto);
        model.addAttribute("list", materialList);

        return "challenge_cup/detail";
    }

    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = challengeCupService.falseDeleteById(id);
        return code;
    }

    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = challengeCupService.deleteById(id);
        return code;
    }

    @RequestMapping(value="/upload/{materialId}/{projectName}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("projectName") String projectName) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/ChallengeCup/"+projectName);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(6);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/ChallengeCup/"+projectName+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/ChallengeCup/toDetail/"+materialId;
    }

    @RequestMapping("/down/{projectName}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("projectName") String projectName) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/ChallengeCup/"+projectName);
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
        return "redirect:/ChallengeCup/toDetail/"+material.getMatchId();
    }

}
