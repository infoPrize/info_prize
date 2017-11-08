package com.nenu.info.Dao;

import com.nenu.info.common.entities.Student;
import com.nenu.info.service.StudentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * StudentDao测试类
 * @author: software-liuwang
 * @time: 2017/11/7 15:19
 * @description :
 */
public class TestStudentDao {

    @Autowired
    private StudentService studentService;

    @Test
    public void insert() {

        System.out.println("studentInfoDao = " + studentService);

        Student student = new Student();

        student.setName("刘旺");
        student.setSex(0);
        student.setStuNumber("2015011969");
        student.setGrade(("2015"));
        student.setMajorCode(1);
        student.setPhone("15919864567");

        try {
            studentService.add(student);
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

}
