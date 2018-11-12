package com.baizhi.dao;

import com.baizhi.entity.Emp;
import com.baizhi.vo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpDao {
    Integer querlAll();

    void delete(@Param("id") String id);
    void update(Emp emp);
    void save(Emp emp);
    void deleteByDeptId(Integer id);
    List<Emp> queryByPage(@Param("page") Page page);
}
