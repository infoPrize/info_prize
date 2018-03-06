package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.InternetPlusDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.InternetPlus;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.MatchLevelEnum;
import com.nenu.info.common.enums.PrizeLevelEnum;
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
@Service(value = "internetPlusService")
public class InternetPlusServiceImpl implements InternetPlusService {

    @Autowired
    private InternetPlusDao internetPlusDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentDao studentDao;
    
    @Autowired
    private StudentService studentService;

    @Override
    public void add(InternetPlus internetPlus) throws Exception {
        internetPlusDao.add(internetPlus);
    }

    @Override
    public List<InternetPlusDto> listByCondition(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String teamName, String stuName, Integer majorCode, String projectName, String hostUnit, String teacherName) throws Exception {

        Integer teacherId = null;
        List<Student> studentList = null;
        List<Integer> idList = new ArrayList<>();
        List<InternetPlusDto> internetPlusDtoList = null;

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

        internetPlusDtoList = internetPlusDao.listByCondition(params);

        return internetPlusDtoList;

    }

    /**
     * 将dto转换为实体
     * @param internetPlusDto
     * @return
     * @throws Exception
     */
    public InternetPlus convertDtoToEntity(InternetPlusDto internetPlusDto) throws Exception{

        InternetPlus internetPlus = new InternetPlus();
        internetPlus.setProjectName(internetPlusDto.getProjectName());
        internetPlus.setTeamName(internetPlusDto.getTeamName());
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber1(),internetPlusDto.getStuName1())){
            internetPlus.setTeammateId1(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber1()).getId());
        }

        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber2(),internetPlusDto.getStuName2())){
            internetPlus.setTeammateId2(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber3(),internetPlusDto.getStuName3())){
            internetPlus.setTeammateId3(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber3()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber4(),internetPlusDto.getStuName4())){
            internetPlus.setTeammateId4(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber4()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber5(),internetPlusDto.getStuName5())){
            internetPlus.setTeammateId5(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber5()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber6(),internetPlusDto.getStuName6())){
            internetPlus.setTeammateId6(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber6()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber7(),internetPlusDto.getStuName7())){
            internetPlus.setTeammateId7(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber7()).getId());
        }
        if(studentService.nameEqualOrNot(internetPlusDto.getStuNumber8(),internetPlusDto.getStuName8())){
            internetPlus.setTeammateId8(studentDao.selectStudentByStuNumber(internetPlusDto.getStuNumber8()).getId());
        }
        internetPlus.setMatchName(internetPlusDto.getMatchName());
        internetPlus.setMatchLevel(MatchLevelEnum.getIdByValue(internetPlusDto.getMatchLevel()));
        internetPlus.setPrizeLevel(PrizeLevelEnum.getIdByValue(internetPlusDto.getPrizeLevel()));
        internetPlus.setPrizeTime(internetPlusDto.getPrizeTime());
        internetPlus.setHostUnit(internetPlusDto.getHostUnit());
        if(teacherDao.selectTeacherByName(internetPlusDto.getTeacherName()) != null)
        {
            internetPlus.setTeacherId(teacherDao.selectTeacherByName(internetPlusDto.getTeacherName()).getId());
        }
        return internetPlus;
    }
}
