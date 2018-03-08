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

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

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
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage) throws Exception {
        if(curPage <= 0 && curPage != -500) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        int startNum = (curPage - 1) * pageSize;

        params.put("curPage", curPage);
        params.put("startNum", startNum);
        params.put("totalPage", totalPage);
        params.put("pageSize", pageSize);

        return params;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) throws Exception {
        Integer count = null;
        count = internetPlusDao.countByCondition(params);
        return count;
    }

    @Override
    public List<InternetPlusDto> listByCondition(Map<String, Object> params) throws Exception {
        List<InternetPlusDto> internetPlusDtoList = null;
        internetPlusDtoList = internetPlusDao.listByCondition(params);

        //对日期进行处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(internetPlusDtoList != null) {
            for (InternetPlusDto internetPlusDto : internetPlusDtoList) {
                Date prizeTime = internetPlusDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                internetPlusDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        return internetPlusDtoList;
    }

    @Override
    public InternetPlusDto selectById(Integer id) throws Exception {
        InternetPlusDto internetPlusDto = null;
        internetPlusDto = internetPlusDao.selectById(id);
        return internetPlusDto;
    }

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
