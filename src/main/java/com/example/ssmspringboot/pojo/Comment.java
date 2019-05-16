package com.example.ssmspringboot.pojo;

/**
 * 评论
 */
public class Comment {
    /**
     * 主键
     */
    private Integer id;
    /**
     * 评论音乐ID
     */
    private Integer musicId;
    /**
     * 评论内容
     */
    private String content;
    /**
     * 评论用户ID
     */
    private Integer userId;
    /**
     * 评论用户头像路径
     */
    private String userImage;
    /**
     * 评论用户昵称
     */
    private String nickname;
    /**
     * 评论点赞数
     */
    private int likenum;

    /**
     * 评论创建时间
     */
    private String createtime;
    /**
     * 当前用户当前评评论点赞状态 0：未点赞；1：已点赞
     */
    private Integer state;

    public Integer getState() {
        return state;
    }

    public void setState(Integer userId, Integer state) {
        this.state = state;
    }

    public Integer getMusicId() {
        return musicId;
    }

    public void setMusicId(Integer musicId) {
        this.musicId = musicId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getLikenum() {
        return likenum;
    }

    public void setLikenum(int likenum) {
        this.likenum = likenum;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}
