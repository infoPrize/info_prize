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
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.ChallengeCupService;
import com.nenu.info.service.category.InternetPlusService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
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
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String teamName, String stuName, Integer majorCode, String projectName, String hostUnit, String teacherName) throws Exception {
        Integer teacherId = null;
        List<Student> studentList = null;
        List<Integer> idList = new ArrayList<>();

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

        return params;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) throws Exception {
        Integer count = null;
        count = challengeCupDao.countByCondition(params);
        return count;
    }

    @Override
    public List<ChallengeCupDto> listByCondition(Map<String, Object> params) throws Exception {

        List<ChallengeCupDto> challengeCupDtoList = null;

        challengeCupDtoList = challengeCupDao.listByCondition(params);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(challengeCupDtoList != null) {
            for (ChallengeCupDto challengeCupDto : challengeCupDtoList) {
                //对日期进行处理
                Date prizeTime = challengeCupDto.getPrizeTime();
                String prizeTimeStr = "";
                if(prizeTime != null) {
                    prizeTimeStr = sdf.format(prizeTime);
                }
                challengeCupDto.setPrizeTimeStr(prizeTimeStr);

                //应前端要求，将姓名、学号、专业转换为数组
                String[] stuNameArr = new String[8];
                String stuName1 = challengeCupDto.getStuName1() != null ? challengeCupDto.getStuName1() : "";
                String stuName2 = challengeCupDto.getStuName2() != null ? challengeCupDto.getStuName2() : "";
                String stuName3 = challengeCupDto.getStuName3() != null ? challengeCupDto.getStuName3() : "";
                String stuName4 = challengeCupDto.getStuName4() != null ? challengeCupDto.getStuName4() : "";
                String stuName5 = challengeCupDto.getStuName5() != null ? challengeCupDto.getStuName5() : "";
                String stuName6 = challengeCupDto.getStuName6() != null ? challengeCupDto.getStuName6() : "";
                String stuName7 = challengeCupDto.getStuName7() != null ? challengeCupDto.getStuName7() : "";
                String stuName8 = challengeCupDto.getStuName8() != null ? challengeCupDto.getStuName8() : "";
                stuNameArr[0] = stuName1;       stuNameArr[1] = stuName2;       stuNameArr[2] = stuName3;
                stuNameArr[3] = stuName4;       stuNameArr[4] = stuName5;       stuNameArr[5] = stuName6;
                stuNameArr[6] = stuName7;       stuNameArr[7] = stuName8;
                challengeCupDto.setStuNameArr(stuNameArr);

                String[] stuNumberArr = new String[8];
                String stuNumber1 = challengeCupDto.getStuNumber1() != null ? challengeCupDto.getStuNumber1() : "";
                String stuNumber2 = challengeCupDto.getStuNumber2() != null ? challengeCupDto.getStuNumber2() : "";
                String stuNumber3 = challengeCupDto.getStuNumber3() != null ? challengeCupDto.getStuNumber3() : "";
                String stuNumber4 = challengeCupDto.getStuNumber4() != null ? challengeCupDto.getStuNumber4() : "";
                String stuNumber5 = challengeCupDto.getStuNumber5() != null ? challengeCupDto.getStuNumber5() : "";
                String stuNumber6 = challengeCupDto.getStuNumber6() != null ? challengeCupDto.getStuNumber6() : "";
                String stuNumber7 = challengeCupDto.getStuNumber7() != null ? challengeCupDto.getStuNumber7() : "";
                String stuNumber8 = challengeCupDto.getStuNumber8() != null ? challengeCupDto.getStuNumber8() : "";
                stuNumberArr[0] = stuNumber1;       stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                stuNumberArr[3] = stuNumber4;       stuNumberArr[4] = stuNumber5;       stuNumberArr[5] = stuNumber6;
                stuNumberArr[6] = stuNumber7;       stuNumberArr[7] = stuNumber8;
                challengeCupDto.setStuNumberArr(stuNumberArr);

                String[] majorArr = new String[8];
                String major1 = challengeCupDto.getStuMajor1() != null ? challengeCupDto.getStuMajor1() : "";
                String major2 = challengeCupDto.getStuMajor2() != null ? challengeCupDto.getStuMajor2() : "";
                String major3 = challengeCupDto.getStuMajor3() != null ? challengeCupDto.getStuMajor3() : "";
                String major4 = challengeCupDto.getStuMajor4() != null ? challengeCupDto.getStuMajor4() : "";
                String major5 = challengeCupDto.getStuMajor5() != null ? challengeCupDto.getStuMajor5() : "";
                String major6 = challengeCupDto.getStuMajor6() != null ? challengeCupDto.getStuMajor6() : "";
                String major7 = challengeCupDto.getStuMajor7() != null ? challengeCupDto.getStuMajor7() : "";
                String major8 = challengeCupDto.getStuMajor8() != null ? challengeCupDto.getStuMajor8() : "";
                majorArr[0] = major1;       majorArr[1] = major2;       majorArr[2] = major3;
                majorArr[3] = major4;       majorArr[4] = major5;       majorArr[5] = major6;
                majorArr[6] = major7;       majorArr[7] = major8;
                challengeCupDto.setStuMajorArr(majorArr);
            }
        }

        return challengeCupDtoList;
    }

    @Override
    public ChallengeCupDto selectById(Integer id) throws Exception {
        ChallengeCupDto challengeCupDto = null;
        challengeCupDto = challengeCupDao.selectById(id);

        //对时间进行处理
        if(challengeCupDto != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date prizeTime = challengeCupDto.getPrizeTime();
            String prizeTimeStr = "";
            if(prizeTime != null) {
                prizeTimeStr = sdf.format(prizeTime);
            }
            challengeCupDto.setPrizeTimeStr(prizeTimeStr);
        }

        return challengeCupDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            challengeCupDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            challengeCupDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

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
