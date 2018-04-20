package com.nenu.info.common.realm;

import com.nenu.info.common.utils.LoginUtil;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 * @author: software-liuwang
 * @time: 2018/4/19 20:28
 * @description: shiro
 */
public class UserRealm extends AuthorizingRealm {

    /**
     * 授权
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("授权？");
        return null;
    }

    /**
     * 认证
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

        System.out.println("认证");

        String username = (String) authenticationToken.getPrincipal();

        String password = "";
        boolean isNum = username.matches("[0-9]+");

        SimpleAuthenticationInfo authenticationInfo = null;

        try {
            if (isNum) {
                //学生登录
                if (LoginUtil.isUserExist(username)) {
                    authenticationInfo = new SimpleAuthenticationInfo(
                            username, //用户名
                            password, //密码
                            this.getName()  //realm name
                    );
                } else {
                    throw new UnknownAccountException();        //无该账号
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return authenticationInfo;
    }


}
