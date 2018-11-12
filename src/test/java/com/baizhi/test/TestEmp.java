package com.baizhi.test;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Dept;
import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import com.baizhi.vo.Data;
import com.baizhi.vo.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

public class TestEmp extends  BasicTest {

    @Autowired
    private EmpDao empDao;
    @Autowired
    private EmpService empService;

    @Test
    public void test1(){
        Integer total = empDao.querlAll();
        System.out.println(total);

    }

    @Test
    public void test2(){
        Dept dept = new Dept();
        dept.setId(1);
        Emp liukn = new Emp("6", "liukn", 1500.0, 44, new Date(), dept);
        empService.saveEmp(liukn);
    }

    @Test
    public void test3(){
        Data data = empService.queryEmpByPage(3);
        Page page = data.getPage();
        System.out.println(page);
    }

}
