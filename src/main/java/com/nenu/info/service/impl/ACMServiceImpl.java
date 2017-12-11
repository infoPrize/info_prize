package com.nenu.info.service.impl;

import com.nenu.info.Dao.ACMDao;
import com.nenu.info.Dao.StudentDao;
import com.nenu.info.Dao.TeacherDao;
import com.nenu.info.common.dto.ACMPrizeDto;
import com.nenu.info.common.entities.ACMPrize;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.entities.Teacher;
import com.nenu.info.service.ACMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:26
 * @description :
 */

@Service(value = "acmService")
public class ACMServiceImpl implements ACMService {

    @Autowired
    private ACMDao acmDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public void add(ACMPrize acmPrize) {
        try {
            acmDao.add(acmPrize);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<ACMPrizeDto> selectByConditions(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                                Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit) {
        List<ACMPrizeDto> acmPrizeDtoList = null;

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
            acmPrizeDtoList = acmDao.selectByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return acmPrizeDtoList;

    }
}
