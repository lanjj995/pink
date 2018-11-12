package com.baizhi.service;

import com.baizhi.entity.Emp;
import com.baizhi.entity.User;
import com.baizhi.vo.Data;

public interface EmpService {
    Integer queryAllEmp();
    void deleteEmp(String id);
    void updateEmp(Emp emp);
    void saveEmp(Emp emp);
    void deleteEmpByDeptId(Integer id);
    Data queryEmpByPage(Integer pageNumber);

}
