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
     * 导入一个excel列表的学生信息
     * @param students
     * @throws Exception
     */
    public void addList(List<Student> students) throws Exception;

    /**
     * 删除一个学生的信息
     * @param student
     * @throws Exception
     */
    public void delete(Student student) throws Exception;

    /**
     * 学生信息的改动
     * @param student
     * @throws Exception
     */
    public void update(Student student) throws Exception;

    /**
     * 根据id查询学生
     * @param id 学生id
     * @return 查询到的学生信息
     * @throws Exception
     */
    public Student selectStudentById(Integer id) throws Exception;

    /**
     * 根据学号查询学生
     * @param stuNumber 学生的学号
     * @return 查询到的学生信息
     * @throws Exception
     */
    public Student selectStudentByStuNumber(@Param("stuNumber") String stuNumber) throws Exception;

    /**
     * 根据学生姓名查询学生
     * @param name 学生姓名
     * @return 查询到的学生信息
     * @throws Exception
     */
    public Student selectStudntByName(String name) throws Exception;

    /**
     * 根据年级查询学生列表
     * @param grade 年级
     * @return 学生列表
     * @throws Exception
     */
    public List<Student> listByGrade(String grade) throws Exception;

    /**
     * 根据专业查询学生列表
     * @param major
     * @return
     * @throws Exception
     */
    public List<Student> listByMajor(String major) throws Exception;

    /**
     * 根据年级和专业查询学生列表
     * @param major
     * @param grade
     * @return
     * @throws Exception
     */
    public List<Student> listByMajorAndGrade(String major, String grade) throws Exception;

}
