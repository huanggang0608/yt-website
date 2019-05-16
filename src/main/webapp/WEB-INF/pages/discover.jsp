<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>华语歌单 - 歌单 - 悦听音乐</title>
    <link rel="stylesheet" href="css/discover.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/enter.css" />
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico" />

<link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">

<link href="//s2.music.126.net/web/s/core_ecf905c2264a250ea4e274cc53080eac.css?ecf905c2264a250ea4e274cc53080eac" type="text/css" rel="stylesheet">
<link href="//s2.music.126.net/web/s/pt_frame_4c683000e2340dfda85c07f79ff9d1d4.css?4c683000e2340dfda85c07f79ff9d1d4" type="text/css" rel="stylesheet">

</head>

<body>
<div id="sample">
<!--1.logo-->
<div id="logo">
    <div class="logo-width">
        <img src="img/music.png"/>
        <h1 class="font">悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
        <div class="logt-text">
            <input type="text" class="span" id="content"   onkeydown="entersearch();"/>
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
        <a href="/myMusic" >
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
                <img src="/user/images/${user.image}" id="userImage" width="100%" height="100%" />
                <ul>
                    <a href="/home"style="margin: 0px;"><li>个人主页</li></a>
                    <a href="/myMusic" style="margin: 0px;"><li>我的收藏</li></a>
                    <li onclick="showsure()" style="cursor:pointer;">切换账号</li>
                    <a href="/loginout" style="margin: 0px;"><li>退出</li></a>
                </ul>

            </div>
        </div>
    </c:if>


</div>
<div class="g-bd" id="m-disc-pl-c">

<div class="g-wrap p-pl f-pr">
<div class="u-title f-cb">
<h3>
    <span class="f-ff2 d-flag">${type}</span>
    <a href="javascript:;" class="u-btn2 u-btn2-1 menu d-flag" id="cateToggleLink" onclick="shownsltlyr();">
        <i>选择分类<em class="u-icn u-icn-38"></em></i></a></h3>
<div class="u-btn f-fr u-btn-hot d-flag">
<a href="#" class="a1" data-order="hot">热门</a>
<%--<a href="/discover/playlist/?order=new&amp;cat=%E6%B0%91%E8%B0%A3" class="a2" data-order="new">最新</a>--%>
</div>

</div>

<div id="cateListBox" class="n-sltlyr d-flag" style="left:0;">
<div class="hd"><i class="icn"></i></div>
<div class="bd">
<h3><a href="/discover?type=全部" class="j-flag u-btn u-btn-g s-fc1" data-cat="全部"><em>全部风格</em></a></h3>
<dl class="f-cb">
<dt><i class="u-icn u-icn-6"></i>风格</dt>
<dd>
<a class="s-fc1 " href="/discover?type=华语" data-cat="华语">华语</a><span class="line">|</span>
<a class="s-fc1 " href="/discover?type=流行" data-cat="流行">流行</a><span class="line">|</span>
<a class="s-fc1 " href="/discover?type=摇滚" data-cat="摇滚">摇滚</a><span class="line">|</span>
<a class="s-fc1 " href="/discover?type=民谣" data-cat="民谣">民谣</a><span class="line">|</span>
<a class="s-fc1 " href="/discover?type=电子" data-cat="电子">电子</a><span class="line">|</span>
</dd>
</dl>

</div>
<div class="ft"></div>
</div>
<ul class="m-cvrlst f-cb" id="m-pl-container">
    <c:forEach items="${musicList}" var="music">
        <li>
            <div class="u-cover u-cover-1">
                <img class="j-flag" src="/music/images/${music.musicImage}" style="height: 140px;width: 140px">
                <a title="${music.musicName}" href="music?musicId=${music.musicId}" class="msk"></a>
                <div class="bottom">
                    <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13" data-res-id="2664947226" data-res-action="play"></a>
                    <span class="icon-headset"></span>
                    <span class="nb">${music.playAmount}</span>
                </div>
            </div>
            <p class="dec">
                <a title="${music.musicName}" href="music?musicId=${music.musicId}" class="tit f-thide s-fc0">${musci.musicName}</a>
            </p>
            <p><span class="s-fc4">by</span> <a title="${music.singerName}" href="#" class="nm nm-icn f-thide s-fc3">${music.singerName}</a> <sup class="u-icn u-icn-84 "></sup>
            </p>
        </li>
    </c:forEach>


