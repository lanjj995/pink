package com.baizhi.dao;

import com.baizhi.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {
    void save(User user);
    User query(@Param("username")String username);
}
