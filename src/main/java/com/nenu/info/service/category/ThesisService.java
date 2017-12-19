package com.nenu.info.service.category;

import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.Thesis;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 20:12
 * @description : 论文service
 */
public interface ThesisService {

    /**
     * 添加论文信息
     * @param thesis
     * @throws Exception
     */
    public void add(Thesis thesis) throws Exception;

    /**
     * 查询所有论文信息
     * @return
     * @throws Exception
     */
    public List<ThesisDto> listAll() throws Exception;

}
