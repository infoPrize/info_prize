package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.category.Thesis;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 18:28
 * @description : 论文Dao
 */
public interface ThesisDao {

    /**
     * 添加论文信息
     * @param thesis
     * @throws Exception
     */
    public void add(@Param("thesis") Thesis thesis) throws Exception;

    /**
     * 查询所有论文信息
     * @return
     * @throws Exception
     */
    public List<ThesisDto> listAll() throws Exception;

    /**
     * 根据条件查询论文信息
     * @param params
     * @return
     * @throws Exception
     */
    public List<ThesisDto> listByConditions(Map<String, Object> params) throws Exception;

}
