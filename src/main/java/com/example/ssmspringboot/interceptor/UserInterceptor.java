package com.example.ssmspringboot.interceptor;

import com.alibaba.druid.util.StringUtils;
import com.example.ssmspringboot.utils.CookieUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String ticket= CookieUtils.getCookieValue(request,"YT_TICKET");
        if(!StringUtils.isEmpty(ticket)){
            //如果不为空，说明登录过
            //获取用户数据
            int userId=Integer.parseInt(ticket);
            request.setAttribute("userId",userId);
            return true;
        }
        request.setAttribute("userId",0);
        return true;


    }
}
