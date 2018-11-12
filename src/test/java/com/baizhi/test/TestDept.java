package com.baizhi.test;

import com.baizhi.dao.DeptDao;
import com.baizhi.entity.Dept;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class TestDept extends BasicTest {

    @Autowired
    private DeptDao deptDao;

    @Test
    public void test1(){
        List<Dept> query = deptDao.query();
        for (Dept dept : query) {
            System.out.println(dept);
        }
    }

    @Test
    public void test2() {
        Dept dept = new Dept();
        dept.setName("jdbc");
        deptDao.save(dept);
    }
}
