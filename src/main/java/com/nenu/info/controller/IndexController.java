package com.nenu.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 19:49
 * @description : 去往首页
 */

@Controller
@RequestMapping(value = "")
public class IndexController {

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
        return "paper";
    }

    @RequestMapping(value = "patent")
    public String toPatent() {
        return "patent";
    }

    @RequestMapping(value = "counrty")
    public String toCounrty() {
        return "counrty";
    }

    @RequestMapping(value = "ACM")
    public String toACM() {
        return "ACM";
    }

    @RequestMapping(value = "math")
    public String toMath() {
        return "math";
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
    public String toInfoAdd() {
        return "infoAdd";
    }

}
