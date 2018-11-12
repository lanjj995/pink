package com.baizhi.service;

import com.baizhi.entity.Dept;

import java.util.List;

public interface DeptService {
    List<Dept> queryAll();
    void saveDept(Dept dept);
    void deleteDept(Integer id);
    void updateDept(Dept dept);
}
