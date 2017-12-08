package com.nenu.info.Dao;

import com.nenu.info.common.entities.ACMPrize;
import org.apache.ibatis.annotations.Param;

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
    public void add(@Param("acmPrize") ACMPrize acmPrize);

}
