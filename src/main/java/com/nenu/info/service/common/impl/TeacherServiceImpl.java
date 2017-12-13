package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 20:01
 * @description :
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Integer countAll() throws Exception {
        return teacherDao.countAll();
    }

    /**
     * 根据姓名查询教师
     *
     * @param teacherName
     * @return
     * @throws Exception
     */
    @Override
    public Teacher selectTeacherByName(String teacherName) throws Exception {
        return teacherDao.selectTeacherByName(teacherName);
    }

    /**
     * 根据id查询教师
     *
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Teacher selectTeacherById(Integer id) throws Exception {
        Teacher teacher = teacherDao.selectTeacherById(id);
        return teacher;
    }
}
