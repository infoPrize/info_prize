package com.nenu.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author: software-liuwang
 * @time: 2017/11/4 19:49
 * @description :
 */

@Controller
@RequestMapping(value = "")
public class IndexController {

    @RequestMapping(value = "index")
    public String toIndex() {
        return "index";
    }

}
