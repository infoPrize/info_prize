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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

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

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public void add(Patent patent) throws Exception {
        patentDao.add(patent);
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
    public List<PatentDto> listByConditions(Integer patentType, String patentName, Date beginTime, Date endTime,
                                            Integer majorCode, String grade, String stuNumber, String stuName, String teacherName) throws Exception {
        List<Student> studentList = null;
        List<Integer> studentIdList = new ArrayList<>();
        Integer teacherId = null;
        if((stuName != null && !stuName.equals("")) || (stuNumber != null && !stuNumber.equals("")) || ( majorCode != null && majorCode > 0) || (grade != null && !grade.equals(""))) {
            studentList = studentDao.queryByCondition(stuName, -1, stuNumber, grade, majorCode, null);
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

        List<PatentDto> patentDtoList = patentDao.listByConditions(params);

        for(PatentDto patentDto : patentDtoList) {
            patentDto.setApplyTimeStr(sf.format(patentDto.getApplyTime()));
        }

        return patentDtoList;
    }

    /**
     * dto转换为实体
     * @param patentDto
     * @return
     * @throws Exception
     */
    public Patent convertDtoToEntity(PatentDto patentDto) throws Exception{

        Patent patent = new Patent();
        patent.setPatentName(patentDto.getPatentName());
        patent.setPatentType(PatentTypeEnum.getIdByValue(patentDto.getPatentType()));
        if(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber1()) != null){
            patent.setOwnerId1(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber1()).getId());
        }
        if(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber2()) != null){
            patent.setOwnerId2(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber2()).getId());
        }
        if(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber3()) != null){
            patent.setOwnerId3(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber3()).getId());
        }
        if(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber4()) != null){
            patent.setOwnerId4(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber4()).getId());
        }
        if(studentDao.selectStudentByStuNumber(patentDto.getApplierStuNumber5()) != null){
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
