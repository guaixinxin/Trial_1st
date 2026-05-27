-- 创建数据库
CREATE DATABASE IF NOT EXISTS user_db DEFAULT CHARACTER SET utf8mb4;

USE user_db;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL       COMMENT '密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入初始用户（姓名：杨婷，学号：2315302314）
-- 注意：执行时请确保MySQL客户端使用utf8mb4编码
-- mysql -u root --default-character-set=utf8mb4 user_db < init.sql
INSERT INTO users(username, password) VALUES('杨婷', '2315302314');
