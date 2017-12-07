package com.nenu.info.service;

import com.nenu.info.common.entities.Teacher;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 20:01
 * @description : 教师Service接口
 */
public interface TeacherService {

    /**
     * 查询所有教师数量
     * @return
     * @throws Exception
     */
    public Integer countAll() throws Exception;

    /**
     * 根据姓名查询教师
     * @param teacherName
     * @return
     * @throws Exception
     */
    public Teacher selectTeacherByName(String teacherName) throws Exception;

    /**
     * 根据id查询教师
     * @param id
     * @return
     * @throws Exception
     */
    public Teacher selectTeacherById(Integer id) throws Exception;

}
