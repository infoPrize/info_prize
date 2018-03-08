package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.ACMPrizeDto;
import com.nenu.info.common.entities.category.ACMPrize;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:27
 * @description : ACM获奖信息Dao
 */
public interface ACMDao {

    /**
     * 添加ACM获奖信息
     */
    public void add(@Param("acmPrize") ACMPrize acmPrize) throws Exception;

    /**
     * 根据条件查询ACM获奖信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据条件查询ACM获奖信息
     */
    public List<ACMPrizeDto> listByConditions(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询ACM获奖信息
     */
    public ACMPrizeDto selectById(@Param("id") Integer id) throws Exception;

}
