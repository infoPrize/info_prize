package com.nenu.info.controller.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.service.common.StudentService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:41
 * @description :
 */

@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    StudentService studentService;

    /**
     * 去往学生添加页面
     */
    @RequestMapping(value = "toAdd")
    public String toAdd() {
        return "student/add";
    }

    /**
     * 去往学生列表页
     */
    @RequestMapping(value = "toList")
    public String  toList() {
        return "student/list";
    }

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(@RequestParam("name") String name,
                      @RequestParam("sex") Integer sex,
                      @RequestParam("stuNumber") String stuNumber,
                      @RequestParam("grade") String grade,
                      @RequestParam("majorCode") Integer majorCode,
                      @RequestParam("phone") String phone,
                      Model model) throws Exception {


        Student student = new Student();
        student.setName(name);
        student.setSex(sex);
        student.setStuNumber(stuNumber);
        student.setGrade(grade);
        student.setMajorCode(majorCode);
        student.setPhone(phone);

        try {
            if(studentService.selectStudentByStuNumber(stuNumber) == null){
                studentService.add(student);
                model.addAttribute("message","添加成功");
            } else {
                model.addAttribute("message", "已存在相同学号的学生");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "student/add";
    }

    //条件查询
    @RequestMapping(value = "query/by/condition",method = RequestMethod.GET)
    @ResponseBody
    public JSONObject queryByCondition(@RequestParam(value = "name", required = false, defaultValue = "") String name,
                                       @RequestParam(value = "sex", required = false, defaultValue = "-1") Integer sex,
                                       @RequestParam(value = "stuNumber", required = false, defaultValue = "") String stuNumber,
                                       @RequestParam(value = "grade", required = false, defaultValue = "") String grade,
                                       @RequestParam(value = "majorCode", required = false, defaultValue = "-1") Integer majorCode,
                                       @RequestParam(value = "phone", required = false, defaultValue = "") String phone) throws Exception{
        JSONObject jsonObject = new JSONObject();

        Map<String, Object> params = null;
        params = studentService.getParams(name, sex, stuNumber, grade, majorCode, phone);

        List<StudentDto> studentDtoList = studentService.queryByCondition(params);
        jsonObject.put("studentDtoList", studentDtoList);

        return jsonObject;

    }

    //根据学号删除
    @RequestMapping(value = "delete/by/stuNumber/{stuNumber}", method = RequestMethod.GET)
    public String deleteByStuNumber(@PathVariable("stuNumber")String stuNumber) throws Exception {

        studentService.deleteByStuNumber(stuNumber);
        return "redirect:/student/toList";

    }





}
