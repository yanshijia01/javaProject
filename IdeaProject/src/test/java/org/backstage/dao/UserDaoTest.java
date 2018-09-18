package org.backstage.dao;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import org.backstage.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(value = SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-dao.xml"})
public class UserDaoTest {

    @Autowired
    private UserDao userDao;

    @Test
    public void findByUsername() {
        String name = "admin";
        User user = userDao.findByUsername(name);
        ObjectMapper mapper = new ObjectMapper();
        try {
            String jsonList = mapper.writeValueAsString(user);
            System.out.println(jsonList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void registerByUsernameAndPassword() {
        String name = "zhangsan";
        String password = "123456";
        userDao.registerByUsernameAndPassword(name, password);
    }
}