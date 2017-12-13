package com.nenu.info.Dao;

import com.nenu.info.common.dto.MathModelPrizeDto;
import com.nenu.info.common.entities.MathModelPrize;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/11 9:40
 * @description : 数学建模Dao接口
 */
public interface MathModelPrizeDao {

    /**
     * 添加数学建模获奖信息数据
     * @param mathModelPrize
     */
    public void add(@Param("mathModelPrize") MathModelPrize mathModelPrize) throws Exception;

    /**
     * 根据条件查询数学建模获奖信息
     * @param params
     * @return
     * @throws Exception
     */
    public List<MathModelPrizeDto> listByConditions(Map<String, Object> params) throws Exception;

}
