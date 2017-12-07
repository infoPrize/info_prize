package com.nenu.info.service;

import com.nenu.info.common.entities.Student;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:27
 * @description :
 */
public interface StudentService {

    /**
     * 新增学生
     * @param student 要新增的学生信息
     * @throws Exception
     */
    public void add(Student student) throws Exception;

    /**
     * 根据学号查询学生信息
     * @param stuNumber 学号
     * @return
     */
    public Student selectStudentByStuNumber(String stuNumber) throws Exception;

    /**
     * 根据专业查找学生列表
     * @param majorCode
     * @return
     * @throws Exception
     */
    public List<Student> listStudentByMajor(Integer majorCode) throws Exception;

    /**
     * 根据id获取学生
     * @param id
     * @return
     * @throws Exception
     */
    public Student selectStudentById(Integer id) throws Exception;

}
