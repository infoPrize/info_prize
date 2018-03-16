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
            } else {
                teacherId = -1;
            }
        }

        try {
            studentList = studentDao.listStudentByStuNameAndMajor(stuName, majorCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
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

        if(otherMatchDtoList != null) {
            for (OtherMatchDto otherMatchDto : otherMatchDtoList) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date prizeTime = otherMatchDto.getPrizeTime();
                String prizeTimeStr = "";
                if(prizeTime != null) {
                    prizeTimeStr = sdf.format(prizeTime);
                }
                otherMatchDto.setPrizeTimeStr(prizeTimeStr);

                //应前端要求，将姓名、学号、专业转换为数组
                String[] stuNameArr = new String[8];
                String stuName1 = otherMatchDto.getStuName1() != null ? otherMatchDto.getStuName1() : "";
                String stuName2 = otherMatchDto.getStuName2() != null ? otherMatchDto.getStuName2() : "";
                String stuName3 = otherMatchDto.getStuName3() != null ? otherMatchDto.getStuName3() : "";
                String stuName4 = otherMatchDto.getStuName4() != null ? otherMatchDto.getStuName4() : "";
                String stuName5 = otherMatchDto.getStuName5() != null ? otherMatchDto.getStuName5() : "";
                String stuName6 = otherMatchDto.getStuName6() != null ? otherMatchDto.getStuName6() : "";
                String stuName7 = otherMatchDto.getStuName7() != null ? otherMatchDto.getStuName7() : "";
                String stuName8 = otherMatchDto.getStuName8() != null ? otherMatchDto.getStuName8() : "";
                stuNameArr[0] = stuName1;       stuNameArr[1] = stuName2;       stuNameArr[2] = stuName3;
                stuNameArr[3] = stuName4;       stuNameArr[4] = stuName5;       stuNameArr[5] = stuName6;
                stuNameArr[6] = stuName7;       stuNameArr[7] = stuName8;
                otherMatchDto.setStuNameArr(stuNameArr);

                String[] stuNumberArr = new String[8];
                String stuNumber1 = otherMatchDto.getStuNumber1() != null ? otherMatchDto.getStuNumber1() : "";
                String stuNumber2 = otherMatchDto.getStuNumber2() != null ? otherMatchDto.getStuNumber2() : "";
                String stuNumber3 = otherMatchDto.getStuNumber3() != null ? otherMatchDto.getStuNumber3() : "";
                String stuNumber4 = otherMatchDto.getStuNumber4() != null ? otherMatchDto.getStuNumber4() : "";
                String stuNumber5 = otherMatchDto.getStuNumber5() != null ? otherMatchDto.getStuNumber5() : "";
                String stuNumber6 = otherMatchDto.getStuNumber6() != null ? otherMatchDto.getStuNumber6() : "";
                String stuNumber7 = otherMatchDto.getStuNumber7() != null ? otherMatchDto.getStuNumber7() : "";
                String stuNumber8 = otherMatchDto.getStuNumber8() != null ? otherMatchDto.getStuNumber8() : "";
                stuNumberArr[0] = stuNumber1;       stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                stuNumberArr[3] = stuNumber4;       stuNumberArr[4] = stuNumber5;       stuNumberArr[5] = stuNumber6;
                stuNumberArr[6] = stuNumber7;       stuNumberArr[7] = stuNumber8;
                otherMatchDto.setStuNumberArr(stuNumberArr);

                String[] majorArr = new String[8];
                String major1 = otherMatchDto.getStuMajor1() != null ? otherMatchDto.getStuMajor1() : "";
                String major2 = otherMatchDto.getStuMajor2() != null ? otherMatchDto.getStuMajor2() : "";
                String major3 = otherMatchDto.getStuMajor3() != null ? otherMatchDto.getStuMajor3() : "";
                String major4 = otherMatchDto.getStuMajor4() != null ? otherMatchDto.getStuMajor4() : "";
                String major5 = otherMatchDto.getStuMajor5() != null ? otherMatchDto.getStuMajor5() : "";
                String major6 = otherMatchDto.getStuMajor6() != null ? otherMatchDto.getStuMajor6() : "";
                String major7 = otherMatchDto.getStuMajor7() != null ? otherMatchDto.getStuMajor7() : "";
                String major8 = otherMatchDto.getStuMajor8() != null ? otherMatchDto.getStuMajor8() : "";
                majorArr[0] = major1;       majorArr[1] = major2;       majorArr[2] = major3;
                majorArr[3] = major4;       majorArr[4] = major5;       majorArr[5] = major6;
                majorArr[6] = major7;       majorArr[7] = major8;
                otherMatchDto.setStuMajorArr(majorArr);
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
            String prizeTimeStr = "";
            if(prizeTime != null) {
                prizeTimeStr = sdf.format(prizeTime);
            }
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
