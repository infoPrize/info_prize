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
            if(teacher != null) {
                teacherId = teacher.getId();
            } else {
                teacherId = -1;
            }
        }
        studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);

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
                String prizeTimeStr = "";
                if(prizeTime != null) {
                    prizeTimeStr = sdf.format(prizeTime);
                }
                internetPlusDto.setPrizeTimeStr(prizeTimeStr);

                //应前端要求，将姓名、学号、专业转换为数组
                String[] stuNameArr = new String[8];
                String stuName1 = internetPlusDto.getStuName1() != null ? internetPlusDto.getStuName1() : "";
                String stuName2 = internetPlusDto.getStuName2() != null ? internetPlusDto.getStuName2() : "";
                String stuName3 = internetPlusDto.getStuName3() != null ? internetPlusDto.getStuName3() : "";
                String stuName4 = internetPlusDto.getStuName4() != null ? internetPlusDto.getStuName4() : "";
                String stuName5 = internetPlusDto.getStuName5() != null ? internetPlusDto.getStuName5() : "";
                String stuName6 = internetPlusDto.getStuName6() != null ? internetPlusDto.getStuName6() : "";
                String stuName7 = internetPlusDto.getStuName7() != null ? internetPlusDto.getStuName7() : "";
                String stuName8 = internetPlusDto.getStuName8() != null ? internetPlusDto.getStuName8() : "";
                stuNameArr[0] = stuName1;       stuNameArr[1] = stuName2;       stuNameArr[2] = stuName3;
                stuNameArr[3] = stuName4;       stuNameArr[4] = stuName5;       stuNameArr[5] = stuName6;
                stuNameArr[6] = stuName7;       stuNameArr[7] = stuName8;
                internetPlusDto.setStuNameArr(stuNameArr);

                String[] stuNumberArr = new String[8];
                String stuNumber1 = internetPlusDto.getStuNumber1() != null ? internetPlusDto.getStuNumber1() : "";
                String stuNumber2 = internetPlusDto.getStuNumber2() != null ? internetPlusDto.getStuNumber2() : "";
                String stuNumber3 = internetPlusDto.getStuNumber3() != null ? internetPlusDto.getStuNumber3() : "";
                String stuNumber4 = internetPlusDto.getStuNumber4() != null ? internetPlusDto.getStuNumber4() : "";
                String stuNumber5 = internetPlusDto.getStuNumber5() != null ? internetPlusDto.getStuNumber5() : "";
                String stuNumber6 = internetPlusDto.getStuNumber6() != null ? internetPlusDto.getStuNumber6() : "";
                String stuNumber7 = internetPlusDto.getStuNumber7() != null ? internetPlusDto.getStuNumber7() : "";
                String stuNumber8 = internetPlusDto.getStuNumber8() != null ? internetPlusDto.getStuNumber8() : "";
                stuNumberArr[0] = stuNumber1;       stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                stuNumberArr[3] = stuNumber4;       stuNumberArr[4] = stuNumber5;       stuNumberArr[5] = stuNumber6;
                stuNumberArr[6] = stuNumber7;       stuNumberArr[7] = stuNumber8;
                internetPlusDto.setStuNumberArr(stuNumberArr);

                String[] majorArr = new String[8];
                String major1 = internetPlusDto.getStuMajor1() != null ? internetPlusDto.getStuMajor1() : "";
                String major2 = internetPlusDto.getStuMajor2() != null ? internetPlusDto.getStuMajor2() : "";
                String major3 = internetPlusDto.getStuMajor3() != null ? internetPlusDto.getStuMajor3() : "";
                String major4 = internetPlusDto.getStuMajor4() != null ? internetPlusDto.getStuMajor4() : "";
                String major5 = internetPlusDto.getStuMajor5() != null ? internetPlusDto.getStuMajor5() : "";
                String major6 = internetPlusDto.getStuMajor6() != null ? internetPlusDto.getStuMajor6() : "";
                String major7 = internetPlusDto.getStuMajor7() != null ? internetPlusDto.getStuMajor7() : "";
                String major8 = internetPlusDto.getStuMajor8() != null ? internetPlusDto.getStuMajor8() : "";
                majorArr[0] = major1;       majorArr[1] = major2;       majorArr[2] = major3;
                majorArr[3] = major4;       majorArr[4] = major5;       majorArr[5] = major6;
                majorArr[6] = major7;       majorArr[7] = major8;
                internetPlusDto.setStuMajorArr(majorArr);
            }
        }

        return internetPlusDtoList;
    }

    @Override
    public InternetPlusDto selectById(Integer id) throws Exception {
        InternetPlusDto internetPlusDto = null;
        internetPlusDto = internetPlusDao.selectById(id);

        if(internetPlusDto != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date prizeTime = internetPlusDto.getPrizeTime();
            String prizeTimeStr = sdf.format(prizeTime);
            internetPlusDto.setPrizeTimeStr(prizeTimeStr);
        }
        return internetPlusDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            internetPlusDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            internetPlusDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
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
