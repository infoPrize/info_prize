package com.nenu.info.Dao;

import com.nenu.info.common.entities.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 14:10
 * @description : 学生信息的Dao接口
 */

public interface StudentDao {

    /**
     * 增加一个学生的信息
     * @param student
     * @throws Exception
     */
    public void add(@Param("student") Student student) throws Exception;

    /**
     * 根据学号查询学生
     * @param stuNumber 学生的学号
     * @return 查询到的学生信息
     * @throws Exception
     */
    public Student selectStudentByStuNumber(@Param("stuNumber") String stuNumber) throws Exception;

    /**
     * 根据学生姓名查询学生列表
     * @param stuName 学生姓名
     * @return 查询到的学生信息
     * @throws Exception
     */
    public List<Student> listStudentByStuName(@Param("stuName") String stuName) throws Exception;

    /**
     * 根据专业查询学生列表
     * @param majorCode
     * @return
     * @throws Exception
     */
    public List<Student> listStudentByMajor(@Param("majorCode") Integer majorCode) throws Exception;

    /**
     * 根据学生姓名和专业代码查询学生列表
     * @param stuName
     * @param majorCode
     * @return
     * @throws Exception
     */
    public List<Student> listStudentByStuNameAndMajor(@Param("stuName") String stuName,
                                                      @Param("majorCode") Integer majorCode) throws Exception;

    /**
     * 根据id获取学生
     * @param id
     * @return
     * @throws Exception
     */
    public Student selectStudentById(@Param("id") Integer id) throws Exception;

}
