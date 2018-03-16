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
            for (ACMPrizeDto acmPrizeDto : acmPrizeDtoList) {
                //对日期进行处理
                Date prizeTime = acmPrizeDto.getPrizeTime();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String prizeTimeStr = "";
                if(prizeTime != null) {
                    prizeTimeStr = sdf.format(prizeTime);
                }
                acmPrizeDto.setPrizeTimeStr(prizeTimeStr);

                //应前端需求，将三位获奖同学的姓名、学号、专业存为数组
                String stuNameArr[] = new String[3];
                String stuName1 = acmPrizeDto.getTeammateName1() != null ? acmPrizeDto.getTeammateName1() : "";
                String stuName2 = acmPrizeDto.getTeammateName2() != null ? acmPrizeDto.getTeammateName2() : "";
                String stuName3 = acmPrizeDto.getTeammateName3() != null ? acmPrizeDto.getTeammateName3() : "";
                stuNameArr[0] = stuName1;       stuNameArr[1] = stuName2;       stuNameArr[2] = stuName3;
                acmPrizeDto.setStuNameArr(stuNameArr);

                String stuNumberArr[] = new String[3];
                String stuNumber1 = acmPrizeDto.getTeammateStuNumber1() != null ? acmPrizeDto.getTeammateStuNumber1() : "";
                String stuNumber2 = acmPrizeDto.getTeammateStuNumber2() != null ? acmPrizeDto.getTeammateStuNumber2() : "";
                String stuNumber3 = acmPrizeDto.getTeammateStuNumber3() != null ? acmPrizeDto.getTeammateStuNumber3() : "";
                stuNumberArr[0] = stuNumber1;   stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                acmPrizeDto.setStuNumberArr(stuNumberArr);

                String majorArr[] = new String[3];
                String stuMajor1 = acmPrizeDto.getTeammateMajor1() != null ? acmPrizeDto.getTeammateMajor1() : "";
                String stuMajor2 = acmPrizeDto.getTeammateMajor2() != null ? acmPrizeDto.getTeammateMajor2() : "";
                String stuMajor3 = acmPrizeDto.getTeammateMajor3() != null ? acmPrizeDto.getTeammateMajor3() : "";
                majorArr[0] = stuMajor1;        majorArr[1] = stuMajor2;        majorArr[2] = stuMajor3;
                acmPrizeDto.setMajorArr(majorArr);

            }
        }

        return acmPrizeDtoList;

    }

    @Override
    public Map<String, Object> getParams(Integer matchLevel, String matchName, Date beginTime,
                                         Date endTime, Integer prizeLevel, Integer major, String stuName,
                                         String teacherName, String hostUnit) {
        List<Student> studentList = null;
        Integer teacherId = null;

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, major);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            if(!teacherName.equals("")) {
                Teacher teacher = teacherDao.selectTeacherByName(teacherName);
                if(teacher != null) {
                    teacherId = teacher.getId();
                } else {
                    teacherId = -1;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Integer> idList = new ArrayList<>();
        if(studentList == null) {
            idList = null;
        } else if(studentList.size() == 0) {
            //由于studentList.size为零，说明没有学生符合查询标准，所以应该返回空的patentList
            //但是我没有找到办法通过studentIdList使得查询结果为空的办法，所以只能从teacherId身上找。。
            teacherId = -1;
        } else {
            for(Student student : studentList) {
                idList.add(student.getId());
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
            Date prizeTime = acmPrizeDto.getPrizeTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String prizeTimeStr = "";
            if(prizeTime != null) {
                prizeTimeStr = sdf.format(prizeTime);
            }
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
