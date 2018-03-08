package com.nenu.info.service.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;

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

    /**
     * 条件查询学生列表
     * @param name
     * @param sex
     * @param stuNumber
     * @param grade
     * @param majorCode
     * @param phone
     * @return
     * @throws Exception
     */
    public List<StudentDto> queryByCondition( String name,  Integer sex, String stuNumber,
                                              String grade, Integer majorCode,  String phone) throws Exception;

    /**
     * 根据学号删除学生
     * @param stuNumber
     */
    public void deleteByStuNumber(String stuNumber) throws Exception;

    /**
     * 将实体转换为dto
     * @param studentDto
     * @return
     * @throws Exception
     */
    public Student convertDtoToEntity(StudentDto studentDto) throws Exception;

    /**
     * 检查学生的姓名和学号是否匹配
     * @param name 姓名
     * @param stuNumber 学号
     * @return
     * @throws Exception
     */
    public boolean checkMatchingWithNameAndStuNumber(String name, String stuNumber) throws Exception;

    /**
     * 根据学号查询学生姓名和获取到的姓名是否相同
     * @param stuNumber 学号
     * @return
     */
    public Boolean nameEqualOrNot(String stuNumber,String name) throws Exception;

}
