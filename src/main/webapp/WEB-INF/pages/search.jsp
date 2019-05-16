<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link href="https://s2.music.126.net/web/s/pt_search_index_8a3a1ee4567d554761f8a3702a48ac4e.css?8a3a1ee4567d554761f8a3702a48ac4e"
      type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/core_ecf905c2264a250ea4e274cc53080eac.css?ecf905c2264a250ea4e274cc53080eac"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_4c683000e2340dfda85c07f79ff9d1d4.css?4c683000e2340dfda85c07f79ff9d1d4"
          type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/Mymusic.css"/>
</head>

<body>
<div id="sample">
    <!--1.logo-->
    <div id="logo">
        <div class="logo-width">
            <img src="img/music.png"/>
            <h1 class="font">悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
            <div class="logt-text">
                <input type="text" class="span" id="content"  value="${searchName}" onkeydown="entersearch();"/>
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
        <div class="g-wrap n-srch">
            <div class="pgsrch f-pr j-suggest" id="auto-id-vq08JGK4M2GN5szU">
                <input id="m-search-input" type="text" class="srch j-flag" value="${searchName}" onkeydown="entersearch();" style="opacity: 1;">
                <span class="j-flag" style="display:none;" id="auto-id-2T3nG7vkqupTgdEH">&nbsp;</span>
                <a hidefocus="true" href="javascript:void(0)" class="btn j-flag" title="搜索"
                   id="auto-id-rWHp81Orx1D7LW6c" onclick="search3();">搜索</a>
                <%--搜索框下拉信息--%>
               <%-- <div class="u-lstlay j-flag" style="display: none;" id="auto-id-8HWhLTS9URAPrBAC">
                    <div class="m-schlist"><p class="note s-fc3"><a class="s-fc3 xtag"
                                                                    href="/search/#/?s=晴天&amp;type=1002">搜“晴天” 相关用户</a>
                        &gt;</p>
                        <div class="rap">
                            <div class="itm f-cb"><h3 class="hd"><i class="icn u-icn u-icn-26"></i><em
                                    class="f-fl">单曲</em></h3>
                                <ul class=" f-cb">
                                    <li><a class="s-fc0 f-thide xtag" href="/song?id=482999668"><span
                                            class="s-fc7 f-tdn">晴天</span>-娄艺潇&nbsp;</a></li>
                                </ul>
                            </div>
                            <div class="itm f-cb"><h3 class="hd"><i class="icn u-icn u-icn-27"></i><em
                                    class="f-fl">歌手</em></h3>
                                <ul class="odd f-cb">
                                    <li><a class="s-fc0 f-thide xtag" href="/artist?id=4828"><span class="s-fc7 f-tdn">晴天</span></a>
                                    </li>
                                    <li><a class="s-fc0 f-thide xtag" href="/artist?id=12968119">SunshineHoney</a></li>
                                    <li><a class="s-fc0 f-thide xtag" href="/artist?id=6452">周杰伦</a></li>
                                </ul>
                            </div>
                            <div class="itm f-cb"><h3 class="hd"><i class="icn u-icn u-icn-29"></i><em
                                    class="f-fl">歌单</em></h3>
                                <ul class=" f-cb">
                                    <li><a class="s-fc0 f-thide xtag"
                                           href="/playlist?id=376493212">那些网易评论过十万的歌，不断更新。</a></li>
                                    <li><a class="s-fc0 f-thide xtag" href="/playlist?id=2152442326"><span
                                            class="s-fc7 f-tdn">晴天</span>周杰伦</a></li>
                                    <li><a class="s-fc0 f-thide xtag" href="/playlist?id=2354178223">周董的情怀</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div id="m-search">
                <div class="snote s-fc4 ztag">搜索“${searchName}”，找到 <em class="s-fc6">${fn:length(musicList)}</em> 首单曲</div>
                <ul class="m-tabs m-tabs-srch f-cb ztag" data-xname="" id="auto-id-M0gvvflzWA372OUU"
                    style="margin-bottom: auto;">
                    <li class="fst"><a data-type="1" href="javascript:void(0)" class="z-slt"><em>单曲</em></a></li>
                </ul>
                <div class="ztag j-flag" id="auto-id-cvCFuZkhWFBuXMTT">
                    <c:if test="${fn:length(musicList)!=0}">
                        <div class="n-srchrst">
                            <div class="srchsongst">
                                <c:forEach items="${musicList}" var="music">
                                    <div class="item f-cb h-flag  ">
                                        <div class="td">
                                            <div class="hd"><a href="music?musicId=${music.musicId}" id="song_482999668" class="ply " title="播放"
                                                               data-res-copyright="1" data-res-type="18" data-res-id="482999668"
                                                               data-res-action="play" data-res-from="32" data-res-data="${music.musicName}"></a>
                                            </div>
                                        </div>
                                        <div class="td w0">
                                            <div class="sn">
                                                <div class="text"><a href="music?musicId=${music.musicId}"><b title="${music.musicName}"><span
                                                        class="s-fc7">${music.musicName}</span></b></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="td">
                                            <div class="opt hshow"><a class="u-icn u-icn-81 icn-add" href="javascript:;"
                                                                      title="添加到播放列表" hidefocus="true" data-res-copyright="1"
                                                                      data-res-type="18" data-res-id="482999668"
                                                                      data-res-action="addto" data-res-from="32"
                                                                      data-res-data="${musci.musicName}"></a>
                                                <span data-res-id="NL482999668"
                                                                                                   data-res-action="fav"
                                                                                                   data-res-type="18"
                                                                                                   class="icn icn-fav"
                                                                                                   title="收藏" onclick="openSZ(${music.musicId});"></span>
                                                <a data-res-id="482999668"
                                                                                                  data-indexid="NL482999668"
                                                                                                  data-res-action="download"
                                                                                                  data-res-type="18"
                                                                                                  class="icn icn-dl" href="/music/mp3/${music.musicId}.mp3" download="${music.musicName}-${music.singerName}"
                                                                                                  title="下载"></a></div>
                                        </div>
                                        <div class="td w1">
                                            <div class="text"><a href="/artist?id=714027">${music.singerName}</a></div>
                                        </div>
                                        <div class="td w2">
                                            <div class="text"><a class="s-fc3" href="/album?id=35589603" title="《${music.album}》">《${music.album}》</a></div>
                            </div>
                                        <div class="td">${music.musicTime}</div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${fn:length(musicList)==0}">
                        <div class="n-nmusic"><h3 class="f-ff2"><i class="u-icn u-icn-21"></i>很抱歉，未能找到相关搜索结果！</h3></div>
                    </c:if>

                </div>
               <%-- <div class="ztag j-flag auto-1555982249669-parent">
                    <div class="auto-1555982249669 u-page"><a href="#" class="zbtn zprv js-p-1555982249666 js-disabled"
                                                              id="auto-id-ZL30kNUoKci3vlOt">上一页</a><a href="#"
                                                                                                      class="zpgi zpg1 js-i-1555982249666 js-selected"
                                                                                                      id="auto-id-7Fz9UuKlqu8lliZf">1</a><a
                            href="#" class="zpgi zpg2 js-i-1555982249666" id="auto-id-EbLPGPlgpvSTcVK9">2</a><a href="#"
                                                                                                                class="zpgi zpg3 js-i-1555982249666"
                                                                                                                id="auto-id-RJnyWTiBQLfByUGG">3</a><a
                            href="#" class="zpgi zpg4 js-i-1555982249666" id="auto-id-GZbT5KKA6SROFc1p">4</a><a href="#"
                                                                                                                class="zpgi zpg5 js-i-1555982249666"
                                                                                                                id="auto-id-E4UN67g5mDiOiP7Q">5</a><a
                            href="#" class="zpgi zpg6 js-i-1555982249666" id="auto-id-nHuKK2obCSEFl1oa">6</a><a href="#"
                                                                                                                class="zpgi zpg7 js-i-1555982249666"
                                                                                                                id="auto-id-DdNJsu8TzkKEiuPh">7</a><a
                            href="#" class="zpgi zpg8 js-i-1555982249666" id="auto-id-dFt9a21WSu65am4y">8</a><span
                            class="zdot">...</span><a href="#" class="zpgi zpg9 js-i-1555982249666"
                                                      id="auto-id-V01dyCUnZLlGyaZn">17</a><a href="#"
                                                                                             class="zbtn znxt js-n-1555982249666"
                                                                                             id="auto-id-FiX9qLD4k3V4U38o">下一页</a>
                    </div>
                </div>--%>
                <div class="j-flag"></div>
            </div>
        </div>
    </div>
    <!--收藏弹框-->
    <div id="sz-show" class="auto-1556077290173 m-layer z-show m-layer-w2" style="top: 130px; left: 480px; display: none">
        <div class="zbar" id="auto-id-b4zf03B8iRlBbytU">
            <div class="zttl f-thide">添加到歌单</div>
        </div>
        <div class="zcnt"><div class="lyct lyct-1 m-favgd f-cb">
            <div class="tit j-flag" id="auto-id-Zbnc2rsp1z1IHZNi">
                <i class="u-icn u-icn-33" onclick="addMenu();"></i>新歌单</div>
            <div class="j-flag" id="auto-id-53sLe7SbFUZo0JHm">
                <ul>
                    <c:forEach items="${menuList}" var="menu">
                        <li data-id="475407140" class="xtag " onclick="addMusic(${menu.menuId});">
                            <div class="item f-cb">
                                <div class="left">
                                    <a href="javascript:void(0)" class="avatar" target="_blank">
                                        <img alt="" src="/music/images/${menu.menuImage}" style="height: 40px;width: 40px"/>
                                    </a>
                                </div>
                                <p class="name f-thide">
                                    <a class="s-fc0" href="javascript:void(0)" target="_blank">${menu.menuName}</a>
                                </p>
                                <p class="s-fc3">${menu.musicAmount}首</p></div>
                        </li>
                    </c:forEach>
                </ul></div>
        </div></div><span class="zcls" title="关闭窗体" onclick="closeSZ();" id="auto-id-88dNPXp0u8zWHzo0">×</span></div>

    <!--歌曲已存在-->
    <div id="tips1"class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd" style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-32"></i><span>歌曲已存在！</span></div></div>
    <!--收藏成功-->
    <div id="tips2"class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd" style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-31"></i><span>收藏成功</span></div></div>
