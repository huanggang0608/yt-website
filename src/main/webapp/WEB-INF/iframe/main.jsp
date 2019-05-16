<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>悦听音乐网</title>
    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="//s2.music.126.net/web/s/core_ecf905c2264a250ea4e274cc53080eac.css?ecf905c2264a250ea4e274cc53080eac" type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/core_497ec9c9ed294e61babbfcc8dab817ec.css?497ec9c9ed294e61babbfcc8dab817ec" type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_4c683000e2340dfda85c07f79ff9d1d4.css?4c683000e2340dfda85c07f79ff9d1d4" type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_discover_index_4c1d3fc91cd3723227eca70e95d80434.css?4c1d3fc91cd3723227eca70e95d80434" type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_65d7d59f18af32d903addbe070895505.css?65d7d59f18af32d903addbe070895505" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/enter.css" />
    <link rel="stylesheet" type="text/css" href="css/audio.css">
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery.tips.js"></script>

    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico" />
    <script>
        $(document).ready(function(){
            $("#index").click(function(){
                $("#g_iframe").attr({
                    "src" : "index"
                });
            });
            $("#home").click(function () {
                $("#g_iframe").attr({
                    "src" : "home"
                });
            });
            $("#myCol").click(function () {
                $("#g_iframe").attr({
                    "src" : "myMusic"
                });
            });
        });
        function search2() {
            var content=$('#content').val();
            $("#g_iframe").attr({
                "src" : "search?searchName="+content
            });
        }
        function entersearch() {
            var event = window.event || arguments.callee.caller.arguments[0];
            if (event.keyCode == 13) {
                search2();
            }
        }
    </script>

</head>

<body >

<div id="sample">
    <!--1.logo-->
    <div id="logo">
        <div class="logo-width">
            <img src="img/music.png"/>
            <h1 class="font">悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
            <div class="logt-text">
                <input type="text" class="span" id="content"  onkeydown="entersearch();"/>
                <a href="javascript:void(0);" class="span" title="搜索" id="search" onclick="search2();">搜索</a>
            </div>
        </div>

    </div>
    <!--导航栏-->
    <div id="navigation">
        <ul>
            <a href="javascript:void(0);" id="index">
                <li class="li_1">首页</li>
            </a>
            <a href="javascript:void(0);" onclick="checkLogin();">
                <li class="li_2">我的音乐</li>
            </a>
            <a href="##">
                <li class="li_3" onclick="tips();">朋友</li>
            </a>
            <a href="##">
                <li class="li_4" onclick="tips();">商城</li>
            </a>
            <a href="##">
                <li class="li_5" onclick="tips();">音乐人</li>
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
                    <img src="/user/images/${user.image}" id="userImage" width="100%" height="100%" />
                    <ul>
                        <a href="javascript:void(0);" id="home" style="margin: 0px;"><li>个人主页</li></a>
                        <a href="javascript:void(0);" id="myCol" style="margin: 0px;"><li>我的收藏</li></a>
                        <li onclick="showsure()" style="cursor:pointer;">切换账号</li>
                        <a href="/loginout" style="margin: 0px;"><li>退出</li></a>
                    </ul>

                </div>
            </div>
        </c:if>


    </div>
</div>
<iframe name="contentFrame" id="g_iframe" class="g-iframe" scrolling="auto" frameborder="0" src="index" allowfullscreen="true" style="top: 130px"
   <p>浏览器不支持帧框架</p>
</iframe>

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
                <td class="logintd2"><input type="text" id="username" name="username" onblur="CheckChinese('username','用户名')" id="username">
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
                    <input type="text" name="username" id="rusername" >
                    <span id="usernamespan"></span>
                </td>
            </tr>
            <tr>
                <td class="logintd1">密码：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="password" id="rpassword"  name="password">
                </td>
            </tr>
            <tr>
                <td class="logintd1">确认密码：</td>
            </tr>
            <tr>
                <td class="logintd2"><input type="password" id="password2"  />
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
<!--播放栏-->
<div class="audio-box">
    <div class="audio-container">
        <div class="audio-cover">
        </div>
        <div class="audio-view">
            <h3 class="audio-title">未知歌曲</h3>
            <div class="audio-body">
                <div class="audio-backs">
                    <div class="audio-this-time">00:00</div>
                    <div class="audio-count-time">00:00</div>
                    <div class="audio-setbacks">
                        <i class="audio-this-setbacks">
                            <span class="audio-backs-btn"></span>
                        </i>
                        <span class="audio-cache-setbacks">
							</span>
                    </div>
                </div>
            </div>
            <div class="audio-btn">
                <div class="audio-select">
                    <div class="audio-prev"></div>
                    <div class="audio-play"></div>
                    <div class="audio-next"></div>
                    <!--<div class="audio-menu"></div>-->
                    <div class="audio-volume"></div>
                </div>
                <div class="audio-set-volume">
                    <div class="volume-box">
                        <i><span></span></i>
                    </div>
                </div>
                <div class="audio-list" style="display: block">
                    <div class="audio-list-head">
                        <p>☺随心听</p>
                        <span class="menu-clean" style="margin-right: 40px;display: none" >清空</span>
                        <span class="menu-close">展开</span>
                    </div>
                    <ul class="audio-inline" style="display: none">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--该功能正在开发中-->
<div id="tips1"class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd" style="top: 190px; left: 580px; display: none">
    <div class="sysmsg"><i class="u-icn u-icn-32"></i><span>该功能正在开发中，敬请期待！</span></div></div>
</body>
<script type="text/javascript" src="js/audio.js"></script>
<!--audio-->
<script type="text/javascript">
    function way(i,name1,name2,flag){

        audioFn.newSong({
            'cover' : 'music/images/'+i+'.jpg',
            'src' : 'music/mp3/'+i+'.mp3',
            'title' : name1+' - '+name2
        },flag);

    }

    $('.menu-clean').click(function () {
       audioFn.clean();
    });
</script>
<script type="text/javascript">
    function checkLogin() {
        var userId="<%= request.getAttribute("userId")%>";
        if(userId!=0){
            $("#g_iframe").attr({
                "src" : "myMusic"
            });
        }else{
            console.log("请先登录！");
            this.showsure();
        }
    }
    function tips(){
        document.getElementById('tips1').style.display='block';
        setTimeout(function () {
            document.getElementById('tips1').style.display='none';
        },1000);
    }

</script>
</html>