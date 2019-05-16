<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>悦听音乐网</title>

    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="https://s2.music.126.net/web/s/core_08ab69c917b257e8d34b944f658b66a6.css?08ab69c917b257e8d34b944f658b66a6"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/core_497ec9c9ed294e61babbfcc8dab817ec.css?497ec9c9ed294e61babbfcc8dab817ec"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_frame_49fff55527d8ef751c88fe269c3b303f.css?49fff55527d8ef751c88fe269c3b303f"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_discover_index_4c1d3fc91cd3723227eca70e95d80434.css?4c1d3fc91cd3723227eca70e95d80434"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_65d7d59f18af32d903addbe070895505.css?65d7d59f18af32d903addbe070895505"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/core_37b79ebaaea120bd79b6be084e4e0c3d.css?37b79ebaaea120bd79b6be084e4e0c3d"
          type="text/css" rel="stylesheet">

    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>

    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery.tips.js"></script>


    <link href="css/liuyan.css" rel="stylesheet" type="text/css" media="all" />
    <link href="css/music.css" rel="stylesheet" type="text/css" media="all" />
    <!--//js,css files-->
    <!--audio-->
    <link rel="stylesheet" type="text/css" media="all" href="css/audio.css">
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>

</head>

<body>

<div id="sample">
    <!--1.logo-->
    <div id="logo">
        <div class="logo-width">
            <img src="img/music.png"/>
            <h1 class="font" >悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
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
            <a href="myMusic" >
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
    <div class="g-bd4 f-cb">
    <div class="g-mn4">
        <div class="g-mn4c">
            <div class="g-wrap6">
                <div class="m-lycifo">
                    <div class="f-cb">
                        <div class="cvrwrap f-cb f-pr">
                            <div class="u-cover u-cover-6 f-fl">
                                <img src="/music/images/${music.musicImage}" style="height: 130px;width: 130px;"
                                     class="j-img"
                                     data-src="http://p2.music.126.net/4wp5kkLC3I1L_b2edsjFHQ==/18867619532813466.jpg">
                                <span class="msk f-alpha"></span>
                            </div>

                        </div>
                        <div class="cnt">
                            <div class="hd">
                                <i class="lab u-icn u-icn-37"></i>
                                <div class="tit">
                                    <em class="f-ff2">${music.musicName}</em>
                                </div>
                            </div>
                            <p class="des s-fc4">歌手：<span title="${music.singerName}"><a class="s-fc7" href="javascript:void(0);">${music.singerName}</a></span>
                            </p>
                            <p class="des s-fc4">所属专辑：<a href="javascript:void(0);" class="s-fc7">${music.album}</a></p>
                            <div class="m-info">
                                <div id="content-operation" class="btns f-cb" data-rid="482999668" data-type="18">
                                    <a data-res-action="play" data-res-id="482999668" data-res-type="18"
                                       href="javascript:;" class="u-btn2 u-btn2-2 u-btni-addply f-fl" hidefocus="true"
                                       title="播放"><i><em class="ply"></em>播放</i></a>
                                    <a data-res-action="addto" data-res-id="482999668" data-res-type="18"
                                       href="javascript:;" class="u-btni u-btni-add" hidefocus="true"
                                       title="添加到播放列表"></a>
                                    <a data-res-id="482999668" data-res-type="18" data-count="-1" data-fee="0"
                                       data-payed="0" data-pl="320000" data-dl="320000" data-cp="1" data-toast="false"
                                       data-st="0" data-flag="128" data-res-action="fav" class="u-btni u-btni-fav "
                                       href="javascript:;" onclick="openSZ(${music.musicId});">
                                        <i>收藏</i>
                                    </a>

                                    <a data-res-id="482999668" data-res-type="18" data-res-action="download"
                                       class="u-btni u-btni-dl " href="/music/mp3/${music.musicId}.mp3" download="${music.musicName}-${music.singerName}"><i>下载</i></a>
                                    <a data-res-action="comment" href="javascript:;"
                                       class="u-btni u-btni-cmmt " ONCLICK="getFocus();"><i>(<span
                                            id="cnt_comment_count" class="cNum">${commentNum}</span>)</i></a>
                                </div>
                            </div>
                            <%--歌词--%>
                            <div id="lyric-content" class="bd bd-open f-brk f-ib" data-song-id="482999668"
                                 data-third-copy="false" ,="" copy-from="">
                                <c:forEach items="${list}" var="ly" begin="0" end="12">
                                    ${ly}<br/>
                                </c:forEach>
                                <div id="flag_more" class="" style="display: none">
                                <c:forEach items="${list}" var="ly" begin="13">
                                    ${ly}<br/>
                                </c:forEach>
                                </div>
                                <div class="crl">
                                    <a  href="javascript:void(0)" id="zk"class="s-fc7 zk" style="display: block">展开<i
                                        class="u-icn u-icn-69"></i></a>
                                    <a  href="javascript:void(0)" id="sq" class="s-fc7 sq" style="display: none">收起<i
                                            class="u-icn u-icn-69"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="commentAll">
                    <!--评论区域 begin-->
                    <div class="reviewArea clearfix">
                        <textarea  id="comment-text" class="content comment-input" placeholder="评论一下吧(。・∀・)ノ&hellip;" onkeyup="keyUP(this)"></textarea>
                        <a href="javascript:;" class="plBtn">评论</a>
                    </div>
                    <!--评论区域 end-->
                    <!--回复区域 begin-->
                    <p style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif">精彩评论</p>
                    <div class="comment-show">
                        <c:forEach items="${hcommentList}" var="comment">
                            <div class="comment-show-con clearfix">
                                <div class="comment-show-con-img pull-left"><img src="/user/images/${comment.userImage}" height="50" width="50" alt=""></div>
                                <div class="comment-show-con-list pull-left clearfix">
                                    <div class="pl-text clearfix">
                                        <a href="/home?otherId=${comment.userId}" class="comment-size-name">${comment.nickname} : </a>
                                        <span class="my-pl-con">&nbsp;${comment.content}</span>
                                    </div>

                                    <div class="date-dz">
                                        <span class="date-dz-left pull-left comment-time">${comment.createtime}</span>
                                        <div class="date-dz-right pull-right comment-pl-block">
                                            <c:if test="${user.id==comment.userId}">
                                                <a href="javascript:;" class="removeBlock">删除<i class="commentId"  style="display: none">${comment.id}</i></a>
                                            </c:if>
                                            <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                            <span class="pull-left date-dz-line">|</span>
                                            <c:if test="${comment.state==0}">
                                                <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.likenum}</i>
                                                    <i class="commentId"  style="display: none">${comment.id}</i>
                                                    <i class="commentUserId"  style="display: none">${comment.userId}</i>)</a>
                                            </c:if>
                                            <c:if test="${comment.state==1}">
                                                <a href="javascript:;" class="date-dz-z pull-left date-dz-z-click"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.likenum}</i>
                                                    <i class="commentId"  style="display: none">${comment.id}</i>
                                                    <i class="commentUserId"  style="display: none">${comment.userId}</i>)</a>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="hf-list-con"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <p style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif">最新评论(<i style="font-style: normal" class="cNum2">${commentNum}</i>)</p>
                    <div class="comment-show">
                        <c:forEach items="${commentList}" var="comment">
                            <div class="comment-show-con clearfix">
                                <div class="comment-show-con-img pull-left"><img src="/user/images/${comment.userImage}" height="50" width="50" alt=""></div>
                                <div class="comment-show-con-list pull-left clearfix">
                                    <div class="pl-text clearfix">
                                        <a href="/home?otherId=${comment.userId}" class="comment-size-name">${comment.nickname} : </a>
                                        <span class="my-pl-con">&nbsp;${comment.content}</span>
                                    </div>

                                    <div class="date-dz">
                                        <span class="date-dz-left pull-left comment-time">${comment.createtime}</span>
                                        <div class="date-dz-right pull-right comment-pl-block">
                                            <c:if test="${user.id==comment.userId}">
                                                <a href="javascript:;" class="removeBlock">删除<i class="commentId"  style="display: none">${comment.id}</i></a>
                                            </c:if>
                                            <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                            <span class="pull-left date-dz-line">|</span>
                                            <c:if test="${comment.state==0}">
                                                <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.likenum}</i>
                                                    <i class="commentId"  style="display: none">${comment.id}</i>
                                                    <i class="commentUserId"  style="display: none">${comment.userId}</i>)</a>
                                            </c:if>
                                            <c:if test="${comment.state==1}">
                                                <a href="javascript:;" class="date-dz-z pull-left date-dz-z-click"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">${comment.likenum}</i>
                                                    <i class="commentId"  style="display: none">${comment.id}</i>
                                                    <i class="commentUserId"  style="display: none">${comment.userId}</i>)</a>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="hf-list-con"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <!--回复区域 end-->
                </div>





            </div>
        </div>
    </div>
