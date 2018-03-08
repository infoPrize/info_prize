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

        return params;
    }

    @Override
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage) throws Exception {
        if(curPage <= 0 && curPage != -500) {
            curPage = 1;
        } else if(curPage > totalPage) {
            curPage = totalPage;
        }

        int startNum = (curPage - 1) * pageSize;

        params.put("curPage", curPage);
        params.put("totalPage", totalPage);
        params.put("startNum", startNum);
        params.put("pageSize", pageSize);

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
        }

        return patentDtoList;
    }

    @Override
    public PatentDto selectById(Integer id) throws Exception {
        PatentDto patentDto = null;
        patentDto = patentDao.selectById(id);
        return patentDto;
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
