package com.example.ssmspringboot.dao;

import com.example.ssmspringboot.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    /**
     * find all users from user_login of table
     */
    List<User> findAll();

    User findUser(User user);

    void addUser(User user);

    void updateUser(User user);

    User findUserById(int userId);

    int selectFolNum(int userId);

    int selectFansNum(int userId);

    List<User> selectFol(int userId);

    List<User> selectFans(int userId);

    List<User> selectCol(int userId, int menuId);

    int findAttention(int userId, int otherId);

    void addAttention(int userId,int otherId);

    /**
     * 取消关注
     * @param userId
     * @param otherId
     */
    void delAttention(int userId,int otherId);

    void addFolNum(int userId);
    void delFolNum(int userId);
    void addFansNum(int otherId);
    void delFansNum(int otherId);
    int findCol(int userId,int menuId);
}
