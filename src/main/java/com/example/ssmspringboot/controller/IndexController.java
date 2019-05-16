package com.example.ssmspringboot.controller;

import com.example.ssmspringboot.pojo.*;
import com.example.ssmspringboot.service.MenuService;
import com.example.ssmspringboot.service.MusicService;
import com.example.ssmspringboot.service.UserService;
import com.example.ssmspringboot.utils.CookieUtils;
import javafx.beans.DefaultProperty;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class IndexController {
    private static final Logger logger= LoggerFactory.getLogger(IndexController.class);

    @Autowired
    private MusicService musicService;
    @Autowired
    UserService userService;
    @Autowired
    private MenuService menuService;


    @RequestMapping(value={"/main","/"})
    public String toMain(HttpServletRequest request,Model model){
       int userId= (int) request.getAttribute("userId");

        if(userId!=0){
            //获取用户数据
            User user=userService.findUserById(userId);
            model.addAttribute("user",user);
        }


               return "main";
    }

    @RequestMapping("index")
    public String toIndex(Model model){
        //获取热门音乐
        List<Music> hotMusicList=musicService.searchMusic("全部");
        model.addAttribute("hotMusicList",hotMusicList);
        return "index";
    }


    @RequestMapping("/loginout")
    public String tologin(HttpServletRequest request, HttpServletResponse response){
        CookieUtils.deleteCookie(request,response,"YT_TICKET");
        logger.info("退出成功~~");
        return "redirect:main";
    }
    @RequestMapping("/discover")
    public String toDiscover(HttpServletRequest request,Model model,String type){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        model.addAttribute("user",user);
        model.addAttribute("type",type);

        List<Music> musicList=musicService.searchMusic(type);
        model.addAttribute("musicList",musicList);

        return "discover";
    }

    /**
     * 个人主页
     * @param request
     * @param model
     * @param otherId
     * @return
     */
    @RequestMapping("/home")
    public String toHome(HttpServletRequest request,Model model,@RequestParam(value = "otherId",defaultValue = "0") int otherId){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        User other=null;
        if(otherId==0)
        {  other=user;}
        else{
             other=userService.findUserById(otherId);
             int state=userService.findAttention(userId,otherId);
             model.addAttribute("state",state);
        }
        List<Menu> menuList=menuService.findById(other.getId());
        List<ColMenu> colMenuList=menuService.selectColMenu(other.getId());

        model.addAttribute("user",user);
        model.addAttribute("other",other);
        model.addAttribute("menuList",menuList);
        model.addAttribute("colMenuList",colMenuList);
        return "home";
    }



    @RequestMapping("/search")
    public String toSearch(String searchName,HttpServletRequest request,Model model){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        model.addAttribute("user",user);
        List<Music> musicList=musicService.findMusicByName(searchName);
        List<Menu> menuList=menuService.findById(userId);
        model.addAttribute("musicList",musicList);
        model.addAttribute("searchName",searchName);
        model.addAttribute("menuList",menuList);

        return "search";
    }



    @RequestMapping("/findMusic")
    public String findMusic(@RequestParam String musicname,Model model,HttpServletRequest request){

        List<Music> musicList=musicService.findMusicByName(musicname);
        model.addAttribute("musicList",musicList);
        int userId= (int) request.getAttribute("userId");
            //获取用户数据
            List<Menu> menuList=menuService.findById(userId);
            model.addAttribute("menuList",menuList);
            User user=userService.findUserById(userId);
            model.addAttribute("user",user);

        return "searchResult";
    }



}
