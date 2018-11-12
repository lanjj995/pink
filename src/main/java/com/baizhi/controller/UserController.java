package com.baizhi.controller;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/regist")
    public String regist(User user, HttpSession session,String code) {
        String validationCode = (String) session.getAttribute("validationCode");
        if (validationCode.equals(code)){

            userService.saveUser(user);

            return "redirect:/user/login.jsp";
        }else {
            return "redirect:/user/regist.jsp";
        }

    }

    @RequestMapping("/login")
    public String login(String username,String password,HttpSession session) {
        User user = userService.queryUserByUsername(username,password);
        if (user!=null) {
            session.setAttribute("user",user);
            return "redirect:/dept/showAll";
        }else {

            return "redirect:/user/login.jsp";
        }
    }

    @RequestMapping("/checkUsername")
    public @ResponseBody User checkUsername(String username){
        User user = userService.checkUsername(username);
        return user;
    }


    public String getMD5(String psw) {
        String hex = DigestUtils.md5Hex(psw);
        return hex;
    }
}
