package com.baizhi.entity;

public class User {
    private String id;
    private String username;
    private String realname;
    private String password;
    private String sex;
    private String sv;

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", realname='" + realname + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", sv='" + sv + '\'' +
                '}';
    }

    public User() {
    }

    public User(String id, String username, String realname, String password, String sex, String sv) {

        this.id = id;
        this.username = username;
        this.realname = realname;
        this.password = password;
        this.sex = sex;
        this.sv = sv;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getSv() {
        return sv;
    }

    public void setSv(String sv) {
        this.sv = sv;
    }
}
