package com.nenu.info.controller;

import com.nenu.info.common.entities.Student;
import com.nenu.info.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

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

    @RequestMapping(value = "addStudent")
    public String addStudent(@RequestParam("name") String name,
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
        return "index";
    }



}
