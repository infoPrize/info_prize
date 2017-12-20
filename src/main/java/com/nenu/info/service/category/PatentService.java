package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.PatentDto;
import com.nenu.info.common.entities.category.Patent;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/20 12:04
 * @description : 专利service接口
 */
public interface PatentService {

    /**
     * 新增专利信息
     * @param patent
     * @throws Exception
     */
    public void add(Patent patent) throws Exception;

    /**
     * 查询所有专利信息
     * @return
     * @throws Exception
     */
    public List<PatentDto> listAll() throws Exception;

}
