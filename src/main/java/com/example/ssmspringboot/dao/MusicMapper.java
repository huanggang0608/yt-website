package com.example.ssmspringboot.dao;

import com.example.ssmspringboot.pojo.Music;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.List;
@Repository
public interface MusicMapper {

    List<Music> searchMusic(@Param(value = "type") String type);

    List<Music> findMusicByName(@Param(value ="musicName") String musicName);

    Music findMusicById(int musicId);


    void addPlayAmount(int musicId);
}
