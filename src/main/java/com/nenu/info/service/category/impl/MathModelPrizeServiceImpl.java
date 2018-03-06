package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.MathModelPrizeDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.category.MathModelPrize;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.MatchLevelEnum;
import com.nenu.info.common.enums.PrizeLevelEnum;
import com.nenu.info.common.utils.WebConstants;
import com.nenu.info.service.category.MathModelPrizeService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

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

    @Autowired
    private StudentService studentService;

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void add(MathModelPrize mathModelPrize) {
        try {
            mathModelPrizeDao.add(mathModelPrize);
        } catch (Exception e) {
            e.printStackTrace();
        }
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
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime, Date endTime,
                                         Integer prizeLevel, Integer major, String stuName, String teacherName,
                                         String hostUnit, Integer curPage, Integer totalPage) {
        Map<String, Object> params = getParams(matchLevel, matchName, beginTime, endTime, prizeLevel, major,
                stuName, teacherName, hostUnit);

        if(curPage <= 0 && curPage != -500) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        Integer startNum = pageSize * (curPage - 1);

        params.put("startNum", startNum);
        params.put("pageSize", pageSize);
        params.put("curPage", curPage);
        params.put("totalPage", totalPage);

        return params;
    }

    @Override
    public Integer countByConditions(Map<String, Object> params) {
        Integer count = null;
        try {
            count = mathModelPrizeDao.countByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    @Override
    public List<MathModelPrizeDto> listByConditions(Map<String, Object> params) {
        List<MathModelPrizeDto> mathModelPrizeDtoList = null;

        int startNum = ((int)params.get("curPage") - 1) * WebConstants.pageSize;
        params.put("startNum", startNum);

        try {
            mathModelPrizeDtoList = mathModelPrizeDao.listByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mathModelPrizeDtoList;

    }

    /**
     * 将dto转换为实体
     * @param mathModelPrizeDto
     * @return
     * @throws Exception
     */
    public MathModelPrize convertDtoToEntity(MathModelPrizeDto mathModelPrizeDto) throws Exception{

        MathModelPrize mathModelPrize = new MathModelPrize();
        mathModelPrize.setMatchName(mathModelPrizeDto.getMatchName());
        mathModelPrize.setMatchLevel(MatchLevelEnum.getIdByValue(mathModelPrizeDto.getMatchLevel()));
        mathModelPrize.setHostUnit(mathModelPrizeDto.getHostUnit());
        mathModelPrize.setTeamName(mathModelPrizeDto.getTeamName());

        if(studentService.nameEqualOrNot(mathModelPrizeDto.getTeammateStuNumber1(),mathModelPrizeDto.getTeammateName1())){
            mathModelPrize.setTeammateId1(studentDao.selectStudentByStuNumber(mathModelPrizeDto.getTeammateStuNumber1()).getId());
            System.out.println(studentDao.selectStudentByStuNumber(mathModelPrizeDto.getTeammateStuNumber1()).getName() + "     " + mathModelPrizeDto.getTeammateName1());
        }
        if(studentService.nameEqualOrNot(mathModelPrizeDto.getTeammateStuNumber2(),mathModelPrizeDto.getTeammateName2())){
            mathModelPrize.setTeammateId2(studentDao.selectStudentByStuNumber(mathModelPrizeDto.getTeammateStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(mathModelPrizeDto.getTeammateStuNumber3(),mathModelPrizeDto.getTeammateName3()) ){
            mathModelPrize.setTeammateId3(studentDao.selectStudentByStuNumber(mathModelPrizeDto.getTeammateStuNumber3()).getId());
        }

        mathModelPrize.setPrizeLevel(PrizeLevelEnum.getIdByValue(mathModelPrizeDto.getPrizeLevel()));
        String date = sf.format(mathModelPrizeDto.getPrizeTime());
        mathModelPrize.setPrizeTime(sf.parse(date));
        if(teacherDao.selectTeacherByName(mathModelPrizeDto.getTeacherName()) != null){
            mathModelPrize.setTeacherId(teacherDao.selectTeacherByName(mathModelPrizeDto.getTeacherName()).getId());
        }

        return mathModelPrize;
    }
}
