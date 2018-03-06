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
    public Integer countByCondition(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                    Integer prizeLevel, Integer major, String stuName, String teacherName, String hostUnit) {
        Map<String, Object> params = getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major, stuName, teacherName, hostUnit, -1, -1);
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

        Integer startNum = ((int)params.get("curPage") - 1) * WebConstants.pageSize;
        params.put("startNum", startNum);

        try {
            acmPrizeDtoList = acmDao.listByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return acmPrizeDtoList;

    }

    @Override
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName,
                                         String hostUnit, Integer curPage, Integer totalPage) {
        List<Student> studentList = null;

        if(curPage <= 0) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

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

        Integer startNum = pageSize * (curPage - 1);

        Map<String, Object> params = new HashMap<>();
        params.put("matchLevel", matchLevel);
        params.put("matchName", matchName);
        params.put("beginTime", beginTime);
        params.put("endTime", endTime);
        params.put("prizeLevel", prizeLevel);
        params.put("teacherId", teacherId);
        params.put("hostUnit", hostUnit);
        params.put("idList", idList);
        params.put("startNum", startNum);
        params.put("pageSize", pageSize);
        params.put("curPage", curPage);
        params.put("totalPage", totalPage);

        return params;
    }


    /**
     * 将dto转换为实体
     * @param acmPrizeDto
     * @return
     * @throws Exception
     */
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
        acmPrize.setPrizeTime(acmPrizeDto.getPrizeTime());
        if(teacherDao.selectTeacherByName(acmPrizeDto.getTeacherName()) != null){
            acmPrize.setTeacherId(teacherDao.selectTeacherByName(acmPrizeDto.getTeacherName()).getId());
        }

        return acmPrize;
    }
}
