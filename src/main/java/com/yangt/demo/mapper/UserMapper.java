package com.yangt.demo.mapper;

import com.yangt.demo.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    // 注册：插入用户
    int insert(User user);

    // 登录：根据用户名和密码查询
    User findByUsernameAndPassword(String username, String password);

    // 查询所有用户
    List<User> findAll();

    // 根据用户名删除
    int deleteByUsername(String username);

    // 根据用户名查询（判断是否已存在）
    User findByUsername(String username);
}
