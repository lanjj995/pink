package com.baizhi.vo;

public class Page {
    private Integer pageNumber;
    private Integer pageSize;
    private Integer start;
    private Integer end;
    private Integer pageTotal;
    private Integer total;

    @Override
    public String toString() {
        return "Page{" +
                "pageNumber=" + pageNumber +
                ", pageSize=" + pageSize +
                ", start=" + start +
                ", end=" + end +
                ", pageTotal=" + pageTotal +
                ", total=" + total +
                '}';
    }

    public Page() {
        this.pageSize = 4;
    }

    public Integer getPageNumber() {

        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
        this.start=(pageNumber-1)*pageSize;
        this.end=pageNumber*pageSize;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getEnd() {
        return end;
    }

    public void setEnd(Integer end) {
        this.end = end;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
        this.pageTotal = (total%pageSize==0)?total/pageSize:total/pageSize+1;
    }
}
