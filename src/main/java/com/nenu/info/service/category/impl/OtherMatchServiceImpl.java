package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.OtherMatchDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.entities.category.OtherMatch;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.MatchLevelEnum;
import com.nenu.info.common.enums.PrizeLevelEnum;
import com.nenu.info.service.category.OtherMatchService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 13:15
 * @description : 其他比赛Service实现类
 */
@Service(value = "otherMatchService")
public class OtherMatchServiceImpl implements OtherMatchService {

    @Autowired
    private OtherMatchDao otherMatchDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentDao studentDao;
    
    @Autowired
    private StudentService studentService;

    @Override
    public void add(OtherMatch otherMatch) {
        try {
            otherMatchDao.add(otherMatch);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String stuName, Integer majorCode, String projectName, String hostUnit, String teacherName) {
        Teacher teacher = null;
        Integer teacherId = null;
        List<Student> studentList = null;
        List<Integer> idList = new ArrayList<>();

        if(!teacherName.equals("")) {
            try {
                teacher = teacherDao.selectTeacherByName(teacherName);
            } catch (Exception e) {
                e.printStackTrace();
            }

            if(teacher != null) {
                teacherId = teacher.getId();
            }
        }

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(studentList != null) {
            for (Student student : studentList) {
                Integer id = student.getId();
                idList.add(id);
            }
        }

        Map<String, Object> params = new HashMap<>();
        params.put("matchName", matchName);
        params.put("matchLevel", matchLevel);
        params.put("prizeLevel", prizeLevel);
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        params.put("projectName", projectName);
        params.put("hostUnit", hostUnit);
        params.put("idList", idList);
        params.put("teacherId", teacherId);

        return params;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) {
        Integer count = 0;
        try {
            count = otherMatchDao.countByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public List<OtherMatchDto> listByCondition(Map<String, Object> params) {
        List<OtherMatchDto> otherMatchDtoList = null;
        try {
            otherMatchDtoList = otherMatchDao.listByCondition(params);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if(otherMatchDtoList != null) {
            for (OtherMatchDto otherMatchDto : otherMatchDtoList) {
                Date prizeTime = otherMatchDto.getPrizeTime();
                String prizeTimeStr = sdf.format(prizeTime);
                otherMatchDto.setPrizeTimeStr(prizeTimeStr);
            }
        }

        return otherMatchDtoList;
    }

    @Override
    public OtherMatchDto selectById(Integer id) {
        OtherMatchDto otherMatchDto = null;
        try {
            otherMatchDto = otherMatchDao.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //对日期进行处理
        if(otherMatchDto != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date prizeTime = otherMatchDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);
            otherMatchDto.setPrizeTimeStr(prizeTimeStr);
        }
        return otherMatchDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            otherMatchDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            otherMatchDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    public OtherMatch convertDtoToEntity(OtherMatchDto otherMatchDto) throws Exception{
        OtherMatch otherMatch = new OtherMatch();
        otherMatch.setProjectName(otherMatchDto.getProjectName());

        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber1(),otherMatchDto.getStuName1())){
            otherMatch.setTeammateId1(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber1()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber2(),otherMatchDto.getStuName2())){
            otherMatch.setTeammateId2(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber3(),otherMatchDto.getStuName3())){
            otherMatch.setTeammateId3(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber3()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber4(),otherMatchDto.getStuName4())){
            otherMatch.setTeammateId4(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber4()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber5(),otherMatchDto.getStuName5())){
            otherMatch.setTeammateId5(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber5()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber6(),otherMatchDto.getStuName6())){
            otherMatch.setTeammateId6(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber6()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber7(),otherMatchDto.getStuName7())){
            otherMatch.setTeammateId7(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber7()).getId());
        }
        if(studentService.nameEqualOrNot(otherMatchDto.getStuNumber8(),otherMatchDto.getStuName8())){
            otherMatch.setTeammateId8(studentDao.selectStudentByStuNumber(otherMatchDto.getStuNumber8()).getId());
        }
        otherMatch.setMatchName(otherMatchDto.getMatchName());
        otherMatch.setMatchLevel(MatchLevelEnum.getIdByValue(otherMatchDto.getMatchLevel()));
        otherMatch.setPrizeLevel(PrizeLevelEnum.getIdByValue(otherMatchDto.getPrizeLevel()));
        otherMatch.setPrizeTime(otherMatchDto.getPrizeTime());
        otherMatch.setHostUnit(otherMatchDto.getHostUnit());
        if(teacherDao.selectTeacherByName(otherMatchDto.getTeacherName()) != null)
        {
            otherMatch.setTeacherId(teacherDao.selectTeacherByName(otherMatchDto.getTeacherName()).getId());
        }
        return otherMatch;
    }
}
