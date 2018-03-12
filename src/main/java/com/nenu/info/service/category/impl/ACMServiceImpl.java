package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ACMDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.entities.category.ACMPrize;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.MatchLevelEnum;
import com.nenu.info.common.enums.PrizeLevelEnum;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.ACMService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:26
 * @description : ACM获奖Service
 */

@Service(value = "acmService")
public class ACMServiceImpl implements ACMService {

    @Autowired
    private ACMDao acmDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentService studentService;

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void add(ACMPrize acmPrize) {
        try {
            acmDao.add(acmPrize);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) {
        Integer count = null;

        try {
            count = acmDao.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public List<ACMPrizeDto> listByConditions(Map<String, Object> params) {
        List<ACMPrizeDto> acmPrizeDtoList = null;

        try {
            acmPrizeDtoList = acmDao.listByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(acmPrizeDtoList != null) {
            //对日期进行处理
            for (ACMPrizeDto acmPrizeDto : acmPrizeDtoList) {
                Date dateStr = acmPrizeDto.getPrizeTime();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                String prizeTimeStr = sdf.format(dateStr);

                acmPrizeDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        return acmPrizeDtoList;

    }

    @Override
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime,
                                         Date endTime, Integer prizeLevel, Integer major, String stuName,
                                         String teacherName, String hostUnit) {
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

        return params;
    }

    @Override
    public ACMPrizeDto selectById(Integer id) {
        ACMPrizeDto acmPrizeDto = null;

        try {
            acmPrizeDto = acmDao.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(acmPrizeDto != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date prizeTime = acmPrizeDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);
            acmPrizeDto.setPrizeTimeStr(prizeTimeStr);
        }

        return acmPrizeDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            acmDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            acmDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 1;
    }

    public ACMPrize convertDtoToEntity(ACMPrizeDto acmPrizeDto) throws Exception{

        ACMPrize acmPrize = new ACMPrize();
        acmPrize.setMatchName(acmPrizeDto.getMatchName());
        acmPrize.setMatchLevel(MatchLevelEnum.getIdByValue(acmPrizeDto.getMatchLevel()));
        acmPrize.setHostUnit(acmPrizeDto.getHostUnit());
        acmPrize.setTeamName(acmPrizeDto.getTeamName());
        if(studentService.nameEqualOrNot(acmPrizeDto.getTeammateStuNumber1(),acmPrizeDto.getTeammateName1()) ){
            acmPrize.setTeammateId1(studentDao.selectStudentByStuNumber(acmPrizeDto.getTeammateStuNumber1()).getId());
        }
        if(studentService.nameEqualOrNot(acmPrizeDto.getTeammateStuNumber2(),acmPrizeDto.getTeammateName2())){
            acmPrize.setTeammateId2(studentDao.selectStudentByStuNumber(acmPrizeDto.getTeammateStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(acmPrizeDto.getTeammateStuNumber3(),acmPrizeDto.getTeammateName3())){
            acmPrize.setTeammateId3(studentDao.selectStudentByStuNumber(acmPrizeDto.getTeammateStuNumber3()).getId());
        }

        acmPrize.setPrizeLevel(PrizeLevelEnum.getIdByValue(acmPrizeDto.getPrizeLevel()));

        String date = sf.format(acmPrizeDto.getPrizeTime());
        acmPrize.setPrizeTime(sf.parse(date));
        if(teacherDao.selectTeacherByName(acmPrizeDto.getTeacherName()) != null){
            acmPrize.setTeacherId(teacherDao.selectTeacherByName(acmPrizeDto.getTeacherName()).getId());
        }

        return acmPrize;
    }
}
