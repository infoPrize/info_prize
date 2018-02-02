package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.InternetPlusDto;
import com.nenu.info.common.entities.category.InternetPlus;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2018/1/27 18:51
 * @description: 互联网+Dao接口
 */
public interface InternetPlusDao {

    public void add(@Param("internetPlus") InternetPlus internetPlus) throws Exception;

    public List<InternetPlusDto> listByCondition(Map<String, Object> params) throws Exception;

}
