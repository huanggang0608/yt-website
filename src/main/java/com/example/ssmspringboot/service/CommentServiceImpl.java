package com.example.ssmspringboot.service;

import com.example.ssmspringboot.dao.CommentMapper;
import com.example.ssmspringboot.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;
    @Override
    public List<Comment> findAll(int musicId) {
        return commentMapper.findAll(musicId);
    }

    @Override
    public List<Comment> findHot(int musicId) {
        return commentMapper.findHot(musicId);
    }

    @Override
    public void add(Comment comment) {
        commentMapper.add(comment);
    }

    @Override
    public Integer findState(int userId,int commentId) {
        return commentMapper.findState(userId,commentId);
    }

    @Override
    public void updateStateUp(int userId, int commentId) {
        commentMapper.updateStateUp(userId, commentId);
    }

    @Override
    public void updateStatedown(int userId, int commentId) {
        commentMapper.updateStatedown(userId, commentId);
    }

    @Override
    public void updateUser(int userId, String nickname,String image) {
        commentMapper.updateUser(userId,nickname,image);
    }

    @Override
    public void updateNumUp(int userId, int commentId) {
        commentMapper.updateNumUp(userId, commentId);
    }

    @Override
    public void updateNumDown(int userId, int commentId) {
        commentMapper.updateNumDown(userId, commentId);
    }

    @Override
    public void saveState(int userId, int commentId) {
        commentMapper.saveState(userId, commentId);
    }

    @Override
    public Integer selectMax() {
        return commentMapper.selectMax();
    }

    @Override
    public void delComment(int commentId) {
        commentMapper.delComment(commentId);
    }

    @Override
    public void delDianzan(int commentId) {
        commentMapper.delDianzan(commentId);
    }

}
