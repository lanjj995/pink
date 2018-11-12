package com.baizhi.service;

import com.baizhi.entity.User;

public interface UserService {
    void saveUser(User user);
    User queryUserByUsername(String username,String password);
    User checkUsername(String username);
}
