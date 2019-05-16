package com.example.ssmspringboot.dao;

import com.example.ssmspringboot.pojo.ColMenu;
import com.example.ssmspringboot.pojo.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper {
   List<Menu> findById(int userId);
   void addMenu(Menu menu);
   void delMenu(int menuId);

    /**
     * @param menuId
     * @param musicIds
     */
    void addMusic(int menuId,String musicIds);

    /**
     * @param menuId
     * @param musicIds
     */
    void delMusic(int menuId,String musicIds);

    /**
     * 编辑歌单
     * @param menu
     */
    void edit(Menu menu);

   Menu findMenuById(int menuId);

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
