package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.utils.*;
import com.nenu.info.common.entities.category.ScientificProject;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.controller.common.AbstractController;
import com.nenu.info.service.category.ScientificProjectService;
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
import java.io.BufferedOutputStream;
import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/30 16:43
 * @description : 科研国创项目Controller
 */
@Controller
@RequestMapping(value = URLConstants.SCIENTIFIC_PROJECT_URL)
public class ScientificProjectController extends AbstractController{

    /**
     * 去往国创科研添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "scientific_project/scientific_project_add";
    }

    /**
     * 去往国创科研列表页
     */
    @RequestMapping(value = "toList")
    public String toList() {
        return "scientific_project/scientific_project";
    }

    /**
     * 单条插入国创/科研项目信息
     *
     * @param projectName             项目名
     * @param projectType             项目类型(0-未知，1-一般培育项目，2-专项计划项目，3-重点培育项目，4-国创)
     * @param setYear                 立项时间
     * @param projectManName          项目负责人姓名
     * @param projectManStuNumber     项目负责人学号
     * @param teacherName             指导教师姓名
     * @param projectMemberName1      项目成员1姓名
     * @param projectMemberStuNumber1 项目成员1学号
     * @param projectMemberName2      项目成员2姓名
     * @param projectMemberStuNumber2 项目成员2学号
     * @param projectMemberName3      项目成员3姓名
     * @param projectMemberStuNumber3 项目成员3学号
     * @param projectMemberName4      项目成员4姓名
     * @param projectMemberStuNumber4 项目成员4学号
     * @param fundsLimit              经费额度
     * @param projectIntroduce        项目简介
     * @return 状态码(-1 - 学号输入错误
     *0  - 项目负责人学号姓名不匹配
     *1  - 成员1学号姓名不匹配
     *2  - 成员2学号姓名不匹配
     *3  - 成员3学号姓名不匹配
     *4  - 成员4学号姓名不匹配
     *5  - 指导教师姓名错误
     *6  - 添加成功)
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer addScientificProject(@RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                        @RequestParam(value = "projectType", required = false, defaultValue = "0") Integer projectType,
                                        @RequestParam(value = "setYear", required = false, defaultValue = "2017") String setYear,
                                        @RequestParam(value = "projectManName", required = false, defaultValue = "") String projectManName,
                                        @RequestParam(value = "projectManStuNumber", required = false, defaultValue = "") String projectManStuNumber,
                                        @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                        @RequestParam(value = "projectMemberName1", required = false, defaultValue = "") String projectMemberName1,
                                        @RequestParam(value = "projectMemberStuNumber1", required = false, defaultValue = "") String projectMemberStuNumber1,
                                        @RequestParam(value = "projectMemberName2", required = false, defaultValue = "") String projectMemberName2,
                                        @RequestParam(value = "projectMemberStuNumber2", required = false, defaultValue = "") String projectMemberStuNumber2,
                                        @RequestParam(value = "projectMemberName3", required = false, defaultValue = "") String projectMemberName3,
                                        @RequestParam(value = "projectMemberStuNumber3", required = false, defaultValue = "") String projectMemberStuNumber3,
                                        @RequestParam(value = "projectMemberName4", required = false, defaultValue = "") String projectMemberName4,
                                        @RequestParam(value = "projectMemberStuNumber4", required = false, defaultValue = "") String projectMemberStuNumber4,
                                        @RequestParam(value = "fundsLimit", required = false, defaultValue = "0") Integer fundsLimit,
                                        @RequestParam(value = "projectIntroduce", required = false, defaultValue = "") String projectIntroduce) {
        //如果第一名同学都没有输入，则返回1
        if(projectManName.equals("") && projectManStuNumber.equals("")) {
            return 1;
        }

        //先处理五个同学的输入是否合法
        try {
            if(!studentService.checkMatchingWithNameAndStuNumber(projectManName, projectManStuNumber)) {
                return 0;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(projectMemberName1, projectMemberStuNumber1)) {
                return 1;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(projectMemberName2, projectMemberStuNumber2)) {
                return 2;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(projectMemberName3, projectMemberStuNumber3)) {
                return 3;
            }
            if(!studentService.checkMatchingWithNameAndStuNumber(projectMemberName4, projectMemberStuNumber4)) {
                return 4;
            }

            //处理老师是否存在
            if(!teacherService.checkTeacherExist(teacherName)) {
                return 5;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        StudentDto projectMan = null;
        StudentDto projectMember1 = null;
        StudentDto projectMember2 = null;
        StudentDto projectMember3 = null;
        StudentDto projectMember4 = null;
        Teacher teacher = null;

        try {
            projectMan = studentService.selectStudentByStuNumber(projectManStuNumber);
            projectMember1 = studentService.selectStudentByStuNumber(projectMemberStuNumber1);
            projectMember2 = studentService.selectStudentByStuNumber(projectMemberStuNumber2);
            projectMember3 = studentService.selectStudentByStuNumber(projectMemberStuNumber3);
            projectMember4 = studentService.selectStudentByStuNumber(projectMemberStuNumber4);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ScientificProject scientificProject = new ScientificProject();

        scientificProject.setProjectName(projectName);
        if (projectType >= 0) {
            scientificProject.setProjectType(projectType);
        } else {
            scientificProject.setProjectType(0);
        }
        if(setYear != null && !setYear.equals("")) {
            setYear = setYear.substring(0, 4);
        }
        scientificProject.setSetYear(setYear);
        if(projectMan != null) {
            scientificProject.setProjectManId(projectMan.getId());
        }
        if(projectMember1 != null) {
            scientificProject.setProjectMemberId1(projectMember1.getId());
        }
        if(projectMember2 != null) {
            scientificProject.setProjectMemberId2(projectMember2.getId());
        }
        if(projectMember3 != null) {
            scientificProject.setProjectMemberId3(projectMember3.getId());
        }
        if(projectMember4 != null) {
            scientificProject.setProjectMemberId4(projectMember4.getId());
        }

        if(teacher != null) {
            scientificProject.setTeacherId(teacher.getId());
        }
        if (fundsLimit >= 0) {
            scientificProject.setFundsLimit(fundsLimit);
        } else {
            scientificProject.setFundsLimit(0);
        }
        scientificProject.setProjectIntroduce(projectIntroduce);

        scientificProjectService.addScientificProject(scientificProject);
        return 6;
    }

    /**
     * 根据条件查询国创科研信息
     *
     * @param projectName 项目名
     * @param projectType 项目类型
     * @param setYear     立项年份
     * @param majorCode   专业代码
     * @param teacherName 教师姓名
     * @param stuName     学生姓名
     * @param stuNumber   学生学号
     * @return
     */
    @RequestMapping(value = "listByCondition")
    @ResponseBody
    public JSONObject listScientificProjectByCondition(@RequestParam(value = "projectName", required = false, defaultValue = "") String projectName,
                                                       @RequestParam(value = "projectType", required = false, defaultValue = "-1") Integer projectType,
                                                       @RequestParam(value = "setYear", required = false, defaultValue = "") String setYear,
                                                       @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                                       @RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                                                       @RequestParam(value = "stuName", required = false, defaultValue = "") String stuName,
                                                       @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                                       HttpServletResponse response) {
//        response.setHeader("Access-Control-Allow-Origin", "*");
        JSONArray jsonArray = new JSONArray();

        Map<String, Object> params = scientificProjectService.getParams(projectName, projectType, setYear, majorCode, teacherName, stuName, stuNumber);

        List<ScientificProjectDto> scientificProjectDtoList = null;
        scientificProjectDtoList = scientificProjectService.listScientificProjectByConditions(params);

        if(scientificProjectDtoList != null) {
            for(ScientificProjectDto scientificProjectDto : scientificProjectDtoList) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("id", scientificProjectDto.getId());
                if(scientificProjectDto.getProjectType() != null) {
                    jsonObject.put("projectType", scientificProjectDto.getProjectType());
                } else {
                    jsonObject.put("projectType", "");
                }
                if(scientificProjectDto.getProjectName() != null) {
                    jsonObject.put("projectName", scientificProjectDto.getProjectName());
                } else {
                    jsonObject.put("projectName", "");
                }
                if(scientificProjectDto.getSetYear() != null) {
                    jsonObject.put("setYear", scientificProjectDto.getSetYear());
                } else {
                    jsonObject.put("setYear", "");
                }
                if(scientificProjectDto.getProjectManPhone() != null) {
                    jsonObject.put("projectManPhone", scientificProjectDto.getProjectManPhone());
                } else {
                    jsonObject.put("projectManPhone", "");
                }
                jsonObject.put("stuNameArr", scientificProjectDto.getStuNameArr());
                jsonObject.put("stuNumberArr", scientificProjectDto.getStuNumberArr());
                jsonObject.put("stuMajorArr", scientificProjectDto.getStuMajorArr());
                if(scientificProjectDto.getTeacherName() != null) {
                    jsonObject.put("teacherName", scientificProjectDto.getTeacherName());
                } else {
                    jsonObject.put("teacherName", "");
                }
                if(scientificProjectDto.getFundsLimit() != null) {
                    jsonObject.put("fundsLimit", scientificProjectDto.getFundsLimit());
                } else {
                    jsonObject.put("fundsLimit", "");
                }

                jsonArray.add(jsonObject);
            }
        }

