//package com.nenu.info.controller.common;
//
//import com.nenu.info.common.dto.common.StudentDto;
//import com.nenu.info.common.entities.common.Student;
//import com.nenu.info.common.utils.URLConstants;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
///**
// * @author: software-liuwang
// * @time: 2018/3/17 18:52
// * @description: 注册Controller
// */
//@Controller
//@RequestMapping(value = URLConstants.REGISTER_URL)
//public class RegisterController extends AbstractController{
//
//    /**
//     * 去往注册页面
//     */
//    @RequestMapping(value = "toRegister")
//    public String toRegister() {
//        return "common/register";
//    }
//
//    /**
//     * 执行注册操作
//     * @return 状态代码
//     *             -1 - 注册失败：系统出现异常
//     *              1 - 注册失败：
//     *                  学生姓名、学号不匹配或您不是信息科学与技术学院的学生
//     *              2 - 您已经完成注册，确定要重新注册？这会重置您的密码！
//     *              3 - 注册成功
//     */
//    @RequestMapping(value = "register")
//    @ResponseBody
//    public Integer doRegister(@RequestParam(value = "stuName") String stuName,
//                              @RequestParam(value = "stuNumber") String stuNumber,
//                              @RequestParam(value = "password") String password) {
//        StudentDto student = null;
//        try {
//            if(studentService.checkMatchingWithNameAndStuNumber(stuName, stuNumber)) {
//                student = studentService.selectStudentByStuNumber(stuNumber);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return -1;
//        }
//        if(student == null) {
//            return 1;
//        }
//        if(student.getPassword() != null && !student.getPassword().equals("")) {
//            return 2;
//        }
//
//        try {
//            studentService.addPasswordById(password, student.getId());
//        } catch (Exception e) {
//            e.printStackTrace();
//            return -1;
//        }
//        return 3;
//    }
//
//    /**
//     * 确定修改密码
//     *  @return 状态代码
//     *             -1 - 注册失败：系统出现异常
//     *              1 - 注册失败：
//     *                  学生姓名、学号不匹配或您不是信息科学与技术学院的学生
//     *              3 - 注册成功
//     */
//    @RequestMapping(value = "sureUpdatePassword")
//    @ResponseBody
//    public Integer sureUpdatePassword(@RequestParam(value = "stuName") String stuName,
//                                      @RequestParam(value = "stuNumber") String stuNumber,
//                                      @RequestParam(value = "password") String password) {
//        StudentDto student = null;
//        try {
//            if(studentService.checkMatchingWithNameAndStuNumber(stuName, stuNumber)) {
//                student = studentService.selectStudentByStuNumber(stuNumber);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            return -1;
//        }
//        if(student == null) {
//            return 1;
//        }
//
//        try {
//            studentService.addPasswordById(password, student.getId());
//        } catch (Exception e) {
//            e.printStackTrace();
//            return -1;
//        }
//        return 3;
//    }
//
//}
