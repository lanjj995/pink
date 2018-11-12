package com.baizhi.dao;

import com.baizhi.entity.Dept;

import java.util.List;

public interface DeptDao {
    List<Dept> query();
    void save(Dept dept);
    void delete(Integer id);
    void update(Dept dept);
}