</div>
    <!--确认删除歌单-->
    <div id="delMenu" class="auto-1556085610368 m-layer z-show m-layer-w2" style="top: 128.5px; left: 480px;display: none">
        <div class="zbar" id="auto-id-7QfNNPd1Me7XZbIH">
            <div class="zttl f-thide">提示</div></div>
        <div class="zcnt">
            <div class="lyct f-cb f-tc" id="auto-id-3oe54K2zAXv8pFJ6">
                <div class="f-fs1" style="line-height:22px;">确定删除歌单?</div>
                <div class="lybtn">
                    <a hidefocus="true" class="u-btn2 u-btn2-2 u-btn2-w2" onclick="delMenu();" href="javascript:;" data-action="ok"><i>确定</i></a><a hidefocus="true" class="u-btn2 u-btn2-1 u-btn2-w2" href="javascript:;" onclick="closeDelMenu();" data-action="close"><i>取消</i></a></div></div></div>
        <span class="zcls" title="关闭窗体" onclick="closeDelMenu();" id="auto-id-AVd1aTKRKauOZdc1">×</span></div>
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
                            <span class="menu-close">关闭</span>
                        </div>
                        <ul class="audio-inline">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>

<!--新建歌单框-->
<div id="light" class="auto-1555851581913 m-layer z-show m-layer-w2" style=" display: none;top: 220px; left: 521px;">
    <div class="zbar" id="auto-id-Tm4vO9KhgnxkkVJa"><div class="zttl f-thide">新建歌单</div></div><div class="zcnt"><div class="lyct m-crgd f-cb f-tc" id="auto-id-KCTkx4TGQGIhv2Cc">
    <p>歌单名：<input type="text" class="u-txt j-flag" name="menuName" id="menuName"></p>
    <p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
    <div class="btn">
        <a href="javascript:;" onclick="severCheck();" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-p02hvU4waNw0kfEm"><i>新 建</i></a>
        <a href="javascript:;" onclick="closeDialog();" class="u-btn2 u-btn2-1 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-0Nv9JVTqcyvd1tTL"><i>取 消</i></a>
    </div>
