package org.backstage.dao;

import org.apache.ibatis.annotations.Param;
import org.backstage.entity.User;

public interface UserDao {

    /**
     * 查找用户名和密码
     * @param username
     * @return
     */
    User findByUsername(@Param("username") String username);

    void registerByUsernameAndPassword(@Param("username")String username,
                                       @Param("password") String password);
}
