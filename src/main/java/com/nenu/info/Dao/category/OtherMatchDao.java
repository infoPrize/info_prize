package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.OtherMatchDto;
import com.nenu.info.common.entities.category.OtherMatch;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/3/8 13:19
 * @description : 其他比赛Dao接口
 */
public interface OtherMatchDao {

    /**
     * 新增其他比赛获奖信息
     */
    public void add(@Param("otherMatch") OtherMatch otherMatch) throws Exception;

    /**
     * 根据条件查询获奖信息数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询获奖信息
     */
    public List<OtherMatchDto> listByCondition(Map<String, Object> params) throws Exception;

}
