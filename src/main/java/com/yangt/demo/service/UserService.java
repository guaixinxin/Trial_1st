package com.yangt.demo.service;

import com.yangt.demo.entity.User;
import com.yangt.demo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 注册用户
     * @return true 注册成功，false 用户名已存在
     */
    public boolean register(String username, String password) {
        if (userMapper.findByUsername(username) != null) {
            return false; // 用户名已存在
        }
        User user = new User(username, password);
        return userMapper.insert(user) > 0;
    }

    /**
     * 用户登录
     * @return 登录成功返回User对象，失败返回null
     */
    public User login(String username, String password) {
        return userMapper.findByUsernameAndPassword(username, password);
    }

    /**
     * 查询所有用户
     */
    public List<User> findAll() {
        return userMapper.findAll();
    }

    /**
     * 根据用户名删除用户
     * @return true 删除成功，false 删除失败
     */
    public boolean deleteByUsername(String username) {
        return userMapper.deleteByUsername(username) > 0;
    }
}