</div>
<!--新建歌单框-->
<div id="light" class="auto-1555851581913 m-layer z-show m-layer-w2" style="top: 220px; left: 521px;display: none">
    <div class="zbar" id="auto-id-Tm4vO9KhgnxkkVJa"><div class="zttl f-thide">新建歌单</div></div><div class="zcnt"><div class="lyct m-crgd f-cb f-tc" id="auto-id-KCTkx4TGQGIhv2Cc">
    <p>歌单名：<input type="text" class="u-txt j-flag" name="menuName" id="menuName"></p>
    <p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
    <div class="btn">
        <a href="javascript:;" onclick="severCheck();" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-p02hvU4waNw0kfEm"><i>新 建</i></a>
        <a href="javascript:;" onclick="closeDialog();" class="u-btn2 u-btn2-1 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-0Nv9JVTqcyvd1tTL"><i>取 消</i></a>
    </div>
</div></div><span class="zcls" title="关闭窗体" onclick="closeDialog();" id="auto-id-A1AOvvBWUVyekJ5U">×</span></div>
<!-- 登录连接 -->
<!--<div><a href="javascript:void(0);" onclick="showsure()">登录</a></div>-->
<!-- 弹出登录表单开始 -->
<div id="hsDiv" style="display:none;">
    <!-- 右上角关闭按钮 -->
    <div id="closediv">
        <a href="javascript:void(0);" onclick="closeDiv()"><img src="img/tc.png"></a>
    </div>
    <!--登录标题 -->
    <div id="dlTitle">登录</div>
    <!-- 登录div -->
    <div id="tbdiv">

        <table id="logintb">
            <tr>
                <td class="logintd1">用户名：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="text" id="username" name="username"
                                            onblur="CheckChinese('username','用户名')" id="username">
                </td>
            </tr>
            <tr>
                <td class="logintd1">密码：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="password" name="password" id="password">
                </td>
            </tr>

            <tr>
                <td class="logintd4"><input type="submit" onclick="severCheck();" value="登 录" class="but">
                </td>
            </tr>
        </table>

    </div>
