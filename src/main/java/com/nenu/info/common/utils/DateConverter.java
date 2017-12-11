package com.nenu.info.common.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: software-liuwang
 * @time: 2017/12/3 18:08
 * @description : 日期转换器
 */
public class DateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String source) {

        if(source == "") {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        try {
            return dateFormat.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
