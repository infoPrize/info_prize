package com.nenu.info.service.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:27
 * @description :
 */
public interface StudentService {

    /**
     * 新增学生
     */
    public void add(Student student) throws Exception;

    /**
     * 根据学号查询学生信息
     */
    public Student selectStudentByStuNumber(String stuNumber) throws Exception;

    /**
     * 根据专业查找学生列表
     */
    public List<Student> listStudentByMajor(Integer majorCode) throws Exception;

    /**
     * 根据id获取学生
     */
    public Student selectStudentById(Integer id) throws Exception;

    /**
     * 将传递的参数加工为Map
     */
    public Map<String, Object> getParams(String name,  Integer sex, String stuNumber,
                                         String grade, Integer majorCode,  String phone);

    /**
     * 条件查询学生列表
     */
    public List<StudentDto> queryByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询学生数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据学号删除学生
     */
    public void deleteByStuNumber(String stuNumber) throws Exception;

    /**
     * 将实体转换为dto
     */
    public Student convertDtoToEntity(StudentDto studentDto) throws Exception;

    /**
     * 检查学生的姓名和学号是否匹配
     */
    public boolean checkMatchingWithNameAndStuNumber(String name, String stuNumber) throws Exception;

    /**
     * 根据学号查询学生姓名和获取到的姓名是否相同
     */
    public Boolean nameEqualOrNot(String stuNumber,String name) throws Exception;

}
