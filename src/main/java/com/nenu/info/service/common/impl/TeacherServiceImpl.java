package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.common.TeacherDto;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.service.common.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public void add(Teacher teacher) throws Exception {
        teacherDao.add(teacher);
    }

    @Override
    public List<TeacherDto> listAll() throws Exception {
        return teacherDao.listAll();
    }

    @Override
    public boolean checkTeacherExist(String teacherName) throws Exception {

        if(teacherName.equals("")) {
            return true;
        }

        Teacher teacher = selectTeacherByName(teacherName);
        if(teacher == null) {
            return false;           //不存在
        } else {
            return true;            //可以查出来，该教师存在
        }
    }

    @Override
    public void deleteById(Integer id) throws Exception {
        teacherDao.deleteById(id);
    }
}
