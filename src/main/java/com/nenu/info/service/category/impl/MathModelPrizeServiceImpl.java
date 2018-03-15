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

        try {
            mathModelPrizeDtoList = mathModelPrizeDao.listByConditions(params);
        } catch (Exception e) {
            e.printStackTrace();
        }


        if(mathModelPrizeDtoList != null) {
            for (MathModelPrizeDto mathModelPrizeDto : mathModelPrizeDtoList) {
                //对日期进行处理
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date prizeTime = mathModelPrizeDto.getPrizeTime();
                String prizeTimeStr = "";
                if(prizeTime != null) {
                    prizeTimeStr = sdf.format(prizeTime);
                }
                mathModelPrizeDto.setPrizeTimeStr(prizeTimeStr);

                //应前端需求，将三位获奖同学的姓名、学号、专业存为数组
                String stuNameArr[] = new String[3];
                String stuName1 = mathModelPrizeDto.getTeammateName1() != null ? mathModelPrizeDto.getTeammateName1() : "";
                String stuName2 = mathModelPrizeDto.getTeammateName2() != null ? mathModelPrizeDto.getTeammateName2() : "";
                String stuName3 = mathModelPrizeDto.getTeammateName3() != null ? mathModelPrizeDto.getTeammateName3() : "";
                stuNameArr[0] = stuName1;       stuNameArr[1] = stuName2;       stuNameArr[2] = stuName3;
                mathModelPrizeDto.setStuNameArr(stuNameArr);

                String stuNumberArr[] = new String[3];
                String stuNumber1 = mathModelPrizeDto.getTeammateStuNumber1() != null ? mathModelPrizeDto.getTeammateStuNumber1() : "";
                String stuNumber2 = mathModelPrizeDto.getTeammateStuNumber2() != null ? mathModelPrizeDto.getTeammateStuNumber2() : "";
                String stuNumber3 = mathModelPrizeDto.getTeammateStuNumber3() != null ? mathModelPrizeDto.getTeammateStuNumber3() : "";
                stuNumberArr[0] = stuNumber1;   stuNumberArr[1] = stuNumber2;       stuNumberArr[2] = stuNumber3;
                mathModelPrizeDto.setStuNumberArr(stuNumberArr);

                String majorArr[] = new String[3];
                String stuMajor1 = mathModelPrizeDto.getTeammateMajor1() != null ? mathModelPrizeDto.getTeammateMajor1() : "";
                String stuMajor2 = mathModelPrizeDto.getTeammateMajor2() != null ? mathModelPrizeDto.getTeammateMajor2() : "";
                String stuMajor3 = mathModelPrizeDto.getTeammateMajor3() != null ? mathModelPrizeDto.getTeammateMajor3() : "";
                majorArr[0] = stuMajor1;        majorArr[1] = stuMajor2;        majorArr[2] = stuMajor3;
                mathModelPrizeDto.setMajorArr(majorArr);
            }
        }
        return mathModelPrizeDtoList;
    }

    @Override
    public MathModelPrizeDto selectById(Integer id) {
        MathModelPrizeDto mathModelPrizeDto = null;
        try {
            mathModelPrizeDto = mathModelPrizeDao.selectById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(mathModelPrizeDto != null) {
            SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

            Date prizeTime = mathModelPrizeDto.getPrizeTime();
            String prizeTimeStr = sf.format(prizeTime);
            mathModelPrizeDto.setPrizeTimeStr(prizeTimeStr);
        }

        return mathModelPrizeDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            mathModelPrizeDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }

        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            mathModelPrizeDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    public MathModelPrize convertDtoToEntity(MathModelPrizeDto mathModelPrizeDto) throws Exception{
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

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
