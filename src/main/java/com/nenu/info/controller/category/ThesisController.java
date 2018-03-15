package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.entities.category.Thesis;
import com.nenu.info.common.utils.FileUtil;
import com.nenu.info.common.utils.MessageInfo;
import com.nenu.info.common.utils.URLConstants;
import com.nenu.info.common.utils.ZipUtil;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.ThesisService;
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
import java.io.*;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 14:15
 * @description : 论文Controller
 */

@Controller
@RequestMapping(value = URLConstants.THESIS_URL)
public class ThesisController extends AbstractController {

    /**
     * 去往论文添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "thesis/thesis_add";
    }

    /**
     * 去往论文列表页
     */
    @RequestMapping(value = "toList")
    public String toList() {
        return "thesis/thesis";
    }

    /**
     * 添加论文信息
     * @param journalName 期刊名
     * @param journalLevel 期刊等级
     * @param thesisTitle  论文题目
     * @param publishTime  发布时间
     * @param authorName1  作者姓名1
     * @param authorStuNumber1  作者1学号
     * @param authorName2   作者2姓名
     * @param authorStuNumber2  作者2学号
     * @param authorName3   作者3姓名
     * @param authorStuNumber3  作者3学号
     * @param authorName4   作者4姓名
     * @param authorStuNumber4  作者4学号
     * @param authorName5   作者5姓名
     * @param authorStuNumber5  作者5学号
     * @param teacherName   教师姓名
     * @param thesisAbstract    论文摘要
     * @return  1 - 插入成功
     *          2 - 第一位学生 学号姓名不匹配
     *          3 - 第二位学生 学号姓名不匹配
     *          4 - 第三位学生 学号姓名不匹配
     *          5 - 第四位学生 学号姓名不匹配
     *          6 - 第五位学生 学号姓名不匹配
     *          7 - 教师不存在
     *
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "journalName", required = false, defaultValue = "") String journalName,
                       @RequestParam(value = "journalLevel", required = false, defaultValue = "-1") Integer journalLevel,
                       @RequestParam(value = "thesisTitle", required = false, defaultValue = "") String thesisTitle,
                       @RequestParam(value = "publishTime", required = false) Date publishTime,
                       @RequestParam(value = "authorName1", required = false, defaultValue = "") String authorName1,
                       @RequestParam(value = "authorStuNumber1", required = false, defaultValue = "") String authorStuNumber1,
                       @RequestParam(value = "authorLevel1", required = false, defaultValue = "-1") Integer authorLevel1,
                       @RequestParam(value = "authorName2", required = false, defaultValue = "") String authorName2,
                       @RequestParam(value = "authorStuNumber2", required = false, defaultValue = "") String authorStuNumber2,
                       @RequestParam(value = "authorLevel2", required = false, defaultValue = "-1") Integer authorLevel2,
                       @RequestParam(value = "authorName3", required = false, defaultValue = "") String authorName3,
                       @RequestParam(value = "authorStuNumber3", required = false, defaultValue = "") String authorStuNumber3,
                       @RequestParam(value = "authorLevel3", required = false, defaultValue = "-1") Integer authorLevel3,
                       @RequestParam(value = "authorName4", required = false, defaultValue = "") String authorName4,
                       @RequestParam(value = "authorStuNumber4", required = false, defaultValue = "") String authorStuNumber4,
                       @RequestParam(value = "authorLevel4", required = false, defaultValue = "-1") Integer authorLevel4,
                       @RequestParam(value = "authorName5", required = false, defaultValue = "") String authorName5,
                       @RequestParam(value = "authorStuNumber5", required = false, defaultValue = "") String authorStuNumber5,
                       @RequestParam(value = "authorLevel5", required = false, defaultValue = "-1") Integer authorLevel5,
                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                       @RequestParam(value = "thesisAbstract", required = false, defaultValue = "") String thesisAbstract) {
        Student student1 = null;
        Student student2 = null;
        Student student3 = null;
        Student student4 = null;
        Student student5 = null;

        Teacher teacher = null;

        try {
            //首先检查几个学生是否输入合法
            if(!studentService.checkMatchingWithNameAndStuNumber(authorName1, authorStuNumber1)) {
                return 1;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(authorName2, authorStuNumber2)) {
                return 2;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(authorName3, authorStuNumber3)) {
                return 3;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(authorName4, authorStuNumber4)) {
                return 4;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(authorName5, authorStuNumber5)) {
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
            student1 = studentService.selectStudentByStuNumber(authorStuNumber1);
            student2 = studentService.selectStudentByStuNumber(authorStuNumber2);
            student3 = studentService.selectStudentByStuNumber(authorStuNumber3);
            student4 = studentService.selectStudentByStuNumber(authorStuNumber4);
            student5 = studentService.selectStudentByStuNumber(authorStuNumber5);
            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Thesis thesis = new Thesis();
        thesis.setThesisTitle(thesisTitle);
        if(student1 != null) {
            thesis.setAuthorId1(student1.getId());
            thesis.setAuthorLevel1(authorLevel1);
        }

        if(student2 != null) {
            thesis.setAuthorId2(student2.getId());
            thesis.setAuthorLevel2(authorLevel2);
        }

        if(student3 != null) {
            thesis.setAuthorId3(student3.getId());
            thesis.setAuthorLevel3(authorLevel3);
        }

        if(student4 != null) {
            thesis.setAuthorId4(student4.getId());
            thesis.setAuthorLevel4(authorLevel4);
        }

        if(student5 != null) {
            thesis.setAuthorId5(student5.getId());
            thesis.setAuthorLevel5(authorLevel5);
        }

        thesis.setPublishTime(publishTime);
        if(journalLevel > 0) {
            thesis.setJournalLevel(journalLevel);
        }
        thesis.setJournalName(journalName);
        thesis.setThesisAbstract(thesisAbstract);
        if(teacher != null) {
            thesis.setTeacherId(teacher.getId());
        }

        try {
            thesisService.add(thesis);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }

    @RequestMapping(value = "listByCondition")
    @ResponseBody
    public JSONObject listByCondition(@RequestParam(value = "journalLevel", required = false, defaultValue = "-1") Integer journalLevel,
                                      @RequestParam(value = "thesisTitle", required = false, defaultValue = "") String thesisTitle,
                                      @RequestParam(value = "journalName", required = false, defaultValue = "") String journalName,
                                      @RequestParam(value = "authorName", required = false, defaultValue = "") String authorName,
                                      @RequestParam(value = "authorStuNumber", required = false, defaultValue = "") String authorStuNumber,
                                      @RequestParam(value = "authorMajor", required = false, defaultValue = "-1") Integer authorMajor,
                                      @RequestParam(value = "authorGrade", required = false, defaultValue = "") String authorGrade,
                                      @RequestParam(value = "beginTime", required = false) Date beginTime,
                                      @RequestParam(value = "endTime", required = false) Date endTime,
                                      @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                      HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        Map<String, Object> params = null;
        try {
            params = thesisService.getParams(journalLevel, journalName, thesisTitle, authorName, authorStuNumber, authorMajor, authorGrade,
                                            beginTime, endTime, teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<ThesisDto> thesisDtoList = null;
        try {
            thesisDtoList = thesisService.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        JSONArray jsonArray = new JSONArray();
        if(thesisDtoList != null) {
            for(ThesisDto thesisDto : thesisDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", thesisDto.getId());
                if(thesisDto.getJournalLevel() != null) {
                    jsonObject.put("journalLevel", thesisDto.getJournalLevel());
                } else {
                    jsonObject.put("journalLevel", "");
                }
                if(thesisDto.getJournalName() != null) {
                    jsonObject.put("journalName", thesisDto.getJournalName());
                } else {
                    jsonObject.put("journalName", "");
                }
                if(thesisDto.getThesisTitle() != null) {
                    jsonObject.put("thesisTitle", thesisDto.getThesisTitle());
                } else {
                    jsonObject.put("thesisTitle", "");
                }
                if(thesisDto.getPublishTimeStr() != null) {
                    jsonObject.put("publishTime", thesisDto.getPublishTimeStr());
                } else {
                    jsonObject.put("publishTime", "");
                }
                jsonObject.put("authorNameArr", thesisDto.getAuthorNameArr());
                jsonObject.put("authorStuNumberArr", thesisDto.getAuthorStuNumberArr());
                jsonObject.put("authorMajorArr", thesisDto.getAuthorMajorArr());
                jsonObject.put("authorLevelArr", thesisDto.getAuthorLevelArr());
                if(thesisDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", thesisDto.getTeacherName());
                } else {
                    jsonObject.put("teacherName", "");
                }
                jsonArray.add(jsonObject);
            }
        }

        return sendJSONArray(jsonArray);
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId , Model model) {

        ThesisDto thesisDto = null;
        List<Material> materialList = null;
        try {
            thesisDto = thesisService.selectById(materialId);
            materialList = materialService.listByTypeAndId(materialId,1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(thesisDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("thesisDto", thesisDto);
        model.addAttribute("list", materialList);
        return "thesis/detail";

    }

    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = thesisService.falseDeleteById(id);
        return code;
    }

    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = thesisService.deleteById(id);
        return code;
    }

    @RequestMapping(value="/upload/{materialId}/{thesisTitle}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("thesisTitle") String thesisTitle) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/thesis/"+thesisTitle);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(1);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/thesis/"+thesisTitle+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/thesis/toDetail/"+materialId;
    }

    @RequestMapping("/down/{thesisTitle}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("thesisTitle") String thesisTitle) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/thesis/"+thesisTitle);
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
        return "redirect:/thesis/toDetail/"+material.getMatchId();
    }
}
