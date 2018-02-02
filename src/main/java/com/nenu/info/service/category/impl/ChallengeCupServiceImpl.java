package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ChallengeCupDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.ChallengeCup;
import com.nenu.info.common.entities.category.InternetPlus;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.service.category.ChallengeCupService;
import com.nenu.info.service.category.InternetPlusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 19:04
 * @description: 互联网+Service实现类
 */
@Service(value = "challengeCupService")
public class ChallengeCupServiceImpl implements ChallengeCupService {

    @Autowired
    private ChallengeCupDao challengeCupDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentDao studentDao;

    @Override
    public void add(ChallengeCup challengeCup) throws Exception {
        challengeCupDao.add(challengeCup);
    }



    @Override
    public List<ChallengeCupDto> listByCondition(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String teamName, String stuName, Integer majorCode, String projectName, String hostUnit, String teacherName) throws Exception {

        Integer teacherId = null;
        List<Student> studentList = null;
        List<Integer> idList = new ArrayList<>();
        List<ChallengeCupDto> challengeCupDtoList = null;

        if(!teacherName.equals("")) {
            Teacher teacher = teacherDao.selectTeacherByName(teacherName);
            teacherId = teacher.getId();
        }
        studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);

        for(Student student : studentList) {
            Integer id = student.getId();
            idList.add(id);
        }

        Map<String, Object> params = new HashMap<>();
        params.put("matchLevel", matchLevel);
        params.put("matchName", matchName);
        params.put("projectName", projectName);
        params.put("prizeLevel", prizeLevel);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("teamName", teamName);
        params.put("idList", idList);
        params.put("hostUnit", hostUnit);
        params.put("teacherId", teacherId);

        challengeCupDtoList = challengeCupDao.listByCondition(params);

        return challengeCupDtoList;

    }
}
