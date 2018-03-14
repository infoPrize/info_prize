package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.enums.MajorEnum;
import com.nenu.info.common.enums.SexEnum;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.nenu.info.common.utils.WebConstants.pageSize;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:28
 * @description : 学生管理Service
 */
@Service(value = "studentService")
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public void add(Student student) throws Exception {
        studentDao.add(student);
    }

    @Override
    public Student selectStudentByStuNumber(String stuNumber) throws Exception {
        Student student = studentDao.selectStudentByStuNumber(stuNumber);
        return student;
    }

    @Override
    public List<Student> listStudentByMajor(Integer majorCode) throws Exception {
        List<Student> studentList = studentDao.listStudentByMajor(majorCode);
        return studentList;
    }

    @Override
    public Student selectStudentById(Integer id) throws Exception {
        Student student = studentDao.selectStudentById(id);
        return student;
    }

    @Override
    public Map<String, Object> getParams(String name, Integer sex, String stuNumber, String grade, Integer majorCode, String phone) {
        Map<String, Object> params  = new HashMap<>();
        params.put("name", name);
        params.put("sex", sex);
        params.put("stuNumber", stuNumber);
        params.put("grade", grade);
        params.put("majorCode", majorCode);
        params.put("phone", phone);

        return params;
    }

    public List<StudentDto> queryByCondition(Map<String, Object> params) throws Exception{

        List<Student> studentList = studentDao.queryByCondition(params);
        List<StudentDto> studentDtoList = convertEntityListToDto(studentList);
        return studentDtoList;

    }

    @Override
    public Integer countByCondition(Map<String, Object> params) throws Exception {
        Integer count = 0;
        count = studentDao.countByCondition(params);
        return count;
    }

    public void deleteByStuNumber(String stuNumber) throws Exception{
        studentDao.deleteByStuNumber(stuNumber);
    }

    private static List<StudentDto> convertEntityListToDto(List<Student> studentList) throws Exception{

        List<StudentDto> studentDtoList = new ArrayList<>();

        if(studentList != null){
            for(Student student:studentList){
                StudentDto studentDto = new StudentDto();
                studentDto.setName(student.getName());
                studentDto.setSex(SexEnum.getValueById(student.getSex()));
                studentDto.setStuNumber(student.getStuNumber());
                studentDto.setGrade(student.getGrade());
                studentDto.setMajor(MajorEnum.getValueById(student.getMajorCode()));
                studentDto.setPhone(student.getPhone());
                studentDtoList.add(studentDto);
            }
        }
        return studentDtoList;
    }

    public Student convertDtoToEntity(StudentDto studentDto) throws Exception{

        Student student = new Student();
        student.setName(studentDto.getName());
        student.setSex(SexEnum.getIdByValue(studentDto.getSex()));
        student.setStuNumber(studentDto.getStuNumber());
        student.setGrade(studentDto.getGrade());
        student.setMajorCode(MajorEnum.getIdByValue(studentDto.getMajor()));
        student.setPhone(studentDto.getPhone());

        return student;
    }

    @Override
    public boolean checkMatchingWithNameAndStuNumber(String name, String stuNumber) throws Exception {
        Student student = null;
        if(!name.equals("") || !stuNumber.equals("")) {
            student = selectStudentByStuNumber(stuNumber);
            if(student == null) {
                return false;
            }
            if(!name.equals(student.getName())) {
                return false;
            }
        }
        return true;
    }

    public Boolean nameEqualOrNot(String stuNumber, String name) throws Exception{
        Boolean flag = false;
        if(stuNumber != null || studentDao.selectStudentByStuNumber(stuNumber) != null){
            String name1 = studentDao.selectStudentByStuNumber(stuNumber).getName();

                if(name1.equals(name)){
                    flag = true;
                }else {
                    throw new Exception("学号与姓名不匹配");
                }

        }
        return flag;
    }
}
