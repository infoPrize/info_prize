package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 12:07
 * @description : 论文Dao接口
 */
public interface PatentDao {

    /**
     * 新增专利信息
     */
    public void add(@Param("patent")Patent patent) throws Exception;

    /**
     * 根据条件查询专利信息的数量
     */
    public Integer countByCondition(Map<String, Object> params) throws Exception;

    /**
     * 查询所有专利信息
     */
    public List<PatentDto> listAll() throws Exception;

    /**
     * 根据条件查询专利信息
     */
    public List<PatentDto> listByCondition(Map<String, Object> params) throws Exception;

    /**
     * 根据id查询专利信息
     */
    public PatentDto selectById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id对专利信息进行假删操作
     */
    public void falseDeleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除专利信息
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

}