</div></div><span class="zcls" title="关闭窗体" onclick="closeDialog();" id="auto-id-A1AOvvBWUVyekJ5U">×</span></div>

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

</body>
<!--收藏-->
<script type="text/javascript">
    $('.zk').click(function () {
        document.getElementById('flag_more').style.display="block";
        document.getElementById('zk').style.display="none";
        document.getElementById('sq').style.display="block";

    });
    $('.sq').click(function () {
        document.getElementById('flag_more').style.display="none";
        document.getElementById('sq').style.display="none";
        document.getElementById('zk').style.display="block";
    });

</script>
    <script type="text/javascript">

        function delMusic(musicId) {
            winw.location.href="delMusic?musicId="+musicId+"&menuId=${menu.menuId}";
        }
    var szmusicId=null;
    var flag_menuId=null;
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

                    document.getElementById('tips2').style.display='block';
                    setTimeout(function () {
                        document.getElementById('tips2').style.display='none';
                    },1000);


                }else {
                    document.getElementById('tips1').style.display='block';
                    setTimeout(function () {
                        document.getElementById('tips1').style.display='none';
                    },1000);

                }
            }
        });
    }

    function openDialog(){
        document.getElementById('light').style.display='block';
    }
    function closeDialog(){
        document.getElementById('light').style.display='none';
    }

</script>
<!--新建歌单-->
<script type="text/javascript">
    var musicId=${music.musicId};
    function severCheck() {
        var menuName=$("#menuName").val();
        $.ajax({
            type:"POST",
            url:'addMenu',
            data:{
                menuName:menuName,
                musicId:musicId
            },
            dataType:'json',
            cache:false,
            success:function (data) {
                closeDialog();
                if(200==data.status){
                    document.getElementById('tips2').style.display='block';
                    setTimeout(function () {
                        document.getElementById('tips2').style.display='none';
                    },1000);
                }else if(201==data.status){

                    document.getElementById('tips1').style.display='block';
                    setTimeout(function () {
                        document.getElementById('tips1').style.display='none';
                    },1000);
                }
            }
        });
    }
    function openDialog(){
        document.getElementById('light').style.display='block';
    }
    function closeDialog(){
        document.getElementById('light').style.display='none';
    }
</script>

<script type="text/javascript">
    function getFocus() {
        var comment=document.getElementById('comment-text');
        comment.focus();
    }
