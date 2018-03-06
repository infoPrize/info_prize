package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ChallengeCupDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ChallengeCupDto;

import com.nenu.info.common.entities.category.ChallengeCup;
import com.nenu.info.common.entities.category.InternetPlus;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.MatchLevelEnum;
import com.nenu.info.common.enums.PrizeLevelEnum;
import com.nenu.info.service.category.ChallengeCupService;
import com.nenu.info.service.category.InternetPlusService;
import com.nenu.info.service.common.StudentService;
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

    @Autowired
    private StudentService studentService;

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

    /**
     * 将dto转换为实体
     * @param challengeCupDto
     * @return
     * @throws Exception
     */
    public ChallengeCup convertDtoToEntity(ChallengeCupDto challengeCupDto) throws Exception{
        ChallengeCup challengeCup = new ChallengeCup();
        challengeCup.setProjectName(challengeCupDto.getProjectName());
        challengeCup.setTeamName(challengeCupDto.getTeamName());
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber1(),challengeCupDto.getStuName1())){
            challengeCup.setTeammateId1(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber1()).getId());
        }

        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber2(),challengeCupDto.getStuName2())){
            challengeCup.setTeammateId2(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber3(),challengeCupDto.getStuName3())){
            challengeCup.setTeammateId3(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber3()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber4(),challengeCupDto.getStuName4())){
            challengeCup.setTeammateId4(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber4()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber5(),challengeCupDto.getStuName5())){
            challengeCup.setTeammateId5(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber5()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber6(),challengeCupDto.getStuName6())){
            challengeCup.setTeammateId6(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber6()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber7(),challengeCupDto.getStuName7())){
            challengeCup.setTeammateId7(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber7()).getId());
        }
        if(studentService.nameEqualOrNot(challengeCupDto.getStuNumber8(),challengeCupDto.getStuName8())){
            challengeCup.setTeammateId8(studentDao.selectStudentByStuNumber(challengeCupDto.getStuNumber8()).getId());
        }
        challengeCup.setMatchName(challengeCupDto.getMatchName());
        challengeCup.setMatchLevel(MatchLevelEnum.getIdByValue(challengeCupDto.getMatchLevel()));
        challengeCup.setPrizeLevel(PrizeLevelEnum.getIdByValue(challengeCupDto.getPrizeLevel()));
        challengeCup.setPrizeTime(challengeCupDto.getPrizeTime());
        challengeCup.setHostUnit(challengeCupDto.getHostUnit());
        if(teacherDao.selectTeacherByName(challengeCupDto.getTeacherName()) != null)
        {
            challengeCup.setTeacherId(teacherDao.selectTeacherByName(challengeCupDto.getTeacherName()).getId());
        }
        return challengeCup;
    }
}
