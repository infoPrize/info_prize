package com.nenu.info.controller.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    @RequestMapping(value = "add",method = RequestMethod.POST)
    public String add(@RequestParam("name") String name,
                             @RequestParam("sex") Integer sex,
                             @RequestParam("stuNumber") String stuNumber,
                             @RequestParam("grade") String grade,
                             @RequestParam("majorCode") Integer majorCode,
                             @RequestParam("phone") String phone) {

        Student student = new Student();
        student.setName(name);
        student.setSex(sex);
        student.setStuNumber(stuNumber);
        student.setGrade(grade);
        student.setMajorCode(majorCode);
        student.setPhone(phone);

        try {
            studentService.add(student);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/student/list";
    }

    //查询所有学生
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(Model model) throws Exception {

        List<StudentDto> studentDtoList = studentService.queryByCondition(null,0,null,null,0,null);
        model.addAttribute("studentDtoList",studentDtoList);
        return "student/list";

    }



    //条件查询
    @RequestMapping(value = "query/by/condition",method = RequestMethod.POST)
    public String queryByCondition(@RequestParam("name") String name,
                                   @RequestParam("sex") Integer sex,
                                   @RequestParam("stuNumber") String stuNumber,
                                   @RequestParam("grade") String grade,
                                   @RequestParam("majorCode") Integer majorCode,
                                   @RequestParam("phone") String phone,Model model) throws Exception{

        List<StudentDto> studentDtoList = studentService.queryByCondition(name,sex,stuNumber,grade,majorCode,phone);
        model.addAttribute("studentDtoList",studentDtoList);
        return "student/list";

    }

    //根据学号删除
    @RequestMapping(value = "delete/by/stuNumber/{stuNumber}",method = RequestMethod.GET)
    public String deleteByStuNumber(@PathVariable("stuNumber")String stuNumber) throws Exception {

        studentService.deleteByStuNumber(stuNumber);
        return "redirect:/student/list";

    }





}
