package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.PatentDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.enums.PatentTypeEnum;
import com.nenu.info.service.category.PatentService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 12:06
 * @description : 专利service接口
 */
@Service(value = "patentService")
public class PatentServiceImpl implements PatentService {

    @Autowired
    private PatentDao patentDao;

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private StudentService studentService;

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void add(Patent patent) throws Exception {
        patentDao.add(patent);
    }

    @Override
    public Map<String, Object> getParams(Integer patentType, String patentName, Date beginTime, Date endTime, Integer majorCode, String grade, String stuNumber, String stuName, String teacherName) throws Exception {
        List<Student> studentList = null;
        List<Integer> studentIdList = new ArrayList<>();
        Integer teacherId = null;
        if((stuName != null && !stuName.equals("")) || (stuNumber != null && !stuNumber.equals("")) || ( majorCode != null && majorCode > 0) || (grade != null && !grade.equals(""))) {
            Map<String, Object> stuParams = null;
            stuParams = studentService.getParams(stuName, -1, stuNumber, grade, majorCode, "");
            studentList = studentDao.queryByCondition(stuParams);
            if(studentList == null) {
                studentIdList = null;
            } else if(studentList.size() == 0) {
                //由于studentList.size为零，说明没有学生符合查询标准，所以应该返回空的patentList
                //但是我没有找到办法通过studentIdList使得查询结果为空的办法，所以只能从teacherId身上找。。
                teacherId = -1;
            } else {
                for(Student student : studentList) {
                    studentIdList.add(student.getId());
                }
            }
        }

        Map<String, Object> params = new HashMap<>();
        if(!teacherName.equals("")) {
            Teacher teacher = teacherDao.selectTeacherByName(teacherName);
            if(teacher != null) {
                teacherId = teacher.getId();
            } else {
                teacherId = -1;
            }
        }

        params.put("studentIdList", studentIdList);
        params.put("teacherId", teacherId);
        params.put("patentType", patentType);
        params.put("patentName", patentName);
        params.put("beginTime", beginTime);
        params.put("endTime", endTime);

        return params;
    }

    @Override
    public List<PatentDto> listAll() throws Exception {
        List<PatentDto> patentDtoList = patentDao.listAll();

        for(PatentDto patentDto : patentDtoList) {
            String applyTimeStr = sf.format(patentDto.getApplyTime());
            patentDto.setApplyTimeStr(applyTimeStr);
        }

        return patentDtoList;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) throws Exception {
        Integer count = 0;
        count = patentDao.countByCondition(params);
        return count;
    }

