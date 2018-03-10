package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ThesisDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.entities.common.Teacher;
import com.nenu.info.common.entities.category.Thesis;
import com.nenu.info.common.enums.JournalLevelEnum;
import com.nenu.info.common.utils.DateConverter;
import com.nenu.info.service.category.ThesisService;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 20:12
 * @description : 论文service实现类
 */
@Service(value = "thesisService")
public class ThesisServiceImpl implements ThesisService {

    @Autowired
    private StudentDao studentDao;

    @Autowired
    private TeacherDao teacherDao;

    @Autowired
    private ThesisDao thesisDao;

    @Autowired
    private StudentService studentService;

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();


    @Override
    public void add(Thesis thesis) throws Exception {
        thesisDao.add(thesis);
    }

    @Override
    public Map<String, Object> getParams(Integer journalLevel, String journalName, String authorName, String authorStuNumber, Integer authorMajor, String authorGrade, Date beginTime, Date endTime, String teacherName) throws Exception {
        List<Student> studentList = null;
        List<Integer> studentIdList = new ArrayList<>();
        Integer teacherId = null;
        if((authorName != null && authorName != "") || (authorStuNumber != null && authorStuNumber != "") || (authorMajor != null && authorMajor > 0 ) || (authorGrade != null && authorGrade != "")) {
            Map<String, Object> stuParams = null;
            stuParams = studentService.getParams(authorName, -1, authorStuNumber, authorGrade, authorMajor, "");
            stuParams = studentService.getParams(stuParams, -500, 0);

            studentList = studentDao.queryByCondition(stuParams);
            if(studentList == null) {
                return null;
            } else {
                for (Student student : studentList) {
                    studentIdList.add(student.getId());
                }
            }
        }

        Map<String, Object> params = new HashMap<>();
        if(!teacherName.equals("")) {
            Teacher teacher = teacherDao.selectTeacherByName(teacherName);
            if(teacher != null) {
                teacherId = teacher.getId();
            }
        }
        params.put("studentIdList", studentIdList);
        params.put("teacherId", teacherId);
        params.put("journalLevel", journalLevel);
        params.put("journalName", journalName);
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
        params.put("pageSize", pageSize);
        params.put("startNum", startNum);

        return params;
    }

    @Override
    public Integer countByCondition(Map<String, Object> params) throws Exception {
        Integer count = 0;
        count = thesisDao.countByCondition(params);
        return count;
    }

    @Override
    public List<ThesisDto> listAll() throws Exception {

        List<ThesisDto> thesisDtoList =  thesisDao.listAll();

        for(ThesisDto thesisDto : thesisDtoList) {
            thesisDto.setPublishTimeStr(sf.format(thesisDto.getPublishTime()));
        }

        return thesisDtoList;
    }

    @Override
    public List<ThesisDto> listByCondition(Map<String, Object> params) throws Exception {

        List<ThesisDto> thesisDtoList = null;

        thesisDtoList =  thesisDao.listByCondition(params);
        for(ThesisDto thesisDto : thesisDtoList) {
            thesisDto.setPublishTimeStr(sf.format(thesisDto.getPublishTime()));
        }

        return thesisDtoList;
    }

    @Override
    public ThesisDto selectById(Integer id) throws Exception {
        ThesisDto thesisDto = null;
        thesisDto = thesisDao.selectById(id);
        return thesisDto;
    }

    @Override
    public Integer falseDeleteById(Integer id) {
        try {
            thesisDao.falseDeleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    @Override
    public Integer deleteById(Integer id) {
        try {
            thesisDao.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

    public Thesis convertDtoToEntity(ThesisDto thesisDto) throws Exception{

        Thesis thesis = new Thesis();
        thesis.setThesisTitle(thesisDto.getThesisTitle());
        if(studentService.nameEqualOrNot(thesisDto.getAuthorStuNumber1(),thesisDto.getAuthorName1())){
            thesis.setAuthorId1((studentDao.selectStudentByStuNumber(thesisDto.getAuthorStuNumber1()).getId()));
            thesis.setAuthorLevel1(thesisDto.getAuthorLevel1());
        }
        if(studentService.nameEqualOrNot(thesisDto.getAuthorStuNumber2(),thesisDto.getAuthorName2()) ){
            thesis.setAuthorId2((studentDao.selectStudentByStuNumber(thesisDto.getAuthorStuNumber2()).getId()));
            thesis.setAuthorLevel2(thesisDto.getAuthorLevel2());
        }
        if(studentService.nameEqualOrNot(thesisDto.getAuthorStuNumber3(),thesisDto.getAuthorName3())){
            thesis.setAuthorId3((studentDao.selectStudentByStuNumber(thesisDto.getAuthorStuNumber3()).getId()));
            thesis.setAuthorLevel3(thesisDto.getAuthorLevel3());
        }
        if(studentService.nameEqualOrNot(thesisDto.getAuthorStuNumber4(),thesisDto.getAuthorName4())){
            thesis.setAuthorId4((studentDao.selectStudentByStuNumber(thesisDto.getAuthorStuNumber4()).getId()));
            thesis.setAuthorLevel4(thesisDto.getAuthorLevel4());
        }
        if(studentService.nameEqualOrNot(thesisDto.getAuthorStuNumber5(),thesisDto.getAuthorName5())){
            thesis.setAuthorId5((studentDao.selectStudentByStuNumber(thesisDto.getAuthorStuNumber5()).getId()));
            thesis.setAuthorLevel5(thesisDto.getAuthorLevel5());
        }

        //AVA.UTIL.DATE的形式就是2005-05-01而JAVA.SQL.DATE的形式就是SUN MAY 01 00:00:00 CST 2005
        String date = sf.format(thesisDto.getPublishTime());
        thesis.setPublishTime(sf.parse(date));

        thesis.setJournalName(thesisDto.getJournalName());
        thesis.setJournalLevel(JournalLevelEnum.getIdByValue(thesisDto.getJournalLevel()));
        if(teacherDao.selectTeacherByName(thesisDto.getTeacherName()) != null){
            thesis.setTeacherId(teacherDao.selectTeacherByName(thesisDto.getTeacherName()).getId());
        }
        thesis.setThesisAbstract(thesisDto.getThesisAbstract());

        return thesis;
    }
}
