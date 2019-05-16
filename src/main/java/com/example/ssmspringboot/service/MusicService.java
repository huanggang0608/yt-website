package com.example.ssmspringboot.service;

import com.example.ssmspringboot.pojo.Music;

import java.util.List;

public interface MusicService {
    /**
     * 根据分类查询音乐
     * @param type
     * @return
     */

    List<Music> searchMusic(String type);

    /**
     *  根据音乐名查询音乐
     * @param musicName
     * @return
     */

    List<Music> findMusicByName(String musicName);

    /**
     * @param musicId
     * @return
     */
    Music findMusicById(int musicId);

    /**
     * @param musicId
     */
    void addPlayAmount(int musicId);
}
