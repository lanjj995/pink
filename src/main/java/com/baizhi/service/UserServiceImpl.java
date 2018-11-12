package com.baizhi.service;

import com.baizhi.dao.UserDao;
import com.baizhi.entity.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;
import java.util.UUID;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;


    public void saveUser(User user) {
        user.setId(getUUID());

        String password = user.getPassword();
        String sv = getSV();
        String md5 = getMD5(sv + password);
        user.setPassword(md5);
        user.setSv(sv);

        userDao.save(user);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public User queryUserByUsername(String username,String password) {
        User user = userDao.query(username);
        if (user!=null){
            String sv = user.getSv();
            String MD5 = DigestUtils.md5Hex(sv + password);
            if (user.getPassword().equals(MD5)){
                return user;
            }
            else {
                return null;
            }
        }else {
            return null;
        }


    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public User checkUsername(String username) {
        User user = userDao.query(username);
        return user;
    }

    public String getUUID(){
        return UUID.randomUUID().toString().replace("-","");
    }

    public String getMD5(String psw) {
        String hex = DigestUtils.md5Hex(psw);
        return hex;
    }
    public String getSV(){
        String code = "0123456789abcdefghjklmnopqistxyz";
        String sv = "";
        Random random = new Random();
        for(int i=0;i<=5;i++){
            char c = code.charAt(random.nextInt(code.length()));
            sv+=c;
        }
        return sv;
    }

}
