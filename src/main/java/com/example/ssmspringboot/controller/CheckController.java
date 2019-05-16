package com.example.ssmspringboot.controller;

import com.example.ssmspringboot.pojo.Menu;
import com.example.ssmspringboot.pojo.Result;
import com.example.ssmspringboot.pojo.User;
import com.example.ssmspringboot.service.MenuService;
import com.example.ssmspringboot.service.UserService;
import com.example.ssmspringboot.utils.CookieUtils;
import com.example.ssmspringboot.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;


@Controller
public class CheckController {
    private static final Logger logger=LoggerFactory.getLogger(CheckController.class);

    private Result data=new Result();

    @Autowired
    private UserService userService;
    @Autowired
    private MenuService menuService;

    @RequestMapping("/loginCheck")
    @ResponseBody
    public Result loginCheck(HttpServletRequest request, HttpServletResponse response){
       User user=userService.findUser(userCheck(request));
        if(user!=null)
        {
            CookieUtils.setCookie(request,response,"YT_TICKET",user.getId()+"");
            data.setStatus(200);
            logger.info("登录成功，用户信息：{}",user);
          }
        else{
            data.setStatus(201);
            logger.info("登录失败，数据库不存在该用户");
        }
            return data;
    }
    @RequestMapping("/registCheck")
    @ResponseBody
    public Result registCheck(HttpServletRequest request){
        User u1=userCheck(request);
        User user=userService.findUser(u1);
        if("".equals(user)||user==null){
            //设置初始头像
            u1.setImage("images/head/user.jpg");
            //设置初始昵称
            u1.setNickname(u1.getUsername());
            userService.addUser(u1);
            //添加我喜欢的音乐歌单
            Menu menu=new Menu();
            menu.setMenuImage("like.jpg");
            menu.setMenuName("我喜欢的音乐");
            menu.setCreatetime(DateUtils.getDate(new Date()));
            menu.setUserId(userService.findUser(u1).getId());
            menuService.addMenu(menu);
            data.setStatus(200);
            logger.info("注册成功，用户信息：{}",u1);
        }else{
            data.setStatus(201);
            logger.info("注册失败，数据库已存在该用户");
        }

        return data;
    }

    public User userCheck(HttpServletRequest request){
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        User u1=new User();
        u1.setUsername(username);
        u1.setPassword(password);
        return u1;
    }
}
