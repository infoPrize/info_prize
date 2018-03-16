package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.utils.FileUtil;
import com.nenu.info.common.utils.MessageInfo;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.ZipUtil;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.PatentService;
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
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 11:38
 * @description : 专利controller
 */
@Controller
@RequestMapping(value = URLConstants.PATENT_URL)
public class PatentController extends AbstractController{

    /**
     * 去往专利添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "patent/patent_add";
    }


    @RequestMapping(value = "toList")
    public String toList() {
        return "patent/patent";
    }

    /**
     * 添加专利信息
     * @param patentType
     * @param patentName
     * @param applyTime
     * @param applierName1
     * @param applierStuNumber1
     * @param applierName2
     * @param applierStuNumber2
     * @param applierName3
     * @param applierStuNumber3
     * @param applierName4
     * @param applierStuNumber4
     * @param applierName5
     * @param applierStuNumber5
     * @param teacherName
     * @param patentIntroduce
     * @return 1 - 申请者1姓名学号不匹配
     *         2 - 申请者2姓名学号不匹配
     *         3 - 申请者3姓名学号不匹配
     *         4 - 申请者4姓名学号不匹配
     *         5 - 申请者5姓名学号不匹配
     *         6 - 教师不存在
     *         7 - 插入成功
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "patentType", required = false, defaultValue = "-1") Integer patentType,
                       @RequestParam(value = "patentName", required = false, defaultValue = "") String patentName,
                       @RequestParam(value = "applyTime", required = false) Date applyTime,
                       @RequestParam(value = "applierName1", required = false, defaultValue = "") String applierName1,
                       @RequestParam(value = "applierStuNumber1", required = false, defaultValue = "") String applierStuNumber1,
                       @RequestParam(value = "applierName2", required = false, defaultValue = "") String applierName2,
                       @RequestParam(value = "applierStuNumber2", required = false, defaultValue = "") String applierStuNumber2,
                       @RequestParam(value = "applierName3", required = false, defaultValue = "") String applierName3,
                       @RequestParam(value = "applierStuNumber3", required = false, defaultValue = "") String applierStuNumber3,
                       @RequestParam(value = "applierName4", required = false, defaultValue = "") String applierName4,
                       @RequestParam(value = "applierStuNumber4", required = false, defaultValue = "") String applierStuNumber4,
                       @RequestParam(value = "applierName5", required = false, defaultValue = "") String applierName5,
                       @RequestParam(value = "applierStuNumber5", required = false, defaultValue = "") String applierStuNumber5,
                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                       @RequestParam(value = "patentIntroduce", required = false, defaultValue = "") String patentIntroduce) {

        //如果第一名同学都没有输入，则返回1
        if(applierName1.equals("") && applierStuNumber1.equals("")) {
            return 1;
        }

        Student student1 = null;
        Student student2 = null;
        Student student3 = null;
        Student student4 = null;
        Student student5 = null;

        Teacher teacher = null;

        try {
            //首先检查几个学生是否输入合法
            if(!studentService.checkMatchingWithNameAndStuNumber(applierName1, applierStuNumber1)) {
                return 1;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(applierName2, applierStuNumber2)) {
                return 2;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(applierName3, applierStuNumber3)) {
                return 3;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(applierName4, applierStuNumber4)) {
                return 4;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(applierName5, applierStuNumber5)) {
                return 5;
            }

            //检查教师是否存在
            if(!teacherService.checkTeacherExist(teacherName)) {
                return 6;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
                student1 = studentService.selectStudentByStuNumber(applierStuNumber1);
                student2 = studentService.selectStudentByStuNumber(applierStuNumber2);
                student3 = studentService.selectStudentByStuNumber(applierStuNumber3);
                student4 = studentService.selectStudentByStuNumber(applierStuNumber4);
                student5 = studentService.selectStudentByStuNumber(applierStuNumber5);
                teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Patent patent = new Patent();
        patent.setPatentType(patentType);
        patent.setPatentName(patentName);
        patent.setApplyTime(applyTime);
        if(student1 != null) {
            patent.setOwnerId1(student1.getId());
        }
        if(student2 != null) {
            patent.setOwnerId2(student2.getId());
        }
        if(student3 != null) {
            patent.setOwnerId3(student3.getId());
        }
        if(student4 != null) {
            patent.setOwnerId4(student4.getId());
        }
        if(student5 != null) {
            patent.setOwnerId5(student5.getId());
        }
        if(teacher != null) {
            patent.setTeacherId(teacher.getId());
        }
        patent.setPatentIntroduce(patentIntroduce);

        try {
            patentService.add(patent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 7;
    }

    @RequestMapping(value = "listByCondition", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject listByCondition(@RequestParam(value = "patentType", required = false, defaultValue = "-1") Integer patentType,
                                      @RequestParam(value = "patentName", required = false, defaultValue = "") String patentName,
                                      @RequestParam(value = "beginTime", required = false) Date beginTime,
                                      @RequestParam(value = "endTime", required = false) Date endTime,
                                      @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                      @RequestParam(value = "grade", required = false, defaultValue = "") String grade,
                                      @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                      @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                      @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                      HttpServletResponse response) {
//        response.setHeader("Access-Control-Allow-Origin", "*");
        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = null;
        try {
            params = patentService.getParams(patentType, patentName, beginTime, endTime, majorCode, grade, stuNumber, stuName, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<PatentDto> patentDtoList = null;

        try {
            patentDtoList = patentService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(patentDtoList != null) {
            for(PatentDto patentDto : patentDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", patentDto.getId());
                if(patentDto.getPatentType() != null) {
                    jsonObject.put("patentType", patentDto.getPatentType());
                } else {
                    jsonObject.put("patentType", "");
                }
                if(patentDto.getPatentName() != null) {
                    jsonObject.put("patentName", patentDto.getPatentName());
                } else {
                    jsonObject.put("patentName", "");
                }
                if(patentDto.getApplyTimeStr() != null) {
                    jsonObject.put("applyTime", patentDto.getApplyTimeStr());
                } else {
                    jsonObject.put("applyTime", "");
                }
                jsonObject.put("stuNameArr", patentDto.getApplierNameArr());
                jsonObject.put("stuNumberArr", patentDto.getApplierStuNumberArr());
                jsonObject.put("stuMajorArr", patentDto.getApplierStuMajorArr());
                if(patentDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", patentDto.getTeacherName());
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
        PatentDto patentDto = null;
        List<Material> materialList = null;

        try {
            patentDto = patentService.selectById(materialId);
            materialList = materialService.listByTypeAndId(materialId,2);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(patentDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("patentDto", patentDto);
        model.addAttribute("list", materialList);
        return "patent/detail";

    }

    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = patentService.falseDeleteById(id);
        return code;
    }

    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = patentService.deleteById(id);
        return code;
    }

    @RequestMapping(value="/upload/{materialId}/{patentName}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("patentName") String patentName) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/patent/"+patentName);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(2);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/patent/"+patentName+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/patent/toDetail/"+materialId;
    }

    @RequestMapping("/down/{patentName}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("patentName") String patentName) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/patent/"+patentName);
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
        return "redirect:/patent/toDetail/"+material.getMatchId();
    }

}
