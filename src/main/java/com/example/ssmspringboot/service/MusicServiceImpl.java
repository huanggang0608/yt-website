package com.example.ssmspringboot.service;

import com.example.ssmspringboot.dao.MusicMapper;
import com.example.ssmspringboot.pojo.Music;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MusicServiceImpl implements MusicService{
    @Autowired
    private MusicMapper musicMapper;
    @Override
    public List<Music> searchMusic(String type) {
        return musicMapper.searchMusic(type);
    }

    @Override
    public List<Music> findMusicByName(String musicName) {

        return musicMapper.findMusicByName(musicName);
    }

    @Override
    public Music findMusicById(int musicId) {
        return musicMapper.findMusicById(musicId);
    }

    @Override
    public void addPlayAmount(int musicId) {
        musicMapper.addPlayAmount(musicId);
    }
}
