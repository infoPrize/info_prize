package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.entities.category.ACMPrize;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;

import com.nenu.info.common.utils.*;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.ACMService;
import com.nenu.info.service.common.MaterialService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
 * @time: 2017/12/8 13:53
 * @description : ACM获奖信息Controller
 */
@Controller
@RequestMapping(value = URLConstants.ACM_URL)
public class ACMController extends AbstractController{

    /**
     * 去往添加ACM信息的页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "ACM/ACM_add";
    }

    /**
     * 去往ACM列表页
     */
    @RequestMapping(value = "toList")
    public String toList() {
        return "ACM/ACM";
    }

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
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                       @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                       @RequestParam(value = "prizeTime", required = false) Date prizeTime,
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

        try {
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName1, teammateStuNumber1)) {
                return 1;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName2, teammateStuNumber2)) {
                return 2;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(teammateName3, teammateStuNumber3)) {
                return 3;
            }

            if(!teacherService.checkTeacherExist(teacherName)) {
                return 4;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        Student teammate1 = null;
        Student teammate2 = null;
        Student teammate3 = null;
        Teacher teacher = null;

        //检查三个队员是否有错
        try {
            teammate1 = studentService.selectStudentByStuNumber(teammateStuNumber1);
            teammate2 = studentService.selectStudentByStuNumber(teammateStuNumber2);
            teammate3 = studentService.selectStudentByStuNumber(teammateStuNumber3);

            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ACMPrize acmPrize = new ACMPrize();
        if(matchLevel > 0) {
            acmPrize.setMatchLevel(matchLevel);
        } else {
            acmPrize.setMatchLevel(8);
        }
        if(prizeLevel > 0) {
            acmPrize.setPrizeLevel(prizeLevel);
        } else {
            acmPrize.setPrizeLevel(5);
        }
        acmPrize.setMatchName(matchName);
        acmPrize.setHostUnit(hostUnit);
        acmPrize.setPrizeTime(prizeTime);
        if(teacher != null) {
            acmPrize.setTeacherId(teacher.getId());
        }
        if(teammate1 != null) {
            acmPrize.setTeammateId1(teammate1.getId());
        }
        if(teammate2 != null) {
            acmPrize.setTeammateId2(teammate2.getId());
        }
        if(teammate3 != null) {
            acmPrize.setTeammateId3(teammate3.getId());
        }
        acmPrize.setTeamName(teamName);

        acmService.add(acmPrize);

        return 5;
    }

    /**
     * 根据条件查询ACM获奖信息
     * @param matchLevel 比赛等级
     * @param matchName 比赛名称
     * @param beginTime 起始时间
     * @param endTime 终止时间
     * @param prizeLevel 获奖等级
     * @param major 学生专业
     * @param stuName 学生姓名
     * @param teacherName 教师姓名
     * @param hostUnit 主办单位
     * @return
     */
    @RequestMapping(value = "listByCondition", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listACMPrizeByConditions(@RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                               @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                               @RequestParam(value = "beginTime", required = false) Date beginTime,
                                               @RequestParam(value = "endTime", required = false) Date endTime,
                                               @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                               @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                                               @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                               @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                               @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                               @RequestParam(value = "message", required = false, defaultValue = "") String message,
                                               HttpServletResponse response) {
//        response.setHeader("Access-Control-Allow-Origin", "*");
        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = acmService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);
        List<ACMPrizeDto> acmPrizeDtoList = acmService.listByConditions(params);
        if(acmPrizeDtoList != null) {
            for(ACMPrizeDto acmPrizeDto : acmPrizeDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", acmPrizeDto.getId());
                if(acmPrizeDto.getMatchLevel() != null) {
                    jsonObject.put("matchLevel", acmPrizeDto.getMatchLevel());
                } else {
                    jsonObject.put("matchLevel", "");
                }
                if(acmPrizeDto.getMatchName() != null) {
                    jsonObject.put("matchName", acmPrizeDto.getMatchName());
                } else {
                    jsonObject.put("matchName", "");
                }
                if(acmPrizeDto.getHostUnit() != null) {
                    jsonObject.put("hostUnit", acmPrizeDto.getHostUnit());
                } else {
                    jsonObject.put("hostUnit", "");
                }
                if(acmPrizeDto.getPrizeTimeStr() != null) {
                    jsonObject.put("prizeTime", acmPrizeDto.getPrizeTimeStr());
                } else {
                    jsonObject.put("prizeTime", "");
                }
                if(acmPrizeDto.getPrizeLevel() != null) {
                    jsonObject.put("prizeLevel", acmPrizeDto.getPrizeLevel());
                } else {
                    jsonObject.put("prizeLevel", "");
                }
                if(acmPrizeDto.getTeamName() != null) {
                    jsonObject.put("teamName", acmPrizeDto.getTeamName());
                } else {
                    jsonObject.put("teamName", "");
                }
                jsonObject.put("stuNameArr", acmPrizeDto.getStuNameArr());
                jsonObject.put("stuNumberArr", acmPrizeDto.getStuNumberArr());
                jsonObject.put("majorArr", acmPrizeDto.getMajorArr());
                if(acmPrizeDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", acmPrizeDto.getTeacherName());
                } else {
                    jsonObject.put("teacherName", "");
                }
                jsonArray.add(jsonObject);
            }
        }

        return sendJSONArray(jsonArray);
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId,
                           Model model) throws Exception {

        ACMPrizeDto acmPrizeDto = null;
        List<Material> materialList = null;

        acmPrizeDto = acmService.selectById(materialId);
        materialList = materialService.listByTypeAndId(materialId,4);
        if(acmPrizeDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("acmPrizeDto", acmPrizeDto);
        model.addAttribute("list", materialList);

        return "ACM/detail";
    }


    /**
     * 根据id对ACM获奖信息进行假删操作
     * @return -1 - 删除操作失败
     *          1 - 删除操作成功
     */
    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {

        Integer code = null;
        code = acmService.falseDeleteById(id);
        return code;
    }

    /**
     * 根据id删除ACM获奖信息
     * @return -1 - 删除操作失败
     *          1 - 删除操作成功
     */
    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = acmService.deleteById(id);
        return code;
    }


    @RequestMapping(value="/upload/{materialId}/{teamName}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("teamName") String teamName) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/acm/"+teamName);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(4);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/acm/"+teamName+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/acm/toDetail/"+materialId;
    }

    @RequestMapping("/down/{teamName}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("teamName") String teamName) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/acm/"+teamName);
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
        return "redirect:/acm/toDetail/"+material.getMatchId();
    }

}
