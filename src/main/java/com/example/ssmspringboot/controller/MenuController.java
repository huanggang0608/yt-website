package com.example.ssmspringboot.controller;

import ch.qos.logback.core.util.FileUtil;
import com.example.ssmspringboot.pojo.*;
import com.example.ssmspringboot.service.MenuService;
import com.example.ssmspringboot.service.MenuServiceImpl;
import com.example.ssmspringboot.service.MusicService;
import com.example.ssmspringboot.service.UserService;
import com.example.ssmspringboot.utils.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@Transactional
public class MenuController {
    private  static final Logger logger=LoggerFactory.getLogger(MenuServiceImpl.class);
    @Autowired
    private MenuService menuService;
    @Autowired
    private UserService userService;

    @Autowired
    private MusicService musicService;

    @RequestMapping("/addMenu")
    @ResponseBody
    public Result addMenu(HttpServletRequest request){
        Result data=new Result();
        Menu menu=new Menu();
        String menuName=request.getParameter("menuName");
        int userId= (int) request.getAttribute("userId");
        String musicId=request.getParameter("musicId");
        menu.setMusicAmount(0);
        menu.setMusicIds(null);
        if(musicId!=null){
            menu.setMusicAmount(1);
            menu.setMusicIds(musicId+",");
        }

       SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");
       String date =sdf.format(new Date());
       menu.setCreatetime(date);
       menu.setUserId(userId);
       menu.setMenuName(menuName);
       menu.setMenuImage("default.jpg");

        //查询是否有重复
        data.setStatus(200);
        menuService.addMenu(menu);
        return data;
    }

    @RequestMapping("/delMenu")
    public String delMenu(HttpServletRequest request, RedirectAttributes attr){
        int menuId=Integer.parseInt(request.getParameter("menuId"));
        int userId= (int) request.getAttribute("userId");

        menuService.delMenu(menuId);
        ///重定向添加参数 会直接将参数拼接在URL后，获取方式与平常一样
        attr.addAttribute("userId",userId);

        return "redirect:/myMusic";

    }
    @RequestMapping("/delColMenu")
    public String delColMenu(HttpServletRequest request, RedirectAttributes attr){
        int menuId=Integer.parseInt(request.getParameter("menuId"));
        int userId= (int) request.getAttribute("userId");

        menuService.delColMenu(userId,menuId);
        ///重定向添加参数 会直接将参数拼接在URL后，获取方式与平常一样
        attr.addAttribute("userId",userId);

        return "redirect:/myMusic";

    }
    @RequestMapping("/addMusic")
    @ResponseBody
    public Result addMusic(@RequestParam int musicId,@RequestParam int menuId){
        Result result=new Result();
        Menu menu=menuService.findMenuById(menuId);

        String musicIds=menu.getMusicIds()==null?"":menu.getMusicIds();
      //判断歌单是否已包含该歌曲
        if(musicIds.length()>=1){
        String[] musics=musicIds.split(",");
        for (String music : musics) {
            if(Integer.parseInt(music)==musicId){
                result.setStatus(201);
                return result;
            }
        }
        }
        musicIds+=musicId+",";
        menuService.addMusic(menuId,musicIds);

        result.setStatus(200);

        return result;

    }
    @RequestMapping("/delMusic")
    public String delMusic(@RequestParam  String musicId,@RequestParam int menuId){
        //logger.info("删除的音乐id{}",musicId);
        Menu menu=menuService.findMenuById(menuId);

        String[] ms=menu.getMusicIds().split(",");
        String id =musicId;
        String musicIds="";
            for (int i = 0; i < ms.length; i++) {
                if (ms[i].equals(id)) {
                    continue;
                }
                musicIds += ms[i] + ",";

        }
        musicIds=musicIds==""?null:musicIds;
        menuService.delMusic(menuId,musicIds);
        return "forward:myMusic2?menuId="+menuId;

    }

    /*@RequestMapping("/love")
    @ResponseBody
    public Boolean  love(@RequestParam int flag,@RequestParam int musicId,@RequestParam int userId){
        System.out.println("----------------------");

        String m =menuService.findMenu(userId).getMusicIds();
        String[] ms=m==null?null:m.split(",");
        int amount=ms==null?0:ms.length;
        String id =musicId+"";
        String musicIds=null;
        System.out.println(flag);
        //修改musicIds
        if(flag==1){
            for(int i=0;i<ms.length;i++){
                if(ms[i].equals(id)){
                    continue;
                }
                musicIds=ms[i]+",";
            }
            menuService.updateMusicAmount(userId,"我喜欢的音乐",amount-1);
            logger.info("取消喜欢");
        }else{
             musicIds=m+musicId+",";
            menuService.updateMusicAmount(userId,"我喜欢的音乐",amount+1);
            logger.info("喜欢");
        }

        menuService.updateMenu(userId,musicIds,"我喜欢的音乐");

        return true;
    }*/

