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

    /**
     * 添加教师信息
     * @param teacher
     * @throws Exception
     */
    public void add(Teacher teacher) throws Exception;

    /**
     * 查询所有教师信息
     * @return
     * @throws Exception
     */
    public List<TeacherDto> listAll() throws Exception;

}
