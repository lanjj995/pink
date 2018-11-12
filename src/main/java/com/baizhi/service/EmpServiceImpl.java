package com.baizhi.service;

import com.baizhi.dao.EmpDao;
import com.baizhi.entity.Emp;
import com.baizhi.entity.User;
import com.baizhi.vo.Data;
import com.baizhi.vo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpDao empDao;


    @Transactional(propagation = Propagation.SUPPORTS)
    public Integer queryAllEmp() {
        Integer total = empDao.querlAll();
        return total;
    }

    @Override
    public void deleteEmp(String id) {
        empDao.delete(id);
    }


    @Override
    public void updateEmp(Emp emp) {
        empDao.update(emp);
    }

    @Override
    public void saveEmp(Emp emp) {
        emp.setId(getUUID());
        empDao.save(emp);
    }

    @Override
    public void deleteEmpByDeptId(Integer id) {
        empDao.deleteByDeptId(id);
    }

    @Override
    public Data queryEmpByPage(Integer pageNumber) {
        Integer integer = queryAllEmp();
        Page page = new Page();
        page.setTotal(integer);
        if (pageNumber == null){
            pageNumber=1;
        }
        page.setPageNumber(pageNumber);
        List<Emp> emps = empDao.queryByPage(page);
        Data data = new Data(emps,page);
        return data;
    }


    public String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }
}
