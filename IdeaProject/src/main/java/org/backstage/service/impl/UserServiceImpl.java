package org.backstage.service.impl;

import org.backstage.dao.UserDao;
import org.backstage.entity.User;
import org.backstage.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User checkLogin(String username, String password) {
        User user = userDao.findByUsername(username);

        if(user!=null && user.getPassword().equals(password))
        {
            return user;
        }
        return null;
    }

    @Override
    public void Register(User user) {
        userDao.registerByUsernameAndPassword(user.getUsername(),user.getUsername());
    }
}
