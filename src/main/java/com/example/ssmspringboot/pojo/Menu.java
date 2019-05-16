package com.example.ssmspringboot.pojo;

public class Menu {
    /**
     * 歌单id
     */
    private int menuId;
    /**
     * 歌单名
     */
    private String menuName;
    /**
     * 用户id
     */
    private Integer userId;
    /**
     * 歌单内歌曲id
     */
    private String musicIds;
    /**
     * 歌单内歌曲数量
     */
    private int musicAmount;
    /**
     * 歌单封面
     */
    private String menuImage;
    /**
     * 歌单创建时间
     */
    private String createtime;

    /**
     * 歌单介绍
     */
    private String presentation;

    public String getPresentation() {
        return presentation;
    }

    public void setPresentation(String presentation) {
        this.presentation = presentation;
    }

    public String getMenuImage() {
        return menuImage;
    }

    public void setMenuImage(String menuImage) {
        this.menuImage = menuImage;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getMusicAmount() {
        return musicAmount;
    }

    public void setMusicAmount(int musicAmount) {
        this.musicAmount = musicAmount;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getMusicIds() {
        return musicIds;
    }

    public void setMusicIds(String musicIds) {
        this.musicIds = musicIds;
    }

}
