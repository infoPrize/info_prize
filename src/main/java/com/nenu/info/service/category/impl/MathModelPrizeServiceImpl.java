package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.MathModelPrizeDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.MathModelPrize;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.service.category.MathModelPrizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author: software-liuwang
 * @time: 2017/12/11 15:05
 * @description : 数学建模信息添加service的实现
 */
@Service(value = "mathModelPrizeService")
public class MathModelPrizeServiceImpl implements MathModelPrizeService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private MathModelPrizeDao mathModelPrizeDao;

    @Override
    public void add(MathModelPrize mathModelPrize) {
        try {
            mathModelPrizeDao.add(mathModelPrize);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<MathModelPrizeDto> listByConditions(Integer matchLevel, String matchName, Date beginTime, Date endTime, Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit) {
        List<MathModelPrizeDto> acmPrizeDtoList = null;

        List<Student> studentList = null;

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, major);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Teacher teacher = new Teacher();
        try {
            teacher = teacherDao.selectTeacherByName(teacherName);
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer teacherId = null;
        if(teacher != null) {
            teacherId = teacher.getId();
        }

        List<Integer> idList = new ArrayList<>();
        if(studentList != null) {
            for (Student student : studentList) {
                Integer id = student.getId();
                idList.add(id);
            }
        }

        Map<String, Object> params = new HashMap<>();
        params.put("matchLevel", matchLevel);
        params.put("matchName", matchName);
        params.put("beginTime", beginTime);
        params.put("endTime", endTime);
        params.put("prizeLevel", prizeLevel);
        params.put("teacherId", teacherId);
        params.put("hostUnit", hostUnit);
        params.put("idList", idList);

        try {
            acmPrizeDtoList = mathModelPrizeDao.listByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return acmPrizeDtoList;

    }
}
