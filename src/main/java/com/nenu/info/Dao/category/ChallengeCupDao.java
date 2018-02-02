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

    public void add(@Param("challengeCup")ChallengeCup challengeCup) throws Exception;

    public List<ChallengeCupDto> listByCondition(Map<String, Object> params) throws Exception;

}
