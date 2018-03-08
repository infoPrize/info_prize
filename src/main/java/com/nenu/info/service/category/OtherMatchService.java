package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.entities.category.OtherMatch;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 13:15
 * @description : 其他比赛Service接口
 */
public interface OtherMatchService {

    /**
     * 添加其他比赛获奖信息
     */
    public void add(OtherMatch otherMatch);

    /**
     * 将传递来的参数加工为去数据库查询的参数(与分页无关)
     */
    public Map<String, Object> getParams(String matchName, Integer matchLevel, Integer prizeLevel, Date startTime, Date endTime, String stuName,
                                         Integer majorCode, String projectName, String hostUnit, String teacherName);

    /**
     * 将传递来的参数加工为去数据库查询的参数(与分页有关)
     */
    public Map<String, Object> getParams(Map<String, Object> params, Integer curPage, Integer totalPage);

    /**
     * 根据条件查询相应信息的数量
     */
    public Integer countByCondition(Map<String, Object> params);

    /**
     * 根据条件查询相应信息
     */
    public List<OtherMatchDto> listByCondition(Map<String, Object> params);



}