    @Override
    public List<PatentDto> listByCondition(Map<String, Object> params) throws Exception {


        List<PatentDto> patentDtoList = patentDao.listByCondition(params);

        for(PatentDto patentDto : patentDtoList) {
            //对日期进行处理
            Date applyTime = patentDto.getApplyTime();
            String applyTimeStr = "";
            if(applyTime != null) {
                applyTimeStr = sf.format(applyTime);
            }
            patentDto.setApplyTimeStr(applyTimeStr);

            String [] applierNameArr = new String[5];
            String applierName1 = patentDto.getApplierName1() != null ? patentDto.getApplierName1() : "";
            String applierName2 = patentDto.getApplierName2() != null ? patentDto.getApplierName2() : "";
            String applierName3 = patentDto.getApplierName3() != null ? patentDto.getApplierName3() : "";
            String applierName4 = patentDto.getApplierName4() != null ? patentDto.getApplierName4() : "";
            String applierName5 = patentDto.getApplierName5() != null ? patentDto.getApplierName5() : "";
            applierNameArr[0] = applierName1;   applierNameArr[1] = applierName2;    applierNameArr[2] = applierName3;
            applierNameArr[3] = applierName4;   applierNameArr[4] = applierName5;
            patentDto.setApplierNameArr(applierNameArr);

            String [] applierStuNumArr = new String[5];
            String applierStuNum1 = patentDto.getApplierStuNumber1() != null ? patentDto.getApplierStuNumber1() : "";
            String applierStuNum2 = patentDto.getApplierStuNumber2() != null ? patentDto.getApplierStuNumber2() : "";
            String applierStuNum3 = patentDto.getApplierStuNumber3() != null ? patentDto.getApplierStuNumber3() : "";
            String applierStuNum4 = patentDto.getApplierStuNumber4() != null ? patentDto.getApplierStuNumber4() : "";
            String applierStuNum5 = patentDto.getApplierStuNumber5() != null ? patentDto.getApplierStuNumber5() : "";
            applierStuNumArr[0] = applierStuNum1;    applierStuNumArr[1] = applierStuNum2;       applierStuNumArr[2] = applierStuNum3;
            applierStuNumArr[3] = applierStuNum4;    applierStuNumArr[4] = applierStuNum5;
            patentDto.setApplierStuNumberArr(applierStuNumArr);

            String [] applierMajorArr = new String[5];
            String applierMajor1 = patentDto.getApplierMajor1() != null ? patentDto.getApplierMajor1() : "";
            String applierMajor2 = patentDto.getApplierMajor2() != null ? patentDto.getApplierMajor2() : "";
            String applierMajor3 = patentDto.getApplierMajor3() != null ? patentDto.getApplierMajor3() : "";
            String applierMajor4 = patentDto.getApplierMajor4() != null ? patentDto.getApplierMajor4() : "";
            String applierMajor5 = patentDto.getApplierMajor5() != null ? patentDto.getApplierMajor5() : "";
            applierMajorArr[0] = applierMajor1;      applierMajorArr[1] = applierMajor2;         applierMajorArr[2] = applierMajor3;
            applierMajorArr[3] = applierMajor4;      applierMajorArr[4] = applierMajor5;
            patentDto.setApplierStuMajorArr(applierMajorArr);

        }

        return patentDtoList;
    }

    @Override
    public PatentDto selectById(Integer id) throws Exception {
        PatentDto patentDto = null;
        patentDto = patentDao.selectById(id);

        //对日期进行处理
        if(patentDto != null) {
            //对日期进行处理
            Date applyTime = patentDto.getApplyTime();
            String applyTimeStr = "";
            if(applyTime != null) {
                applyTimeStr = sf.format(applyTime);
            }
            patentDto.setApplyTimeStr(applyTimeStr);
        }
        return patentDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            patentDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            patentDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    public Patent convertDtoToEntity(PatentDto patentDto) throws Exception{

        Patent patent = new Patent();
        patent.setPatentName(patentDto.getPatentName());
        patent.setPatentType(PatentTypeEnum.getIdByValue(patentDto.getPatentType()));
        if(studentService.nameEqualOrNot(patentDto.getApplierStuNumber1(),patentDto.getApplierName1())){
            patent.setOwnerId1(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber1()).getId());
        }
        if(studentService.nameEqualOrNot(patentDto.getApplierStuNumber2(),patentDto.getApplierName2())){
            patent.setOwnerId2(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber2()).getId());
        }
        if(studentService.nameEqualOrNot(patentDto.getApplierStuNumber3(),patentDto.getApplierName3())){
            patent.setOwnerId3(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber3()).getId());
        }
        if(studentService.nameEqualOrNot(patentDto.getApplierStuNumber4(),patentDto.getApplierName4())){
            patent.setOwnerId4(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber4()).getId());
        }
        if(studentService.nameEqualOrNot(patentDto.getApplierStuNumber5(),patentDto.getApplierName5()) ){
            patent.setOwnerId5(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber5()).getId());
        }

        String date = sf.format(patentDto.getApplyTime());
        patent.setApplyTime(sf.parse(date));
        if(teacherDao.selectTeacherByName(patentDto.getTeacherName()) != null){
            patent.setTeacherId(teacherDao.selectTeacherByName(patentDto.getTeacherName()).getId());
        }
        patent.setPatentIntroduce(patentDto.getIntroduce());

        return patent;
    }
}