    @RequestMapping("/myMusic")
    public String toMyMusic(HttpServletRequest request,Model model){
        int userId= (int) request.getAttribute("userId");
        //获取歌单列表
        List<Menu> menuList=menuService.findById(userId);
        //获取我喜欢的音乐歌曲列表
        Menu menu=menuService.findMenu(userId);
        List<Music> musicList=null;
        if(menu.getMusicIds()!=null&&menu.getMusicIds().length()>=1){
            String[] musicIds=menu.getMusicIds().split(",");
            musicList=getMusicList(musicIds);
        }

        User user=userService.findUserById(userId);
        //PageBean pageBean=new PageBean(1,musicList.size());
        //获取收藏的歌单列表
        List<ColMenu> colMenuList= menuService.selectColMenu(userId);
        String nickname=null;
        if(colMenuList!=null&&colMenuList.size()>0) {
            for (ColMenu col : colMenuList) {
                nickname = userService.findUserById(col.getMenu().getUserId()).getNickname();
                col.setOwnerNickname(nickname);
            }
        }
        model.addAttribute("colMenuList",colMenuList);
        model.addAttribute("menuList",menuList);
        model.addAttribute("user",user) ;
        model.addAttribute("menu",menu) ;
        model.addAttribute("musicList",musicList);
       // model.addAttribute("pageBean",pageBean);
        return "myMusic";
    }
    @RequestMapping("/myMusic2")
    public String toMyMusic2(int menuId,Model model,HttpServletRequest request){
        int userId= (int) request.getAttribute("userId");
        //获取歌单列表
        List<Menu> menuList=menuService.findById(userId);
        //获取音乐歌曲列表
        Menu menu=menuService.findMenuById(menuId);
        List<Music> musicList=new ArrayList<Music>();
        if(menu.getMusicIds()!=null&&menu.getMusicIds().length()>=1){
            String[] musicIds=menu.getMusicIds().split(",");
            musicList =getMusicList(musicIds);
        }
        User user=userService.findUserById(userId);
        PageBean pageBean=new PageBean(1,musicList.size());

        //获取收藏的歌单列表
        List<ColMenu> colMenuList= menuService.selectColMenu(userId);
        String nickname=null;
        for (ColMenu col : colMenuList) {
            nickname=userService.findUserById(col.getMenu().getUserId()).getNickname();
            col.setOwnerNickname(nickname);
        }
        model.addAttribute("colMenuList",colMenuList);
        model.addAttribute("menuList",menuList);
        model.addAttribute("user",user) ;
        model.addAttribute("menu",menu) ;
        model.addAttribute("musicList",musicList);
        model.addAttribute("pageBean",pageBean);
        return "myMusic";
    }
    @RequestMapping("/myMusic/edit")
    public String edit(int menuId,HttpServletRequest request,Model model){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        //获取歌单列表
        List<Menu> menuList=menuService.findById(userId);

        Menu menu=menuService.findMenuById(menuId);
        model.addAttribute("user",user);
        model.addAttribute("menu",menu);
        model.addAttribute("menuList",menuList);
        return "myMusicEdit";
    }

    /**
     * 保存编辑歌单
     * @param
     * @return
     */
    @RequestMapping("/myMusic/edit/save")
    public String saveEdit(@RequestParam("file")MultipartFile file,HttpServletRequest request){
       int menuId=Integer.parseInt(request.getParameter("menuId"));
        Menu menu=menuService.findMenuById(menuId);
        String menuImage=null;
        if(file!=null){
            //要上传的目标文件存放路径  --暂时存放在本地环境
            //String localPath = "C:/Users/huangg/Desktop/ytResources/music/images";
            String localPath = "C:/Users/apple/Desktop/ytResources/music/images";
            menuImage=""+menuId+"-"+file.getOriginalFilename();
            if(FileUtils.upload(file,localPath,menuImage)){
                logger.info("保存成功，图像文件名：{}",menuImage);

            }
        }

        menu.setMenuImage(menuImage);
        menu.setPresentation(request.getParameter("presentation"));
        menu.setMenuName(request.getParameter("menuName"));
        menuService.edit(menu);


        return "redirect:/myMusic2?menuId="+menuId;
    }

    /**
     * 歌单页面
     * @param request
     * @param menuId
     * @param otherId
     * @param model
     * @return
     */
    @RequestMapping("/otherMusic")
    public String toOtherMusic(HttpServletRequest request,int menuId,int otherId,Model model){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        User other=userService.findUserById(otherId);
        //获取当前用户歌单
        List<Menu> menuList=menuService.findById(userId);
        model.addAttribute("menuList",menuList);
        //获取音乐歌曲列表
        Menu menu=menuService.findMenuById(menuId);
        List<Music> musicList=new ArrayList<Music>();
        if(menu.getMusicIds()!=null&&menu.getMusicIds().length()>=1){
            String[] musicIds=menu.getMusicIds().split(",");
            musicList =getMusicList(musicIds);
        }
        //喜欢歌单的人
        List<User> userList=userService.selectCol(userId,menuId);
        //判断是否收藏该歌单
        int flag=userService.findCol(userId,menuId);
        //歌单收藏数
        int colNum=menuService.selectColNum(menuId);
        model.addAttribute("colNum",colNum);
        model.addAttribute("flag",flag);
        model.addAttribute("userList",userList);
        model.addAttribute("user",user);
        model.addAttribute("other",other);
        model.addAttribute("menu",menu);
        model.addAttribute("musicList",musicList);

        return "otherMusic";
    }
    @RequestMapping("/addColMenu")
    @ResponseBody
    public Result addColMenu(HttpServletRequest request,int menuId,int otherId){
        int userId= (int) request.getAttribute("userId");
        Menu menu=menuService.findMenuById(menuId);
        menu.setUserId(otherId);
        ColMenu colMenu=new ColMenu();
        colMenu.setMenu(menu);
        colMenu.setUserId(userId);
        menuService.addColMenu(colMenu);
        Result result=new Result();
        result.setStatus(200);
        return result;
    }
    /**
     * 获取歌单中的歌曲
     * @param musicIds
     * @return
     */
    public List<Music> getMusicList(String[] musicIds){
        List<Music> musicList =new ArrayList<Music>();
        for(String musicId:musicIds){
            int id = Integer.parseInt(musicId);
            Music music=musicService.findMusicById(id);
            musicList.add(music);
        }
        return musicList;
    }
}
