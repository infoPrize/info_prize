package com.nenu.info.service.common.impl;

import com.nenu.info.Dao.common.StudentDao;
import com.nenu.info.common.dto.StudentDto;
import com.nenu.info.common.entities.Student;
import com.nenu.info.common.enums.MajorEnum;
import com.nenu.info.common.enums.SexEnum;
import com.nenu.info.service.common.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/11/7 15:28
 * @description :
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

    /**
     * 根据专业查找学生列表
     *
     * @param majorCode
     * @return
     * @throws Exception
     */
    @Override
    public List<Student> listStudentByMajor(Integer majorCode) throws Exception {
        List<Student> studentList = studentDao.listStudentByMajor(majorCode);
        return studentList;
    }

    /**
     * 根据id获取学生
     *
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public Student selectStudentById(Integer id) throws Exception {
        Student student = studentDao.selectStudentById(id);
        return student;
    }

    /**
     * 条件查询学生列表
     * @param name
     * @param sex
     * @param stuNumber
     * @param grade
     * @param majorCode
     * @param phone
     * @return
     * @throws Exception
     */
    public List<StudentDto> queryByCondition(String name, Integer sex, String stuNumber,
                                             String grade, Integer majorCode, String phone) throws Exception{


        List<Student> studentList = studentDao.queryByCondition(name,sex,stuNumber,grade,majorCode,phone);
        List<StudentDto> studentDtoList = convertEntityListToDto(studentList);
        return studentDtoList;

    }

    /**
     * 根据学号删除学生
     * @param stuNumber
     * @throws Exception
     */
    public void deleteByStuNumber(String stuNumber) throws Exception{
        studentDao.deleteByStuNumber(stuNumber);
    }

    /**
     * 实体转换为dto
     * @param studentList
     * @return
     * @throws Exception
     */
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

    /**
     * dto转换为实体
     * @param studentDto
     * @return
     * @throws Exception
     */
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


}
