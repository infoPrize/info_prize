package com.nenu.info.service.impl;

import com.nenu.info.Dao.ACMDao;
import com.nenu.info.common.entities.ACMPrize;
import com.nenu.info.service.ACMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:26
 * @description :
 */

@Service(value = "acmService")
public class ACMServiceImpl implements ACMService {

    @Autowired
    private ACMDao acmDao;

    @Override
    public void add(ACMPrize acmPrize) {
        acmDao.add(acmPrize);
    }
}
