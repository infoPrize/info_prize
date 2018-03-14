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
                return null;
            } else {
                for(Student student : studentList) {
                    studentIdList.add(student.getId());
                }
            }
        }

        Map<String, Object> params = new HashMap<>();
        if(!teacherName.equals("")) {
            Teacher teacher = teacherDao.selectTeacherByName(teacherName);
            if(teacher == null) {
                return null;
            } else {
                teacherId = teacher.getId();
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
            patentDto.setApplyTimeStr(sf.format(patentDto.getApplyTime()));
            String [] applierNameArr = new String[5];
            String applierName1 = patentDto.getApplierName1();
            String applierName2 = patentDto.getApplierName2();
            String applierName3 = patentDto.getApplierName3();
            String applierName4 = patentDto.getApplierName4();
            String applierName5 = patentDto.getApplierName5();
            if(applierName1 == null) patentDto.setApplierName1("");
            if(applierName2 == null) patentDto.setApplierName2("");
            if(applierName3 == null) patentDto.setApplierName3("");
            if(applierName4 == null) patentDto.setApplierName4("");
            if(applierName5 == null) patentDto.setApplierName5("");
            applierNameArr[0] = patentDto.getApplierName1();
            applierNameArr[1] = patentDto.getApplierName2();
            applierNameArr[2] = patentDto.getApplierName3();
            applierNameArr[3] = patentDto.getApplierName4();
            applierNameArr[4] = patentDto.getApplierName5();
            patentDto.setApplierNameArr(applierNameArr);

            String [] applierStuNumArr = new String[5];
            String applierStuNum1 = patentDto.getApplierStuNumber1();
            String applierStuNum2 = patentDto.getApplierStuNumber2();
            String applierStuNum3 = patentDto.getApplierStuNumber3();
            String applierStuNum4 = patentDto.getApplierStuNumber4();
            String applierStuNum5 = patentDto.getApplierStuNumber5();
            if(applierStuNum1 == null) patentDto.setApplierStuNumber1("");
            if(applierStuNum2 == null) patentDto.setApplierStuNumber2("");
            if(applierStuNum3 == null) patentDto.setApplierStuNumber3("");
            if(applierStuNum4 == null) patentDto.setApplierStuNumber4("");
            if(applierStuNum5 == null) patentDto.setApplierStuNumber5("");
            applierStuNumArr[0] = patentDto.getApplierStuNumber1();
            applierStuNumArr[1] = patentDto.getApplierStuNumber2();
            applierStuNumArr[2] = patentDto.getApplierStuNumber3();
            applierStuNumArr[3] = patentDto.getApplierStuNumber4();
            applierStuNumArr[4] = patentDto.getApplierStuNumber5();
            patentDto.setApplierStuNumber(applierStuNumArr);

            String [] applierMajorArr = new String[5];
            String applierMajor1 = patentDto.getApplierMajor1();
            String applierMajor2 = patentDto.getApplierMajor2();
            String applierMajor3 = patentDto.getApplierMajor3();
            String applierMajor4 = patentDto.getApplierMajor4();
            String applierMajor5 = patentDto.getApplierMajor5();
            if(applierMajor1 == null) patentDto.setApplierMajor1("");
            if(applierMajor2 == null) patentDto.setApplierMajor2("");
            if(applierMajor3 == null) patentDto.setApplierMajor3("");
            if(applierMajor4 == null) patentDto.setApplierMajor4("");
            if(applierMajor5 == null) patentDto.setApplierMajor5("");
            applierMajorArr[0] = patentDto.getApplierMajor1();
            applierMajorArr[1] = patentDto.getApplierMajor2();
            applierMajorArr[2] = patentDto.getApplierMajor3();
            applierMajorArr[3] = patentDto.getApplierMajor4();
            applierMajorArr[4] = patentDto.getApplierMajor5();
            patentDto.setApplierStuMajor(applierMajorArr);

            if(patentDto.getIntroduce() == null) {
                patentDto.setIntroduce("");
            }

        }

        return patentDtoList;
    }

    @Override
    public PatentDto selectById(Integer id) throws Exception {
        PatentDto patentDto = null;
        patentDto = patentDao.selectById(id);

        //对日期进行处理
        if(patentDto != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date applyTime = patentDto.getApplyTime();
            String applyTimeStr = sdf.format(applyTime);
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
