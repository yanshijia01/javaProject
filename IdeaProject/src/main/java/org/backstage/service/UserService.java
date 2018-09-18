package org.backstage.service;

import org.backstage.entity.User;

public interface UserService {

    //检查用户登录
    User checkLogin(String username,String password);

    void Register(User user);
}
