package com.nenu.info.Dao.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 12:07
 * @description : 论文Dao接口
 */
public interface PatentDao {

    /**
     * 新增专利信息
     * @param patent
     * @throws Exception
     */
    public void add(@Param("patent")Patent patent) throws Exception;

    /**
     * 查询所有专利信息
     * @return
     * @throws Exception
     */
    public List<PatentDto> listAll() throws Exception;

}
