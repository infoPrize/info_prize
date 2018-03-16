package com.nenu.info.controller.common;

import com.nenu.info.common.dto.common.TeacherDto;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 20:03
 * @description :
 */
@Controller
@RequestMapping(value = "/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "teacher")
    public String teacher() {

        int count = 0;
        try {
            count = teacherService.countAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("count = " + count);
        return "index";
    }

    /**
     * 去往教师页面
     * @return
     */
    @RequestMapping(value = "toTeacher")
    public String toTeacher(Model model) {
        List<TeacherDto> teacherDtoList = null;
        try {
            teacherDtoList = teacherService.listAll();
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("teacherDtoList", teacherDtoList);

        return "teacher";
    }

    /**
     * 插入教师信息
     * @param teacherName 教师姓名
     * @param teacherLevel 教师等级
     * @param phone 电话
     * @return  1 - 插入成功
     *          2 - 请输入教师姓名
     *          3 - 请选择教师等级
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public Integer add(@RequestParam(value = "teacherName", required = false, defaultValue = "") String teacherName,
                       @RequestParam(value = "teacherLevel", required = false, defaultValue = "-1") Integer teacherLevel,
                       @RequestParam(value = "phone", required = false, defaultValue = "") String phone) {
        if(teacherName.equals("")) {
            return 2;
        } else if(teacherLevel == -1) {
            return 3;
        }

        Teacher teacher = new Teacher();
        teacher.setTeacherName(teacherName);
        teacher.setTeacherLevel(teacherLevel);
        teacher.setPhone(phone);

        try {
            teacherService.add(teacher);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 1;
    }

    /**
     * 根据id删除教师信息
     */
    @RequestMapping(value = "deleteById/{id}")
    public String deleteById(@PathVariable("id") Integer id) {
        try {
            teacherService.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/teacher/toTeacher";
    }

}
