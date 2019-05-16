package com.example.ssmspringboot.service;

import com.example.ssmspringboot.pojo.Comment;

import java.util.List;

public interface CommentService {
    /**
     * 查找所有当前音乐评论信息
     *
     * @return
     */
    List<Comment> findAll(int musicId);

    /**
     * 查询当前音乐精彩评论信息(前10)
     * @param musicId
     * @return
     */
    List<Comment> findHot(int musicId);

    /**
     * 创建评论
     */
    void add(Comment comment);

    /**
     * 查询点赞状态
     *
     * @return
     */
    Integer findState(int userId, int commentId);

    /**
     * 更新状态为喜欢
     *
     * @param userId
     * @param commentId
     */
    void updateStateUp(int userId, int commentId);

    /**
     * 更新状态为不喜欢
     *
     * @param userId
     * @param commentId
     */
    void updateStatedown(int userId, int commentId);

    /**
     * 修改评论用户昵称
     * @param userId
     * @param nickname
     * @param image
     */
    void updateUser(int userId,String nickname,String image);

    void updateNumUp(int userId, int commentId);

    void updateNumDown(int userId, int commentId);

    void saveState(int userId, int commentId);

    Integer selectMax();

    void delComment(int commentId);

    void delDianzan(int commentId);

}
