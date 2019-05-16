<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>悦听音乐</title>
    <link rel="stylesheet" href="css/discover.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>

    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="https://s2.music.126.net/web/s/core_08ab69c917b257e8d34b944f658b66a6.css?08ab69c917b257e8d34b944f658b66a6"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_profile_follows_37811b0f94f8231033006a4e5f33142e.css?37811b0f94f8231033006a4e5f33142e"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_frame_49fff55527d8ef751c88fe269c3b303f.css?49fff55527d8ef751c88fe269c3b303f"
          type="text/css" rel="stylesheet">

</head>

<div>
    <div id="sample">
        <!--1.logo-->
        <div id="logo">
            <div class="logo-width">
                <img src="img/music.png"/>
                <h1 class="font">悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
                <div class="logt-text">
                    <input type="text" class="span" id="content" onkeydown="entersearch();"/>
                    <a href="javascript:void(0);" class="span" title="搜索" id="search" onclick="search2();">搜索</a>
                </div>
            </div>

        </div>
        <!--导航栏-->
        <div id="navigation">
            <ul>
                <a href="index">
                    <li class="li_1">首页</li>
                </a>
                <a href="/myMusic">
                    <li class="li_2">我的音乐</li>
                </a>
                <a href="##">
                    <li class="li_3">朋友</li>
                </a>
                <a href="##">
                    <li class="li_4">商城</li>
                </a>
                <a href="##">
                    <li class="li_5">音乐人</li>
                </a>
            </ul>
            <c:if test="${user==null}">
                <div id="navigation-link">
                    <a href="javascript:void(0);" onclick="showsure()">登录</a>
                    <a href="javascript:void(0);" onclick="showsure2()">注册</a>
                </div>
            </c:if>
            <c:if test="${user!=null}">
                <div id="navigation-link">
                    <div id="navigation-link-tx">
                        <img src="/user/images/${user.image}" id="userImage" width="100%" height="100%"/>
                        <ul>
                            <a href="/home" style="margin: 0px;">
                                <li>个人主页</li>
                            </a>
                            <a href="/myMusic" style="margin: 0px;">
                                <li>我的收藏</li>
                            </a>
                            <li onclick="showsure()" style="cursor:pointer;">切换账号</li>
                            <a href="/loginout" style="margin: 0px;">
                                <li>退出</li>
                            </a>
                        </ul>

                    </div>
                </div>
            </c:if>


        </div>
        <div class="g-bd">
            <div class="g-wrap p-prf">
                <dl class="m-proifo f-cb" id="head-box">
                    <dt class="f-pr" id="ava">
                        <img src="user/images/${other.image}" style="height: 180px;width: 180px">
                    </dt>
                    <dd>
                        <div class="name f-cb">
                            <div class="f-cb">
                                <c:if test="${other.id==user.id}">
                                    <div class="edit"><a href="editUser?userId=${user.id}" hidefocus="true"
                                                         class="u-btn2 u-btn2-1"><i>编辑个人资料</i></a></div>
                                </c:if>
                                <div class="rect" id="newmusician"></div>
                                <h2 id="j-name-wrap" class="wrap f-fl f-cb ">
                                    <span class="tit f-ff2 s-fc0 f-thide">${other.nickname}</span>
                                    <span id="j-vip-code"></span>
                                    <!--用户等级-->
                                    <%--<span class="lev u-lev u-icn2 u-icn2-lev">7<i class="right u-icn2 u-icn2-levr"></i></span>--%>
                                    <!--用户性别-->
                                    <%--  <i class="icn u-icn u-icn-01"></i>--%>
                                </h2>
                                <c:if test="${other.id!=user.id}">
                                    <div id="head-oper">
                                        <c:if test="${state==0}">
                                            <a href="#" class="btn u-btn u-btn-8 f-tdn fans_gz" data-action="follow" id="att1" onclick="addAttention(${other.id});"style="
                                                float: right;">关 注</a>
                                        </c:if>
                                        <c:if test="${state!=0}">
                                            <a href="#" class="btn u-btn u-btn-6 f-tdn fans_qg" data-action="delfollow" id="att2" onclick="delAttention();"style="
                                                float: right;"><i>已关注</i></a>
                                        </c:if>


                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <ul class="data s-fc3 f-cb" id="tab-box">
                            <li><a href="/follow?otherId=${other.id}"><strong id="follow_count">${other.folNum}</strong><span>关注</span></a>
                            </li>
                            <li>
                                <a href="/fans?otherId=${other.id}">
                                    <strong id="fan_count">${other.fansNum}</strong>
                                    <span>粉丝</span>
                                </a></li>
                        </ul>
                        <c:if test="${other.presentation!=null}">
                            <div class="inf s-fc3 f-brk">个人介绍：${other.presentation}</div>
                        </c:if>

                    </dd>
                </dl>
                <div class="u-title u-title-1 f-cb">
                    <h3><span class="f-ff2 s-fc3">粉丝（<span id="fan_count_down">${other.fansNum}</span>）</span></h3>
                </div>
                <ul class="m-fans f-cb" id="main-box">
                    <c:forEach items="${fansList}" var="fans">
                        <li class=""><a href="/home?otherId=${fans.id}" class="ava f-pr" title="${fans.nickname}"><img
                                src="user/images/${fans.image}" style="height: 60px;width: 60px"><i
                                class="dot u-icn u-icn-68 f-alpha"></i></a>
                            <div class="info"><p><a href="/home?otherId=${fans.id}" class="s-fc7 f-fs1 nm f-thide"
                                                    title="${fans.nickname}">${fans.nickname}</a>&nbsp;</p>
                                <p>
                                    <a href="/follow?otherId=${fans.id}">关注<em class="s-fc7">${fans.folNum}</em></a><span
                                        class="line">|</span><a href="/fans?otherId=${fans.id}">粉丝<em
                                        class="s-fc7">${fans.fansNum}</em></a></p>
                                <p class="s-fc3 f-thide">${fans.presentation}</p></div>
                            <c:if test="${fans.id != user.id}">
                            <div class="oper" id="oper_339854303">
                                <c:if test="${fans.state!=0}">
                                    <p class="s-fc4 fans_gz" ><i class="u-icn u-icn-67"></i> 已关注</p>
                                </c:if>

                                <c:if test="${fans.state==0}">
                                    <a class="u-btn u-btn-8 f-tdn fans_qg" href="#" data-action="follow" data-userid="1290826722" onclick="addAttention(${fans.id})">关
                                        注</a>
                                </c:if>

                            </div>
                            </c:if>
                        </li>
                    </c:forEach>
                  <%--  <li class=""><a href="/otherhome?otherId=1" class="ava f-pr" title="夜不懂白-"><img
                            src="http://p1.music.126.net/lAvvLjB9b6qzkSgX5pcSdQ==/3438172871915366.jpg?param=60y60"><i
                            class="dot u-icn u-icn-68 f-alpha"></i></a>
                        <div class="info"><p><a href="/user/home?id=339854303" class="s-fc7 f-fs1 nm f-thide"
                                                title="夜不懂白-">夜不懂白-</a>&nbsp;<i class="icn u-icn u-icn-s-01"></i></p>
                            <p><a href="/user/event?id=339854303">动态<em class="s-fc7">0</em></a><span
                                    class="line">|</span><a href="/user/follows?id=339854303">关注<em class="s-fc7">2</em></a><span
                                    class="line">|</span><a href="/user/fans?id=339854303">粉丝<em
                                    class="s-fc7">0</em></a></p>
                            <p class="s-fc3 f-thide">~~~~~~</p></div>

                        <div class="oper" id="oper_1290826722">
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <a class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="1290826722">关
                                注</a></div>

                    </li>
                    <li class="odd last "><a href="/user/home?id=1290826722" class="ava f-pr" title="开窍呀"><img
                            src="http://p1.music.126.net/Hf8S9e0Mp1JR6ypKoR09TA==/19058934556317659.jpg?param=60y60"><i
                            class="dot u-icn u-icn-68 f-alpha"></i></a>
                        <div class="info"><p><a href="/user/home?id=1290826722" class="s-fc7 f-fs1 nm f-thide"
                                                title="开窍呀">开窍呀</a>&nbsp;<i class="icn u-icn u-icn-s-02"></i></p>
                            <p><a href="/user/event?id=1290826722">动态<em class="s-fc7">5</em></a><span
                                    class="line">|</span><a href="/user/follows?id=1290826722">关注<em
                                    class="s-fc7">6</em></a><span class="line">|</span><a
                                    href="/user/fans?id=1290826722">粉丝<em class="s-fc7">1</em></a></p>
                            <p class="s-fc3 f-thide">好听的歌太多，唯独特别钟意你！</p></div>
                        <div class="oper" id="oper_1290826722">
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-67"></i> 已关注</p>
                          <a
                                  class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="1290826722">关
                                注</a></div>
                    </li>
                    <li class="bg last "><a href="/user/home?id=248477634" class="ava f-pr" title="时雨不期_"><img
                            src="http://p1.music.126.net/cMR_CMiNf_5AQLcvdWgAOg==/109951163719257151.jpg?param=60y60"><i
                            class="dot u-icn u-icn-68 f-alpha"></i></a>
                        <div class="info"><p><a href="/user/home?id=248477634" class="s-fc7 f-fs1 nm f-thide"
                                                title="时雨不期_">时雨不期_</a>&nbsp;<i class="icn u-icn u-icn-s-01"></i></p>
                            <p><a href="/user/event?id=248477634">动态<em class="s-fc7">2</em></a><span
                                    class="line">|</span><a href="/user/follows?id=248477634">关注<em class="s-fc7">6</em></a><span
                                    class="line">|</span><a href="/user/fans?id=248477634">粉丝<em
                                    class="s-fc7">2</em></a></p>
                            <p class="s-fc3 f-thide">父母尚在苟且，你却在炫耀诗与远方</p></div>
                        <div class="oper" id="oper_248477634"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                                 data-userid="248477634" data-nickname="时雨不期_"
                                                                 style="display:none;"><i>发私信</i></a>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="248477634">关
                                注</a></div>
                    </li>--%>
                </ul><c:if test="${fn:length(fansList)==0}">
                <div class="u-page" id="page" >
                    <div class="n-nmusic"><h3 class="f-ff2"><i class="u-icn u-icn-21"></i>还没有粉丝</h3></div>
                </div>
            </c:if>

            </div>
        </div>

    </div>
</div>
</div>
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>
<script type="text/javascript">
    function addAttention(otherId) {
        $.ajax({
            type:"POST",
            url:"addAttention",
            data:{
                userId:${user.id},
                otherId:otherId
            },
            dataType:'json',
            cache:false,
            success(data){
                if(data.status==200){
                   location.reload();
                }
                else{
                    console.log("关注失败");
                }
            }
        });
    }
    function delAttention() {
        $.ajax({
            type:"POST",
            url:"delAttention",
            data:{
                userId:${user.id},
                otherId:${other.id}
            },
            dataType:'json',
            cache:false,
            success(data){
                if(data.status==200){
                    location.reload();
                }
                else{
                    console.log("取消关注失败");
                }
            }
        });
    }
    $('.m-back').click(function () {
        window.scrollTo(0, 1);
    });
</script>
</html>