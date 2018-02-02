package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.entities.category.ChallengeCup;

import java.util.Date;
import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 19:03
 * @description: 挑战杯Service
 */
public interface ChallengeCupService {

    /**
     * 新增互联网+获奖信息
     */
    public void add(ChallengeCup challengeCup) throws Exception;

    public List<ChallengeCupDto> listByCondition(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime,
                                                 Date endTime, String teamName, String stuName, Integer majorCode, String projectName,
                                                 String hostUnit, String teacherName) throws Exception;

}
