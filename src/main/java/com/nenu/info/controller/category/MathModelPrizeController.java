package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.category.MathModelPrize;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.*;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.MathModelPrizeService;
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
 * @time: 2017/12/11 9:23
 * @description : 数学建模Controller
 */

@Controller
@RequestMapping(value = URLConstants.MATH_MODEL_URL)
public class MathModelPrizeController extends AbstractController {

    /**
     * 去往数学建模添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "math_model/math_model_add";
    }

    /**
     * 去往数学建模列表页
     */
    @RequestMapping(value = "toList")
    public String toList() {
        return "math_model/math_model";
    }

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

    @RequestMapping(value = "listByCondition", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listByCondition(@RequestParam(value = "matchLevel", required = false, defaultValue = "-1") Integer matchLevel,
                                      @RequestParam(value = "matchName", required = false, defaultValue = "") String matchName,
                                      @RequestParam(value = "beginTime", required = false) Date beginTime,
                                      @RequestParam(value = "endTime", required = false) Date endTime,
                                      @RequestParam(value = "prizeLevel", required = false, defaultValue = "-1") Integer prizeLevel,
                                      @RequestParam(value = "major", required = false, defaultValue = "-1") Integer major,
                                      @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                      @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                      @RequestParam(value = "hostUnit", required = false, defaultValue = "") String hostUnit,
                                      HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");

        JSONArray jsonArray = new JSONArray();
        Map<String, Object> params = mathModelPrizeService.getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit);
        List<MathModelPrizeDto> mathModelPrizeDtoList = mathModelPrizeService.listByConditions(params);

        if(mathModelPrizeDtoList != null) {
            for(MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", mathModelPrizeDto.getId());
                if(mathModelPrizeDto.getMatchLevel() != null) {
                    jsonObject.put("matchLevel", mathModelPrizeDto.getMatchLevel());
                } else {
                    jsonObject.put("matchLevel", "");
                }
                if(mathModelPrizeDto.getMatchName() != null) {
                    jsonObject.put("matchName", mathModelPrizeDto.getMatchName());
                } else {
                    jsonObject.put("matchName", "");
                }
                if(mathModelPrizeDto.getHostUnit() != null) {
                    jsonObject.put("hostUnit", mathModelPrizeDto.getHostUnit());
                } else {
                    jsonObject.put("hostUnit", "");
                }
                if(mathModelPrizeDto.getPrizeTimeStr() != null) {
                    jsonObject.put("prizeTime", mathModelPrizeDto.getPrizeTimeStr());
                } else {
                    jsonObject.put("prizeTime", "");
                }
                if(mathModelPrizeDto.getPrizeLevel() != null) {
                    jsonObject.put("prizeLevel", mathModelPrizeDto.getPrizeLevel());
                } else {
                    jsonObject.put("prizeLevel", "");
                }
                if(mathModelPrizeDto.getTeamName() != null) {
                    jsonObject.put("teamName", mathModelPrizeDto.getTeamName());
                } else {
                    jsonObject.put("teamName", "");
                }
                jsonObject.put("stuNameArr", mathModelPrizeDto.getStuNameArr());
                jsonObject.put("stuNumberArr", mathModelPrizeDto.getStuNumberArr());
                jsonObject.put("majorArr", mathModelPrizeDto.getMajorArr());
                if(mathModelPrizeDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", mathModelPrizeDto.getTeacherName());
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
        MathModelPrizeDto mathModelPrizeDto = null;
        List<Material> materialList = null;
        mathModelPrizeDto = mathModelPrizeService.selectById(materialId);
        materialList = materialService.listByTypeAndId(materialId,5);

        if(mathModelPrizeDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("mathModelPrizeDto", mathModelPrizeDto);
        model.addAttribute("list", materialList);
        return "math_model/detail";
    }

    /**
     * 根据id对数学建模获奖信息进行假删操作
     * @return -1 - 删除失败
     *          1 - 删除成功
     */
    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = mathModelPrizeService.falseDeleteById(id);
        return code;
    }

    /**
     * 根据id删除数学建模获奖信息
     * @return -1 - 删除失败
     *          1 - 删除成功
     */
    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = mathModelPrizeService.deleteById(id);
        return code;
    }

    @RequestMapping(value="/upload/{materialId}/{mathModel}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("mathModel") String mathModel) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/mathModel/"+mathModel);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(5);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/mathModel/"+mathModel+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/mathModel/toDetail/"+materialId;
    }

    @RequestMapping("/down/{mathModel}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("mathModel") String mathModel) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/mathModel/"+mathModel);
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
        return "redirect:/mathModel/toDetail/"+material.getMatchId();
    }
}