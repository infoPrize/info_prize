package com.nenu.info.controller.common;

import com.nenu.info.common.utils.YearUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 19:49
 * @description : 路径Controller
 */

@Controller
@RequestMapping(value = "")
public class PathController {



    @RequestMapping(value = "index")
    public String toIndex() {
        return "index";
    }

    @RequestMapping(value = "home")
    public String toHome() {
        return "home";
    }

    @RequestMapping(value = "paper")
    public String toPaper() {
        return "thesis";
    }

    @RequestMapping(value = "patent")
    public String toPatent() {
        return "patent";
    }



    @RequestMapping(value = "ACM")
    public String toACM() {
        return "ACM";
    }

    @RequestMapping(value = "mathModel")
    public String toMath() {
        return "math_model";
    }

    @RequestMapping(value = "competition")
    public String toCompetition() {
        return "competition";
    }

    @RequestMapping(value = "other")
    public String toOther() {
        return "other";
    }

    @RequestMapping(value = "manage")
    public String toManage() {
        return "manage";
    }

    @RequestMapping(value = "infoAdd")
    public String toInfoAdd(HttpServletRequest request) {
        Integer year = YearUtil.getYear();
        request.setAttribute("year", year);
        return "infoAdd";
    }

    @RequestMapping(value = "student")
    public String toStudent() {
        return "redirect:/student/list";
    }

    @RequestMapping(value = "student/add")
    public String addStudent() {
        return "student/add";
    }


}
