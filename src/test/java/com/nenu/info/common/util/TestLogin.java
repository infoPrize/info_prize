package com.nenu.info.common.util;

import com.nenu.info.common.utils.LoginUtil;
import org.junit.Test;

/**
 * @author: software-liuwang
 * @time: 2018/4/20 9:13
 * @description:
 */
public class TestLogin {

    @Test
    public void testLogin() {
        String username = "2015010000";
        boolean userExist = false;

        try {
            userExist = LoginUtil.isUserExist(username);
            System.out.println("没有发生异常");
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println(userExist);

    }

}
