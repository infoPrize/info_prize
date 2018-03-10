package com.nenu.info.Dao.common;

import com.nenu.info.common.entities.common.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 14:10
 * @description : 学生信息的Dao接口
 */

public interface StudentDao {

    /**
     * 增加一个学生的信息
     */
    public void add(@Param("student") Student student) throws Exception;

    /**
     * 根据学号查询学生
     */
    public Student selectStudentByStuNumber(@Param("stuNumber") String stuNumber) throws Exception;

    /**
     * 根据学生姓名查询学生列表
     */
    public List<Student> listStudentByStuName(@Param("stuName") String stuName) throws Exception;

    /**
     * 根据专业查询学生列表
     */
    public List<Student> listStudentByMajor(@Param("majorCode") Integer majorCode) throws Exception;

    /**
     * 根据学生姓名和专业代码查询学生列表
     */
    public List<Student> listStudentByStuNameAndMajor(@Param("stuName") String stuName,
                                                      @Param("majorCode") Integer majorCode) throws Exception;

    /**
     * 根据id获取学生
     */
    public Student selectStudentById(@Param("id") Integer id) throws Exception;


    /**
     * 条件查询学生列表
     */
    public List<Student> queryByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询学生数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据学号删除学生
     */
    public void deleteByStuNumber(@Param("stuNumber") String stuNumber);


}
