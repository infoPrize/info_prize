package com.nenu.info.common.utils;

import com.wiscom.is.IdentityFactory;
import com.wiscom.is.IdentityManager;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

/**
 * @author: software-liuwang
 * @time: 2018/4/16 9:43
 * @description: 登录工具类
 */
public class LoginUtil {
    static IdentityManager manager = null;

    static {
        String path = LoginUtil.class.getResource("/").getPath();
        Properties p = new Properties();
        InputStream is = null;
        IdentityFactory factory = null;
        try {
            is = new FileInputStream(path + "client.properties");
            p.load(is);
            is.close();
            factory = IdentityFactory.createFactory(path + "client.properties");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(factory != null) {
            manager = factory.getIdentityManager();
        }
    }

    public static boolean isUserExist(String username) throws Exception{
        System.out.println("LoginUtil.isUserExist");
        return manager.isUserExist(username);
    }

    public static String getNameById(String username) throws Exception {
        return manager.getUserNameByID(username);
    }

    public static boolean checkPassword(String username, String password) throws Exception {
        return manager.checkPassword(username, password);
    }

    public static String getUserGroupById(String username) throws Exception {
        List groupList = manager.getUserGroup(username);
        String group = null;
        if (groupList != null) {
            group = groupList.get(0).toString();
        }
        return group;
    }
}
