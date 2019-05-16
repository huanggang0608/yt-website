package com.example.ssmspringboot.pojo;

public class Music {
    /**
     * 歌曲id
     */
    private Integer musicId;
    /**
     * 歌曲名
     */
    private String musicName;
    /**
     * 歌曲类型id
     */
    private Integer typeId;
    /**
     * 歌曲类型名
     */
    private String  type;
    /**
     * 歌手名
     */
    private String singerName;
    /**
     * 歌曲播放数量
     */
    private Integer playAmount;
    /**
     * 歌曲封面图片地址
     */
    private String musicImage;
    /**
     * 歌词路径名
     */
    private String pathName;
    /**
     * 歌曲专辑
     */
    private String album;
    /**
     * 歌曲播放时长
     */
    private String musicTime;
    /**
     * 歌曲状态：0 下架；1 可用
     */
    private int state;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPathName() {
        return pathName;
    }

    public void setPathName(String pathName) {
        this.pathName = pathName;
    }

    public String getAlbum() {
        return album;
    }

    public void setAlbum(String album) {
        this.album = album;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMusicTime() {
        return musicTime;
    }

    public void setMusicTime(String musicTime) {
        this.musicTime = musicTime;
    }

    public Integer getMusicId() {
        return musicId;
    }

    public void setMusicId(Integer musicId) {
        this.musicId = musicId;
    }

    public String getMusicName() {
        return musicName;
    }

    public void setMusicName(String musicName) {
        this.musicName = musicName;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public Integer getPlayAmount() {
        return playAmount;
    }

    public void setPlayAmount(Integer playAmount) {
        this.playAmount = playAmount;
    }

    public String getMusicImage() {
        return musicImage;
    }

    public void setMusicImage(String musicImage) {
        this.musicImage = musicImage;
    }
}
