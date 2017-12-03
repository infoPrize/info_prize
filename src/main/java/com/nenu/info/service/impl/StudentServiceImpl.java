package com.nenu.info.service.impl;

import com.nenu.info.Dao.StudentDao;
import com.nenu.info.common.entities.Student;
import com.nenu.info.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:28
 * @description :
 */
@Service(value = "studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public void add(Student student) throws Exception {
        studentDao.add(student);
    }

    @Override
    public Student selectStudentByStuNumber(String stuNumber) throws Exception {
        Student student = studentDao.selectStudentByStuNumber(stuNumber);

        return student;

    }
}
