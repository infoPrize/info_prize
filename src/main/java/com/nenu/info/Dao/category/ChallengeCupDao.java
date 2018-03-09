package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.ChallengeCupDto;
import com.nenu.info.common.entities.category.ChallengeCup;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 18:51
 * @description: 挑战杯Dao接口
 */
public interface ChallengeCupDao {

    /**
     * 添加挑战杯获奖信息
     */
    public void add(@Param("challengeCup")ChallengeCup challengeCup) throws Exception;

    /**
     * 根据条件查询相应信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询相应信息
     */
    public List<ChallengeCupDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询挑战杯信息
     */
    public ChallengeCupDto selectById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id对挑战杯信息进行假删操作
     */
    public void falseDeleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除挑战杯信息
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

}