</script>
<script>
    /*
    此插件textarea的高度是 height:100%; 继承父元素的高度 ==> 父元素只有一个 position:relative; 用于定位textarea
    页面中加载完毕又添加了pre标签，pre标签是以块元素存在的并且不可见，但是占用空间，
    不像display:none;什么空间也不占。
    所以textarea父元素的高度是通过pre撑开的(在textarea里面写入文字，文字会被添加到pre底下的span标签里，以此来撑开pre的高度)

    要改变textarea初始化时的高度，只需改变pre的padding值即可，页面加载时pre里面添加<br />标签是为了让pre标签初始时有个高度
 */
    ;(function ($) {

        // Constructor
        function FT(elem) {
            this.$textarea = $(elem);

            this._init();
        }

        FT.prototype = {
            _init: function () {
                var _this = this;

                // Insert wrapper elem & pre/span for textarea mirroring
                this.$textarea.wrap('<div class="flex-text-wrap" />').before('<pre class="pre"><span /><br /></pre>');

                this.$span = this.$textarea.prev().find('span');

                // Add input event listeners
                // * input for modern browsers
                // * propertychange for IE 7 & 8
                // * keyup for IE >= 9: catches keyboard-triggered undos/cuts/deletes
                // * change for IE >= 9: catches mouse-triggered undos/cuts/deletions (when textarea loses focus)
                this.$textarea.on('input propertychange keyup change', function () {
                    _this._mirror();
                });

                // jQuery val() strips carriage return chars by default (see http://api.jquery.com/val/)
                // This causes issues in IE7, but a valHook can be used to preserve these chars
                $.valHooks.textarea = {
                    get: function (elem) {
                        return elem.value.replace(/\r?\n/g, "\r\n");
                    }
                };

                // Mirror contents once on init
                this._mirror();
            }

            // Mirror pre/span & textarea contents
            ,_mirror: function () {
                this.$span.text(this.$textarea.val());
            }
        };

        // jQuery plugin wrapper
        $.fn.flexText = function () {
            return this.each(function () {
                // Check if already instantiated on this elem
                if (!$.data(this, 'flexText')) {
                    // Instantiate & store elem + string
                    $.data(this, 'flexText', new FT(this));
                }
            });
        };

    })(jQuery);</script>
<!--textarea高度自适应-->
<script type="text/javascript">
    $(function () {
        $('.content').flexText();
    });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        console.log(oSize);
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img height="50" width="50" src="/user/images/${user.image}" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">${user.nickname} : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i> <i class="commentId"  style="display: none">0</i>\n' +
            '                                            <i class="commentUserId"  style="display: none">${user.id}</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';

        if(oSize.replace(/(^s*)|(s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }

        $.ajax({
            type:"POST",
            url:'addComment',
            data:{
                musicId:${music.musicId},
                userId:${user.id},
                content:oSize
            },
            dataType:'json',
            cache:false,
            success:function (result) {
                if(result.status==200){
                    console.log("评论成功");
                    var cNum2=$('.commentAll').find('.cNum2').html();
                    cNum2++;
                    $('.commentAll').find('.cNum2').html(cNum2);
                    $('.cnt').find('.cNum').html(cNum2);

                }else{
                    console.log("评论失败");
                }
            }
        })
    });


</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("replyjson",function(data){
                var oAt = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                });

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">${user.nickname} : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">0</i>)</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();


        var commentId=$(this).find('.commentId').html();
        console.log(commentId);
        $.ajax({
            type:"post",
            url:"delComment",
            data:{
                commentId:commentId
            },
            dataType:'json',
            cache:false,
            success:function (result) {
                if(result.status==200){
                    var cNum2=$('.commentAll').find('.cNum2').html();
                    cNum2--;
                    $('.commentAll').find('.cNum2').html(cNum2);
                    $('.cnt').find('.cNum').html(cNum2);
                    console.log("删除评论成功");
                }

            }

        })
    })
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        var musicId=${music.musicId};
        var commentId=$(this).find('.commentId').html();
        var commentUserId=$(this).find('.commentUserId').html();
        var userId=${user.id}
        var state=0;
        console.log("评论id   "+commentId);
        console.log("用户id   "+userId);

        if($(this).is('.date-dz-z-click')){
            state=1;
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');

        }else {
            state=0;
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
        $.ajax({
            type:"POST",
            url:"dianzan",
            data:{
                commentId:commentId,
                commentUserId:commentUserId,
                userId:userId,
                state:state
            },
            dataType:"json",
            cache:false,
            success:function (result) {

                console.log(result.msg);

            }
        })

    })
    $('.m-back').click(function () {
        window.scrollTo(0, 1);
    });

</script>
</html>