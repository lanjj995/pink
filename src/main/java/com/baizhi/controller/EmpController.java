package com.baizhi.controller;

import com.baizhi.entity.Emp;
import com.baizhi.service.EmpService;
import com.baizhi.vo.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/emp")
public class EmpController {

    @Autowired
    private EmpService empService;

    @RequestMapping("/showEmp")
    public String showEmp(Integer pageNumber,HttpServletRequest request){
        Data data = empService.queryEmpByPage(pageNumber);
        request.setAttribute("data",data);
        return "/emp/emplist";

    }
    @RequestMapping("/delete")
    public String delete(String id) {
        empService.deleteEmp(id);
        return "redirect:/emp/showEmp";
    }
    @RequestMapping("/update")
    public String update(Emp emp) {
        empService.updateEmp(emp);

        return "redirect:/emp/showEmp";
    }
    @RequestMapping("/add")
    public String add(Emp emp){
        empService.saveEmp(emp);

        return "redirect:/emp/showEmp";
    }
}
