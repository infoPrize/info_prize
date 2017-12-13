package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.common.entities.Student;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /**
     * 根据专业查找学生列表
     *
     * @param majorCode
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> listStudentByMajor(Integer majorCode) throws Exception {
        List<Student> studentList = studentDao.listStudentByMajor(majorCode);
        return studentList;
    }

    /**
     * 根据id获取学生
     *
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Student selectStudentById(Integer id) throws Exception {
        Student student = studentDao.selectStudentById(id);
        return student;
    }
}
