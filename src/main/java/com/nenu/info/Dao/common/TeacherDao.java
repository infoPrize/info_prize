package com.nenu.info.Dao.common;

import com.nenu.info.common.dto.common.TeacherDto;
import com.nenu.info.common.entities.common.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

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


    /**
     * 添加教师信息
     * @param teacher
     * @throws Exception
     */
    public void add(@Param("teacher") Teacher teacher) throws Exception;

    /**
     * 查询所有教师信息
     * @return
     * @throws Exception
     */
    public List<TeacherDto> listAll() throws Exception;

    /**
     * 根据id删除教师信息
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

}
