package com.baizhi.service;

import com.baizhi.dao.DeptDao;
import com.baizhi.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptDao deptDao;
    @Autowired
    private EmpService empService;

    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Dept> queryAll() {
        List<Dept> depts = deptDao.query();
        return depts;
    }

    @Override
    public void saveDept(Dept dept) {
        deptDao.save(dept);
    }

    @Override
    public void deleteDept(Integer id) {
        deptDao.delete(id);
        empService.deleteEmpByDeptId(id);
    }

    @Override
    public void updateDept(Dept dept) {
        deptDao.update(dept);
    }


    public String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }
}
