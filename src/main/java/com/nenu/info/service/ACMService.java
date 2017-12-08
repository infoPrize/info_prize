package com.nenu.info.service;

import com.nenu.info.common.entities.ACMPrize;

/**
 * @author: software-liuwang
 * @time: 2017/12/8 18:25
 * @description :
 */
public interface ACMService {

    /**
     * 添加ACM获奖信息
     * @param acmPrize
     */
    public void add(ACMPrize acmPrize);

}
