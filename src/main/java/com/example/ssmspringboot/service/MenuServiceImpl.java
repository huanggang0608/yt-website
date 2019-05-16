package com.example.ssmspringboot.service;

import com.example.ssmspringboot.dao.MenuMapper;
import com.example.ssmspringboot.pojo.ColMenu;
import com.example.ssmspringboot.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public List<Menu> findById(int userId) {
        return menuMapper.findById(userId);
    }

    @Override
    public void addMenu(Menu menu) {

        menuMapper.addMenu(menu);
    }

    @Override
    public void delMenu(int menuId) {
        menuMapper.delMenu(menuId);
    }

    @Override
    public Menu findMenuById(int menuId) {
        return menuMapper.findMenuById(menuId);
    }

    @Override
    public void addMusic(int menuId, String musicIds) {
        menuMapper.addMusic(menuId,musicIds);
    }

    @Override
    public void delMusic(int menuId, String musicIds) {
        menuMapper.delMusic(menuId,musicIds);
    }

    @Override
    public void edit(Menu menu) {
        menuMapper.edit(menu);
    }


    @Override
    public Menu findMenu(int userId) {
        return menuMapper.findMenu(userId);
    }

    @Override
    public List<ColMenu> selectColMenu(int userId) {

        return menuMapper.selectColMenu(userId);
    }

    @Override
    public void addColMenu(ColMenu colMenu) {
        menuMapper.addColMenu(colMenu);
    }

    @Override
    public int selectColNum(int menuId) {
        return menuMapper.selectColNum(menuId);
    }

    @Override
    public void delColMenu(int userId, int menuId) {
        menuMapper.delColMenu(userId,menuId);
    }


}