</div>
<div id="overDiv" style="display:none;"></div>

<!-- 注册连接 -->
<!-- 弹出注册表单开始 -->
<div id="hsDiv2" style="display:none; height: 378px;">
    <!-- 右上角关闭按钮 -->
    <div id="closediv">
        <a href="javascript:void(0);" onclick="closeDiv2()"><img src="img/tc.png"></a>
    </div>
    <!-- 注册标题 -->
    <div id="dlTitle">注册</div>
    <!-- 注册div -->
    <div id="tbdiv">
        <table id="logintb">
            <tr>
                <td class="logintd1">用户名：</td>
            </tr>
            <tr>
                <td class="logintd2">
                    <input type="text" name="username" id="rusername">
                    <span id="usernamespan"></span>
                </td>
            </tr>
            <tr>
                <td class="logintd1">密码：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="password" id="rpassword" name="password">
                </td>
            </tr>
            <tr>
                <td class="logintd1">确认密码：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="password" id="password2"/>
                </td>
            </tr>

            <tr>
                <td class="logintd4"><input type="submit" onclick="severCheck2()" value="注册" class="but">
                </td>
            </tr>
        </table>

    </div>
</div>
<div id="overDiv2" style="display:none;"></div>
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>

<script type="text/javascript">
    var szmusicId=null;

    function openSZ(musicId) {
        szmusicId=musicId;
        document.getElementById('sz-show').style.display='block';
    }
    function closeSZ() {
        document.getElementById('sz-show').style.display='none';
    }
    function addMenu() {
        closeSZ();
        openDialog();
    }
    function closeDialog(){
        document.getElementById('light').style.display='none';
        openSZ(musicId);
    }
    function severCheck() {
        var menuName=$("#menuName").val();
        $.ajax({
            type:"POST",
            url:'addMenu',
            data:{
                menuName:menuName
            },
            dataType:'json',
            cache:false,
            success:function (data) {

                if(200==data.status){
                    closeDialog();
                   addMusic(musicId);
                }else if(201==data.status){

                    $("#menuName").tips({
                        side:1,
                        msg:"创建歌单失败！请稍后重试！",
                        bg:'#FF5080',
                        time:5
                    });
                    //showfh();
                    $("#menuName").focus();
                }
            }
        });
    }
    function OkBack() {
        document.getElementById('tips2').style.display='block';
        setTimeout(function () {
            document.getElementById('tips2').style.display='none';
        },1200);
    }
    function FailBack() {
        document.getElementById('tips1').style.display='block';
        setTimeout(function () {
            document.getElementById('tips1').style.display='none';
        },1200);
    }
    function addMusic(menuId) {
        console.log(szmusicId);
        $.ajax({
            type:"POST",
            url:'addMusic',
            data:{
                menuId:menuId,
                musicId:szmusicId
            },
            dataType:'json',
            cache: false,
            success:function (data) {
                closeSZ();
                if(data.status==200){
                    OkBack();
                }else {
                    FailBack();

                }
            }
        });
    }
</script>
</html>