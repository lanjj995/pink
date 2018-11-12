package com.baizhi.controller;

import com.baizhi.entity.Dept;
import com.baizhi.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/showAll")
    public String showAll(HttpSession session) {
        List<Dept> depts = deptService.queryAll();
        session.setAttribute("depts",depts);

        return "/dept/deptlist";
    }

    @RequestMapping("/add")
    public String addDept(Dept dept){
        deptService.saveDept(dept);

        return "redirect:/dept/showAll";
    }

    @RequestMapping("/delete")
    public String delete(Integer id) {
        deptService.deleteDept(id);

        return "redirect:/dept/showAll";
    }

    @RequestMapping("/update")
    public String update(Dept dept) {
        deptService.updateDept(dept);

        return "redirect:/dept/showAll";
    }

}