</ul>

</div>
</div>
</div>
</div>
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
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>
<script type="text/javascript">
    var flag=1;
    function shownsltlyr() {
        if(flag==1)
        {document.getElementById('cateListBox').style.display="block";
        flag=0;}else{
            document.getElementById('cateListBox').style.display="none";
            flag=1;
        }
    }
</script>
<script type="text/javascript">

    function severCheck() {
        if(check()){
            var username = $("#username").val();
            var password = $("#password").val();

            $.ajax({
                type:"POST",
                url:'loginCheck',
                data:{
                    username:username,
                    password:password
                },
                dataType:'json',
                cache:false,
                success:function (data) {

                    /* alert(d.status);*/
                    if(200==data.status){
                        window.location.href="index";
                    }else if(201==data.status){

                        $("#username").tips({
                            side:2,
                            msg:"用户名或密码有误",
                            bg:'#FF5080',
                            time:1
                        });
                        //showfh();
                        $("#username").focus();
                    }else{
                        $("#username").tips({
                            side:2,
                            msg:"系统繁忙 ，请尝试稍后重新登录 ...",
                            bg:'#FF5080',
                            time:1
                        });
                    }

                }
            })

        }
    }
    function severCheck2() {
        if(check2()){
            var username = $("#rusername").val();
            var password = $("#rpassword").val();

            $.ajax({
                type:"POST",
                url:'registCheck',
                data:{
                    username:username,
                    password:password,
                },
                dataType:'json',
                cache:false,
                success:function (data) {

                    /* alert(d.status);*/
                    if(200==data.status){
                        $("#rusername").tips({
                            side:2,
                            msg:"注册成功",
                            bg:'#FF5080',
                            time:1
                        });

                    }else if(201==data.status){

                        $("#rusername").tips({
                            side:2,
                            msg:"用户名已存在",
                            bg:'#FF5080',
                            time:1
                        });
                        //showfh();
                        $("#rsername").focus();
                    }else{
                        $("#rusername").tips({
                            side:2,
                            msg:"系统繁忙 ，请尝试稍后重新注册 ...",
                            bg:'#FF5080',
                            time:1
                        });
                    }

                }
            })

        }
    }
    //客户端校验
    function  check() {

        if($("#username").val()==""){
            $("#username").tips({
                side:2,
                msg:'用户名不能为空',
                bg:'#AE81FF',
                time:1

            });
            //showfh();
            $("#username").focus();
            return false;

        }
        /*else {
            $("#username").val(jQuery.trim($('#username').val()));}*/

        if ($("#password").val() == "") {
            $("#password").tips({
                side : 2,
                msg : '密码不得为空',
                bg : '#AE81FF',
                time : 1
            });
            //showfh();
            $("#password").focus();
            return false;
        }
        return true;
    }
    function  check2() {

        if($("#rusername").val()=="") {
            $("#rusername").tips({
                side: 2,
                msg: '用户名不能为空',
                bg: '#AE81FF',
                time: 1
            });
            //showfh();
            $("#rusername").focus();
            return false;

        }

        /*else {
            $("#username").val(jQuery.trim($('#username').val()));}*/

        if ($("#rpassword").val() == "") {
            $("#rpassword").tips({
                side : 2,
                msg : '密码不得为空',
                bg : '#AE81FF',
                time : 1
            });
            //showfh();
            $("#rpassword").focus();
            return false;
        }
        if ($("#password2").val() == "") {
            $("#password2").tips({
                side : 2,
                msg : '确认密码不得为空',
                bg : '#AE81FF',
                time : 1
            });
            //showfh();
            $("#password2").focus();
            return false;
        }else if(($("#password2").val())!=($("#rpassword").val())){
            $("#password2").tips({
                side : 2,
                msg : '两次密码不一致',
                bg : '#AE81FF',
                time : 1
            });
            //showfh();
            $("#password2").focus();
            return false;
        }
        return true;
    }
    $('.m-back').click(function () {
        window.scrollTo(0, 1);
    });
</script>
</html>