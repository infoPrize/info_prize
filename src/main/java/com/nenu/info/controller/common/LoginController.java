package com.nenu.info.controller.common;

import com.nenu.info.common.dto.common.StudentDto;
import com.nenu.info.common.entities.common.Student;
import com.nenu.info.common.utils.LoginUtil;
import com.nenu.info.common.utils.URLConstants;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author: software-liuwang
 * @time: 2018/3/11 14:48
 * @description : 登录Controller
 */
@Controller
@RequestMapping(value = URLConstants.LOGIN_URL)
public class LoginController extends AbstractController {

    /**
     * 去往登录界面
     */
    @RequestMapping(value = "toLogin")
    public String toLogin() {
        return "common/login";
    }

    /**
     * 去往登录失败界面
     */
    @RequestMapping(value = "toLoginFail")
    public String toLoginFail() {
        return "common/login_fail";
    }

    /**
     * 验证登录
     *      1 - 管理员登录
     *      2 - 学生登录
     *      3 - 对不起，您不是信科学院的学生
     *     -1 - 用户名或密码错误
     */
    @RequestMapping(value = "checkLogin", method = RequestMethod.POST)
    @ResponseBody
    public Integer checkLogin(@RequestParam(value = "username", required = false, defaultValue = "") String username,
                              @RequestParam(value = "password", required = false, defaultValue = "") String password,
                              HttpServletRequest request) {
        HttpSession session = request.getSession();
        StudentDto student = null;

        boolean isNum = username.matches("[0-9]+");

        if(isNum) {

            //学生登录
            try {
//                UsernamePasswordToken token = new UsernamePasswordToken(username, password);
//                System.out.println("这里其实执行了");
//                Subject subject = SecurityUtils.getSubject();
//
//                subject.login(token);
                if (LoginUtil.isUserExist(username)) {
                    if (!LoginUtil.checkPassword(username, password)){
                        throw new Exception("用户名或密码错误");
                    }

                    try {
                        student = studentService.selectStudentByStuNumber(username);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if(student == null) {
                        return 3;
                    } else {
                        session.setAttribute("username", student.getName());
                        session.setAttribute("stuNumber", username);
                        return 2;
                    }
                } else {
                    return -1;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return -1;
            }
        } else {
            //管理员登录
            if(username.equals("admin") && password.equals("xinke123")) {
                //管理员登录
                session.setAttribute("username", "超级管理员");
                session.setAttribute("stuNumber", "admin");
                System.out.println("username = " + session.getAttribute("username"));
                return 1;
            } else {
                return -1;
            }
        }
    }

    /**
     * 可能通过刷新进入这个页面
     */
    @RequestMapping(value = "checkLogin", method = RequestMethod.GET)
    public String checkLogin() {
        return "index";
    }

    /**
     * 退出登录
     */
    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.removeAttribute("stuNumber");
        return "common/login";
    }

}
