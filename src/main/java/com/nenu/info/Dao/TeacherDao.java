package com.nenu.info.Dao;

import com.nenu.info.common.entities.Teacher;
import org.apache.ibatis.annotations.Param;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 19:55
 * @description :
 */
public interface TeacherDao {

    /**
     * 查询指导教师数量
     * @return
     * @throws Exception
     */
    public Integer countAll() throws Exception;

    /**
     * 根据教师姓名查找教师
     * @param teacherName 教师姓名
     * @return
     * @throws Exception
     */
    public Teacher selectTeacherByName(@Param("teacherName") String teacherName) throws Exception;

    /**
     * 根据id查找教师
     * @param id
     * @return
     * @throws Exception
     */
    public Teacher selectTeacherById(@Param("id") Integer id) throws Exception;

}
