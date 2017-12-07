package com.nenu.info.common.utils;

import java.util.Calendar;

/**
 * @author: software-liuwang
 * @time: 2017/12/4 15:53
 * @description : 年份日期工具
 */
public class YearUtil {

    /**
     * 获取当前年份
     * @return
     */
    public static Integer getYear() {
        Calendar calendar = Calendar.getInstance();
        Integer year = calendar.get(Calendar.YEAR);
        return year;
    }

}