        return sendJSONArray(jsonArray);
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId, Model model) throws Exception {
        
        ScientificProjectDto scientificProjectDto = null;
        List<Material> materialList = null;
        scientificProjectDto = scientificProjectService.selectById(materialId);
        materialList = materialService.listByTypeAndId(materialId,3);

        if(scientificProjectDto == null) {
            model.addAttribute("message", NO_SUCH_PAGE_ERROR);
            return "common/error";
        }

        model.addAttribute("scientificProjectDto", scientificProjectDto);
        model.addAttribute("list", materialList);

        return "scientific_project/detail";
    }

    @RequestMapping(value = "falseDeleteById/{id}")
    @ResponseBody
    public Integer falseDeleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = scientificProjectService.falseDeleteById(id);
        return code;
    }

    @RequestMapping(value = "deleteById/{id}")
    @ResponseBody
    public Integer deleteById(@PathVariable("id") Integer id) {
        Integer code = null;
        code = scientificProjectService.deleteById(id);
        return code;
    }
    
    @RequestMapping(value="/upload/{materialId}/{projectName}",method = RequestMethod.POST)
    public String upload(@PathVariable("materialId") Integer materialId, MultipartFile file,
                         HttpServletRequest request , @PathVariable("projectName") String projectName) throws Exception {

        String path = request.getSession().getServletContext().getRealPath("resources/upload/scientificProject/"+projectName);
        String fileName = file.getOriginalFilename();
        Material material = new Material();
        material.setMatchType(3);
        material.setMatchId(materialId);
        material.setMaterialName(fileName);
        material.setMaterialUrl("resources/upload/scientificProject/"+projectName+"/"+fileName);
        materialService.add(material);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
        return "redirect:/scientificProject/toDetail/"+materialId;
    }

    @RequestMapping("/down/{projectName}")
    public void down(HttpServletRequest request,HttpServletResponse response,
                     @PathVariable("projectName") String projectName) throws Exception{

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        String path = request.getSession().getServletContext().getRealPath("resources/upload/scientificProject/"+projectName);
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
        return "redirect:/scientificProject/toDetail/"+material.getMatchId();
    }

}

