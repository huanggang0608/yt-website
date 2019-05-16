package com.example.ssmspringboot.controller;


import com.example.ssmspringboot.pojo.Result;
import com.example.ssmspringboot.pojo.User;
import com.example.ssmspringboot.service.CommentService;
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
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class UserController {
    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @RequestMapping("/editUser")
    public String editUser(int userId, Model model) {

        User user = userService.findUserById(userId);
        model.addAttribute("user", user);
        return "userEdit";
    }

    @RequestMapping("/editUser/save")
    public String saveEditUser(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
        String nickname = request.getParameter("nickname");
        String presentation = request.getParameter("presentation");
        int userId = (int) request.getAttribute("userId");
        User u1 = new User();
        u1.setNickname(nickname);
        u1.setId(userId);
        u1.setPresentation(presentation);
        String userImage = null;
        if (file != null) {
            //要上传的目标文件存放路径
           // String localPath = "C:/Users/huangg/Desktop/ytResources/user/images";
            String localPath = "/home/project/resources/ytResources/user/images";
            userImage = "" + userId + "-" + file.getOriginalFilename();
            if (FileUtils.upload(file, localPath, userImage)) {
                logger.info("保存成功，图像文件名：{}", userImage);

            }
        }
        u1.setImage(userImage);
        userService.updateUser(u1);
        commentService.updateUser(userId,nickname,userImage);


        return "redirect:/home?userId=" + userId;

    }

    @RequestMapping("fans")
    public String toFans(Model model,int otherId,HttpServletRequest request){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        User other=userService.findUserById(otherId);
        otherId=otherId==0?userId:otherId;

        int state=userService.findAttention(userId,otherId);
        model.addAttribute("state",state);

        List<User> fansList= userService.selectFans(otherId);
        for (User u1 : fansList) {
            int flag=userService.findAttention(userId,u1.getId());
            u1.setState(flag);
        }
        model.addAttribute("user",user);
        model.addAttribute("other",other);
        model.addAttribute("fansList",fansList);

        return "fans";
    }
    @RequestMapping("follow")
    public String toFollow(Model model,int otherId,HttpServletRequest request){
        int userId= (int) request.getAttribute("userId");
        User user=userService.findUserById(userId);
        User other=userService.findUserById(otherId);
        otherId=otherId==0?userId:otherId;

        int state=userService.findAttention(userId,otherId);
        model.addAttribute("state",state);

        List<User> folList=userService.selectFol(otherId);
        for (User u1 : folList) {
            int flag=userService.findAttention(userId,u1.getId());
            u1.setState(flag);
        }
        model.addAttribute("user",user);
        model.addAttribute("other",other);
        model.addAttribute("folList",folList);
        return "follow";
    }
    @RequestMapping("/addAttention")
    @ResponseBody
    public Result addAttention(HttpServletRequest request, int otherId){

        int userId= (int) request.getAttribute("userId");
        userService.addAttention(userId,otherId);
        userService.addFansNum(otherId);
        userService.addFolNum(userId);
        Result result=new Result();
        result.setStatus(200);
        return result;
    }

    @RequestMapping("/delAttention")
    @ResponseBody
    public Result delAttention(HttpServletRequest request,int otherId){

        int userId= (int) request.getAttribute("userId");
        userService.delAttention(userId,otherId);
        userService.delFansNum(otherId);
        userService.delFolNum(userId);
        Result result=new Result();
        result.setStatus(200);
        return result;
    }
}





