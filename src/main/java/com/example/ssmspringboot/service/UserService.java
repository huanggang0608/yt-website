package com.example.ssmspringboot.service;

import com.example.ssmspringboot.pojo.User;

import java.util.List;

/**
 *
 */
public interface UserService {
    List<User> findAll();

    User findUser(User user);

    void addUser(User user);

    User findUserById(int userId);

    void updateUser(User user);

    int selectFolNum(int userId);

    int selectFansNum(int userId);

    List<User> selectFol(int userId);

    List<User> selectFans(int userId);

    /**
     * 喜欢歌单的人（排除自己）
     * @param userId
     * @param menuId
     * @return
     */
    List<User> selectCol(int userId, int menuId);

    /**
     *  查询是否关注
     * @param userId
     * @param otherId
     * @return
     */
    int findAttention(int userId, int otherId);

    /**
     * 添加关注
     * @param userId
     * @param otherId
     */
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
