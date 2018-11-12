package com.baizhi.vo;

import com.baizhi.entity.Emp;

import java.util.List;

public class Data {
    private List<Emp> emps;
    private Page page;

    @Override
    public String toString() {
        return "Data{" +
                "emps=" + emps +
                ", page=" + page +
                '}';
    }

    public Data() {
    }

    public Data(List<Emp> emps, Page page) {

        this.emps = emps;
        this.page = page;
    }

    public List<Emp> getEmps() {

        return emps;
    }

    public void setEmps(List<Emp> emps) {
        this.emps = emps;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }
}
