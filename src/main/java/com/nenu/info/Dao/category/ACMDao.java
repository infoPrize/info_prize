package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.ACMPrizeDto;
import com.nenu.info.common.entities.ACMPrize;
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
     * @param acmPrize
     */
    public void add(@Param("acmPrize") ACMPrize acmPrize) throws Exception;

    /**
     * 根据条件查询ACM获奖信息
     * @param params 参数
     * @return
     */
    public List<ACMPrizeDto> listByConditions(Map<String, Object> params) throws Exception;

}
