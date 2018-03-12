package com.nenu.info.controller.category;

import com.nenu.info.common.dto.category.ScientificProjectDto;
import com.nenu.info.common.entities.common.Material;
import com.nenu.info.common.utils.*;
import com.nenu.info.common.entities.category.ScientificProject;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.service.category.ScientificProjectService;
import com.nenu.info.service.common.MaterialService;
import com.nenu.info.service.common.StudentService;
import com.nenu.info.service.common.TeacherService;
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
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/30 16:43
 * @description : 科研国创项目Controller
 */
@Controller
@RequestMapping(value = URLConstants.SCIENTIFIC_PROJECT_URL)
public class ScientificProjectController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ScientificProjectService scientificProjectService;

    @Autowired
    private MaterialService materialService;

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


        Student projectMan = null;
        Student projectMember1 = null;
        Student projectMember2 = null;
        Student projectMember3 = null;
        Student projectMember4 = null;
        Teacher teacher = null;

        //首先检查五个项目组成员是否有错
        try {
            projectMan = studentService.selectStudentByStuNumber(projectManStuNumber);
            projectMember1 = studentService.selectStudentByStuNumber(projectMemberStuNumber1);
            projectMember2 = studentService.selectStudentByStuNumber(projectMemberStuNumber2);
            projectMember3 = studentService.selectStudentByStuNumber(projectMemberStuNumber3);
            projectMember4 = studentService.selectStudentByStuNumber(projectMemberStuNumber4);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        //检查五个人中是否有人姓名学号不匹配
        if (projectMan == null || !projectManName.equals(projectMan.getName())) {
            return 0;
        } else if (projectMember1 == null || !projectMemberName1.equals(projectMember1.getName())) {
            return 1;
        } else if (projectMember2 == null || !projectMemberName2.equals(projectMember2.getName())) {
            return 2;
        } else if (projectMember3 == null || !projectMemberName3.equals(projectMember3.getName())) {
            return 3;
        } else if (projectMember4 == null || !projectMemberName4.equals(projectMember4.getName())) {
            return 4;
        }

        //检查教师是否存在
        try {
            teacher = teacherService.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (teacher == null) {
            return 5;
        }

        ScientificProject scientificProject = new ScientificProject();

        scientificProject.setProjectName(projectName);
        if (projectType >= 0) {
            scientificProject.setProjectType(projectType);
        } else {
            scientificProject.setProjectType(0);
        }
        scientificProject.setSetYear(setYear);
        scientificProject.setProjectManId(projectMan.getId());
        scientificProject.setProjectMemberId1(projectMember1.getId());
        scientificProject.setProjectMemberId2(projectMember2.getId());
        scientificProject.setProjectMemberId3(projectMember3.getId());
        scientificProject.setProjectMemberId4(projectMember4.getId());

        scientificProject.setTeacherId(teacher.getId());
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
                                                       @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber) {
        JSONObject jsonObject = new JSONObject();

        Map<String, Object> params = scientificProjectService.getParams(projectName, projectType, setYear, majorCode, teacherName, stuName, stuNumber);

        List<ScientificProjectDto> scientificProjectDtoList = null;
        scientificProjectDtoList = scientificProjectService.listScientificProjectByConditions(params);

        jsonObject.put("scientificProjectDtoList", scientificProjectDtoList);

        return jsonObject;
    }

    @RequestMapping(value = "toDetail/{materialId}")
    public String toDetail(@PathVariable("materialId") Integer materialId, Model model) throws Exception {
        
        ScientificProjectDto scientificProjectDto = null;
        List<Material> materialList = null;
        scientificProjectDto = scientificProjectService.selectById(materialId);
        materialList = materialService.listByTypeAndId(materialId,3);

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

    @RequestMapping(value = "delete/material/{id}/{materialId}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer id,@PathVariable("materialId") Integer materialId, Model model) throws Exception{
        Integer code = materialService.falseDeleteById(id);
        if(code == 1){
            model.addAttribute("message", MessageInfo.DELETE_SUCCESS);
        }else {
            model.addAttribute("message", MessageInfo.DELETE_FAIL);
        }
        return "redirect:/scientificProject/toDetail/"+materialId;
    }

}

