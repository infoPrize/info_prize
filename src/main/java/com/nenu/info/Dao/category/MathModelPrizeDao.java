package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.MathModelPrizeDto;
import com.nenu.info.common.entities.category.MathModelPrize;
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
     */
    public void add(@Param("mathModelPrize") MathModelPrize mathModelPrize) throws Exception;

    /**
     * 根据条件查询相应信息数量
     */
    public Integer countByConditions(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询数学建模获奖信息
     */
    public List<MathModelPrizeDto> listByConditions(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询数学建模信息
     */
    public MathModelPrizeDto selectById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id对数学建模信息进行假删操作
     */
    public void falseDeleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除数学建模获奖信息
     */
    public void deleteById(@Param("id") Integer id) throws Exception;


}
