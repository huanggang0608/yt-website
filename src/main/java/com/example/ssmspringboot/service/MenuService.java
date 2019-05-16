package com.example.ssmspringboot.service;

import com.example.ssmspringboot.pojo.ColMenu;
import com.example.ssmspringboot.pojo.Menu;

import java.util.List;

public interface MenuService {
    List<Menu> findById(int userId);
    void addMenu(Menu menu);
    void delMenu(int menuId);

    /**
     * 根据歌单id 查询歌单
     * @param menuId
     * @return
     */

    Menu findMenuById(int menuId);


    /**
     * 添加歌曲
     * @param menuId
     * @param musicIds
     */
    void addMusic(int menuId,String musicIds);

    /**
     * 删除歌曲
     * @param menuId
     * @param musicIds
     */
    void delMusic(int menuId,String musicIds);

    void edit(Menu menu);

    Menu findMenu(int userId);

    /**
     * 收藏的歌单
     * @param userId
     * @return
     */
    List<ColMenu> selectColMenu(int userId);


    /**
     * 收藏歌单
     * @param colMenu
     */
    void addColMenu(ColMenu colMenu);

    /**歌单收藏数
     * @param menuId
     * @return
     */
    int selectColNum(int menuId);

    /**
     * 删除收藏的歌单
     * @param userId
     * @param menuId
     */
    void delColMenu(int userId,int menuId);

}
