package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ThesisDao;
import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.Dao.common.TeacherDao;
import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.dto.common.StudentDto;
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
    public Map<String, Object> getParams(Integer journalLevel, String journalName, String thesisTitle, String authorName, String authorStuNumber, Integer authorMajor, String authorGrade, Date beginTime, Date endTime, String teacherName) throws Exception {
        List<StudentDto> studentList = null;
        List<Integer> studentIdList = new ArrayList<>();
        Integer teacherId = null;
        if((authorName != null && authorName != "") || (authorStuNumber != null && authorStuNumber != "") || (authorMajor != null && authorMajor > 0 ) || (authorGrade != null && authorGrade != "")) {
            Map<String, Object> stuParams = null;
            stuParams = studentService.getParams(authorName, -1, authorStuNumber, authorGrade, authorMajor, "");

            studentList = studentDao.queryByCondition(stuParams);
            if(studentList == null) {
                studentIdList = null;
            } else if(studentList.size() == 0) {
                //由于studentList.size为零，说明没有学生符合查询标准，所以应该返回空的patentList
                //但是我没有找到办法通过studentIdList使得查询结果为空的办法，所以只能从teacherId身上找。。
                teacherId = -1;
            } else {
                for(StudentDto student : studentList) {
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
        params.put("journalLevel", journalLevel);
        params.put("journalName", journalName);
        params.put("thesisTitle", thesisTitle);
        params.put("beginTime", beginTime);
        params.put("endTime", endTime);

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
        if(thesisDtoList != null) {
            for (ThesisDto thesisDto : thesisDtoList) {
                //thesisDto.setPublishTimeStr(sf.format(thesisDto.getPublishTime()));
                Date publishTime = thesisDto.getPublishTime();
                String publishTimeStr = "";
                if(publishTime != null) {
                    publishTimeStr = sf.format(publishTime);
                }
                thesisDto.setPublishTimeStr(publishTimeStr);

                //将五位作者的姓名、学号、专业、等级转换为数组
                String[] nameArr = new String[5];
                String authorName1 = thesisDto.getAuthorName1() != null ? thesisDto.getAuthorName1() : "";
                nameArr[0] = authorName1;
                String authorName2 = thesisDto.getAuthorName2() != null ? thesisDto.getAuthorName2() : "";
                nameArr[1] = authorName2;
                String authorName3 = thesisDto.getAuthorName3() != null ? thesisDto.getAuthorName3() : "";
                nameArr[2] = authorName3;
                String authorName4 = thesisDto.getAuthorName4() != null ? thesisDto.getAuthorName4() : "";
                nameArr[3] = authorName4;
                String authorName5 = thesisDto.getAuthorName5() != null ? thesisDto.getAuthorName5() : "";
                nameArr[4] = authorName5;
                thesisDto.setAuthorNameArr(nameArr);

                String[] stuNumArr = new String[5];
                String stuNum1 = thesisDto.getAuthorStuNumber1() != null ? thesisDto.getAuthorStuNumber1() : "";
                stuNumArr[0] = stuNum1;
                String stuNum2 = thesisDto.getAuthorStuNumber2() != null ? thesisDto.getAuthorStuNumber2() : "";
                stuNumArr[1] = stuNum2;
                String stuNum3 = thesisDto.getAuthorStuNumber3() != null ? thesisDto.getAuthorStuNumber3() : "";
                stuNumArr[2] = stuNum3;
                String stuNum4 = thesisDto.getAuthorStuNumber4() != null ? thesisDto.getAuthorStuNumber4() : "";
                stuNumArr[3] = stuNum4;
                String stuNum5 = thesisDto.getAuthorStuNumber5() != null ? thesisDto.getAuthorStuNumber5() : "";
                stuNumArr[4] = stuNum5;
                thesisDto.setAuthorStuNumberArr(stuNumArr);

                String[] majorArr = new String[5];
                String authorMajor1 = thesisDto.getAuthorMajor1() != null ? thesisDto.getAuthorMajor1() : "";
                majorArr[0] = authorMajor1;
                String authorMajor2 = thesisDto.getAuthorMajor2() != null ? thesisDto.getAuthorMajor2() : "";
                majorArr[1] = authorMajor2;
                String authorMajor3 = thesisDto.getAuthorMajor3() != null ? thesisDto.getAuthorMajor3() : "";
                majorArr[2] = authorMajor3;
                String authorMajor4 = thesisDto.getAuthorMajor4() != null ? thesisDto.getAuthorMajor4() : "";
                majorArr[3] = authorMajor4;
                String authorMajor5 = thesisDto.getAuthorMajor5() != null ? thesisDto.getAuthorMajor5() : "";
                majorArr[4] = authorMajor5;
                thesisDto.setAuthorMajorArr(majorArr);

                Integer[] authorLevelArr = new Integer[5];
                Integer authorLevel1 = thesisDto.getAuthorLevel1() != null ? thesisDto.getAuthorLevel1() : 0;
                authorLevelArr[0] = authorLevel1;
                Integer authorLevel2 = thesisDto.getAuthorLevel2() != null ? thesisDto.getAuthorLevel2() : 0;
                authorLevelArr[1] = authorLevel2;
                Integer authorLevel3 = thesisDto.getAuthorLevel3() != null ? thesisDto.getAuthorLevel3() : 0;
                authorLevelArr[2] = authorLevel3;
                Integer authorLevel4 = thesisDto.getAuthorLevel4() != null ? thesisDto.getAuthorLevel4() : 0;
                authorLevelArr[3] = authorLevel4;
                Integer authorLevel5 = thesisDto.getAuthorLevel5() != null ? thesisDto.getAuthorLevel5() : 0;
                authorLevelArr[4] = authorLevel5;
                thesisDto.setAuthorLevelArr(authorLevelArr);

            }
        }

        return thesisDtoList;
    }

    @Override
    public ThesisDto selectById(Integer id) throws Exception {
        ThesisDto thesisDto = null;
        thesisDto = thesisDao.selectById(id);

        //对日期进行处理
        if(thesisDto != null) {
            Date publishTime = thesisDto.getPublishTime();
            String publishTimeStr = "";
            if(publishTime != null) {
                publishTimeStr = sf.format(publishTime);
            }
            thesisDto.setPublishTimeStr(publishTimeStr);
        }

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
