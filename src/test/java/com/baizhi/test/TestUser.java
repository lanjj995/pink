package com.baizhi.test;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestUser extends BasicTest {

    @Autowired
    private UserDao userDao;
    @Autowired
    private UserService userService;

    @Test
    public void test1(){
        User user = userService.checkUsername("11111111");
        System.out.println(user);
    }


    @Test
    public void test2(){
        String s = DigestUtils.md5Hex("123456y1e8y9");
        System.out.println(s);
    }


}
