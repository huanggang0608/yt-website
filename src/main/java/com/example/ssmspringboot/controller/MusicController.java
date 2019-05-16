package com.example.ssmspringboot.controller;


import com.example.ssmspringboot.pojo.*;
import com.example.ssmspringboot.service.CommentService;
import com.example.ssmspringboot.service.MenuService;
import com.example.ssmspringboot.service.MusicService;
import com.example.ssmspringboot.service.UserService;
import com.example.ssmspringboot.utils.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;


@Controller
public class MusicController {
    Logger logger = LoggerFactory.getLogger(MusicController.class);
    @Autowired
    private MusicService musicService;
    @Autowired
    private MenuService menuService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;

    @RequestMapping("/music")
    public String toPlay(@RequestParam int musicId, Model model, HttpServletRequest request) {
        int userId = (int) request.getAttribute("userId");
        musicService.addPlayAmount(musicId);
        Music music = musicService.findMusicById(musicId);
        model.addAttribute("music", music);
        List<Comment> commentList = commentService.findAll(musicId);
        for (Comment comment : commentList) {
            Integer i = commentService.findState(userId, comment.getId());
            comment.setState(i == null ? 0 : i);
            //logger.info("id   "+comment.getId()+"     userId    "+userId+"    state    "+comment.getState());
        }
        model.addAttribute("commentList", commentList);
        List<Comment> hcommentList=commentService.findHot(musicId);
        for (Comment comment : hcommentList) {
            Integer i = commentService.findState(userId, comment.getId());
            comment.setState(i == null ? 0 : i);
            //logger.info("id   "+comment.getId()+"     userId    "+userId+"    state    "+comment.getState());
        }
        model.addAttribute("hcommentList", hcommentList);

        int commentNum = commentList == null ? 0 : commentList.size();
        model.addAttribute("commentNum", commentNum);
        User user = userService.findUserById(userId);
        //int flag=0;
        /* int userId= (int) request.getAttribute("userId");*/
      /*  if(isLove(userId,musicId)){
            flag=1;
        }
        model.addAttribute("flag",flag);*/

        model.addAttribute("user", user);
        List<Menu> menuList=menuService.findById(userId);
        model.addAttribute("menuList",menuList);


        String lyric=FileUtils.showLyric(music.getPathName());
        List<String> list= Arrays.asList(lyric.split("\\n"));
        model.addAttribute("list",list);

        return "music2";
    }

    /**
     * 爱心收藏
     * @param userId
     * @param musicId
     * @return
     */
    boolean isLove(int userId, int musicId) {
        String s = menuService.findMenu(userId).getMusicIds();
        if (s == null) {
            return false;
        }
        String m = musicId + "";
        String[] musicIds = s.split(",");
        for (String mId : musicIds) {
            if (mId.equals(m)) {
                return true;
            }
        }
        return false;
    }

    @RequestMapping("/addComment")
    @ResponseBody
    public Result addComment(Comment comment) {
        System.out.println("评论开始");
        //Comment comment=new Comment();
        User user = userService.findUserById(comment.getUserId());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String format = sdf.format(new Date());       //将Date类型转换成String类型
        comment.setCreatetime(format);
        comment.setLikenum(0);
        comment.setUserImage(user.getImage());
        comment.setNickname(user.getNickname());
        commentService.add(comment);
        System.out.println(comment.getContent());
        return new Result(200, "评论成功");

    }

    @RequestMapping("/delComment")
    @ResponseBody
    public Result delComment(@RequestParam int commentId) {
        try {
            commentService.delComment(commentId);
            commentService.delComment(commentId);
            return new Result(200, "删除评论成功");
        } catch (Exception e) {
            return new Result(200, "删除评论失败" + e.getMessage());

        }

    }

    @RequestMapping("/dianzan")
    @ResponseBody
    public Result dianzan(@RequestParam int commentId, @RequestParam int commentUserId, @RequestParam int userId, @RequestParam int state) {
        if (commentId == 0) {
            commentId = commentService.selectMax();
        }
        try {
            if (state == 0) {
                Integer i = commentService.findState(userId, commentId);
                if (i == null) {
                    commentService.saveState(userId, commentId);
                } else {
                    commentService.updateStateUp(userId, commentId);
                }
                commentService.updateNumUp(commentUserId, commentId);
                return new Result(200, "点赞成功");
            } else {
                commentService.updateStatedown(userId, commentId);
                commentService.updateNumDown(commentUserId, commentId);
                return new Result(200, "取消点赞成功");
            }
        } catch (Exception e) {
            return new Result(201, "点赞失败:" + e.getMessage());
        }

    }

    @RequestMapping("/replyjson")
    @ResponseBody
    public List<Reply> reply() {
        Reply reply1 = new Reply("你好", "123");
        Reply reply2 = new Reply("你好a", "1234");

        List<Reply> list = new ArrayList<Reply>();
        list.add(reply1);
        list.add(reply2);

        return list;
    }

}
