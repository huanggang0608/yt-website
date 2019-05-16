package com.example.ssmspringboot.service;

import com.example.ssmspringboot.dao.CommentMapper;
import com.example.ssmspringboot.dao.UserMapper;
import com.example.ssmspringboot.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findAll() {
        List<User> list=userMapper.findAll();

        return list;
    }

    @Override
    public User findUser(User user) {
        User u=userMapper.findUser(user);

        return u;
    }

    @Override
    public void addUser(User user) {

        userMapper.addUser(user);
    }

    @Override
    public User findUserById(int userId) {
        return userMapper.findUserById(userId);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public int selectFolNum(int userId) {
        return userMapper.selectFolNum(userId);
    }

    @Override
    public int selectFansNum(int userId) {
        return userMapper.selectFansNum(userId);
    }

    @Override
    public List<User> selectFol(int userId) {
        return userMapper.selectFol(userId);
    }

    @Override
    public List<User> selectFans(int userId) {
        return userMapper.selectFans(userId);
    }

    @Override
    public List<User> selectCol(int userId, int menuId) {

        return userMapper.selectCol(userId,menuId);
    }

    @Override
    public int findAttention(int userId, int otherId) {
        return userMapper.findAttention(userId,otherId);
    }

    @Override
    public void addAttention(int userId, int otherId) {
        userMapper.addAttention(userId,otherId);
    }

    @Override
    public void delAttention(int userId, int otherId) {
        userMapper.delAttention(userId,otherId);
    }

    @Override
    public void addFolNum(int userId) {
        userMapper.addFolNum(userId);
    }

    @Override
    public void delFolNum(int userId) {
        userMapper.delFolNum(userId);
    }

    @Override
    public void addFansNum(int otherId) {
        userMapper.addFansNum(otherId);
    }

    @Override
    public void delFansNum(int otherId) {
        userMapper.delFansNum(otherId);
    }

    @Override
    public int findCol(int userId, int menuId) {
        return userMapper.findCol(userId,menuId);
    }
}
