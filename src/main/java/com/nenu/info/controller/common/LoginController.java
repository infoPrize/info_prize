package com.nenu.info.controller.common;

import com.nenu.info.common.utils.URLConstants;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
public class LoginController {

    /**
     * 去往登录界面
     */
    @RequestMapping(value = "toLogin")
    public String toLogin() {
        return "common/login";
    }

    /**
     * 验证登录(暂时写死，用户名admin，密码liqing123)
     */
    @RequestMapping(value = "checkLogin", method = RequestMethod.POST)
    public String checkLogin(@RequestParam(value = "username", required = false, defaultValue = "") String username,
                             @RequestParam(value = "password", required = false, defaultValue = "") String password,
                             HttpServletRequest request) {
        if(username.equals("admin") && password.equals("liqing123")) {
            HttpSession session = request.getSession();
            session.setAttribute("username", "admin");
            return "index";
        } else {
            return "common/login_fail";
        }
    }

}
