package com.nenu.info.service.category.impl;

import com.nenu.info.Dao.category.ThesisDao;
import com.nenu.info.common.dto.category.ThesisDto;
import com.nenu.info.common.entities.Thesis;
import com.nenu.info.service.category.ThesisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: software-liuwang
 * @time: 2017/12/15 20:12
 * @description : 论文service实现类
 */
@Service(value = "thesisService")
public class ThesisServiceImpl implements ThesisService {

    @Autowired
    private ThesisDao thesisDao;

    @Override
    public void add(Thesis thesis) throws Exception {
        thesisDao.add(thesis);
    }

    @Override
    public List<ThesisDto> listAll() throws Exception {
        return thesisDao.listAll();
    }
}
