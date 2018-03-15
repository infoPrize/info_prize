package com.nenu.info.service.common;

import com.nenu.info.common.dto.common.TeacherDto;
import com.nenu.info.common.entities.common.Teacher;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 20:01
 * @description : 教师Service接口
 */
public interface TeacherService {

    /**
     * 查询所有教师数量
     */
    public Integer countAll() throws Exception;

    /**
     * 根据姓名查询教师
     */
    public Teacher selectTeacherByName(String teacherName) throws Exception;

    /**
     * 根据id查询教师
     */
    public Teacher selectTeacherById(Integer id) throws Exception;

    /**
     * 添加教师信息
     */
    public void add(Teacher teacher) throws Exception;

    /**
     * 查询所有教师信息
     */
    public List<TeacherDto> listAll() throws Exception;

    /**
     * 根据教师的姓名判断该教师是否存在
     */
    public boolean checkTeacherExist(String teacherName) throws Exception;

    /**
     * 根据id删除教师信息
     */
    public void deleteById(Integer id) throws Exception;

}
