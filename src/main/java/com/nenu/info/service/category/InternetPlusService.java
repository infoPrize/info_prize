package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.InternetPlus;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 19:03
 * @description: 互联网+Service
 */
public interface InternetPlusService {

    /**
     * 新增互联网+获奖信息
     * @param internetPlus
     * @throws Exception
     */
    public void add(InternetPlus internetPlus) throws Exception;

    public List<InternetPlusDto> listByCondition(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime,
                                                 Date endTime, String teamName, String stuName, Integer majorCode, String projectName,
                                                 String hostUnit, String teacherName) throws Exception;

}
