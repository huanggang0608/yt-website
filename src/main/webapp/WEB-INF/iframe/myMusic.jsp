<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.* ,com.example.ssmspringboot.pojo.MyMusic"
         contentType="text/html; charset=utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">

    <title>悦听音乐</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link href="//s2.music.126.net/web/s/core_497ec9c9ed294e61babbfcc8dab817ec.css?497ec9c9ed294e61babbfcc8dab817ec" type="text/css" rel="stylesheet">
   <link href="//s2.music.126.net/web/s/pt_my_index_8709f5197ae71588e4e67de69b3024e2.css?8709f5197ae71588e4e67de69b3024e2" type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_65d7d59f18af32d903addbe070895505.css?65d7d59f18af32d903addbe070895505" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/download/demo.css"/>
    <link rel="stylesheet" href="css/download/iconfont.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
   <link rel="stylesheet" href="css/Mymusic.css"/>
    <link rel="stylesheet" href="css/icon/demo.css"/>
    <link rel="stylesheet" href="css/icon/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="css/audio.css">
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>


    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>
    <script type="text/javascript" src="js/audio.js"></script>
</head>

<body>
<div id="sample">

    <div class="g-bd3 f-cb" style="min-height: auto">


        <div class="g-sd3 u-scroll n-musicsd f-pr j-flag" style="height: auto">


            <div id="auto-id-6CCZiimziVQx7UXC">
                <!--创建的歌单-->
                <div class="n-minelst n-minelst-1 " style="margin-top:8px;display: block">
                    <h2 class="f-ff1">
                        <a hidefocus="true" href="javascript:void(0);" class="f-fr" onclick="openDialog()"><i>＋新建</i></a>
                        <span class="rtitle" data-action="spread"><i class="tri tri1 tri2"></i>创建的歌单(<span
                                class="j-flag">${fn:length(menuList)}</span>)</span>
                    </h2>
                    <ul class="j-flag f-cb cj">
                    <c:forEach items="${menuList}" var="menu">
                            <li class="j-iflag"  data-matcher="playlist-475407140">
                                <div class="item f-cb">
                                    <div class="left"><a hidefocus="true" class="avatar" href="/myMusic2?menuId=${menu.menuId}"><img
                                            src="/music/images/${menu.menuImage}" style="height: 40px;width: 40px"
                                            alt=""></a></div>
                                    <p class="name f-thide"><a hidefocus="true" href="/myMusic2?menuId=${menu.menuId}" class="s-fc0"
                                                               title="${menu.menuName}">${menu.menuName}</a></p>
                                    <p class="s-fc4 f-thide num">${menu.musicAmount}首</p></div>
                                <c:if test="${menu.menuName!='我喜欢的音乐'}">
                                     <span class="oper hshow" style="display: block;">
                                    <a hidefocus="true" title="编辑" href="myMusic/edit?menuId=${menu.menuId}"  class="u-icn u-icn-10"></a>
                                    <a data-action="delete" hidefocus="true" title="删除" onclick=" openDelMenu(${menu.menuId});" class="u-icn u-icn-11"></a>
                                </span>
                                </c:if>

                            </li>

                    </c:forEach>
                    </ul>

                </div>
                <!--收藏的歌单-->
                <div class="n-minelst n-minelst-1 " style="display: block">
                    <h2 class="f-ff1">
                        <span class="rtitle" data-action="spread">
                            <i class="tri tri1 tri3"></i>收藏的歌单(<span class="j-flag">${fn:length(colMenuList)}</span>)</span>
                    </h2>
                    <ul class="f-cb j-flag sz" >
                        <c:forEach items="${colMenuList}" var="col">

                        <li class="j-iflag" id="auto-id-ybDoEA0yBEWFGnDp" data-matcher="playlist-2768104554">
                            <div class="item f-cb">
                                <div class="left"><a hidefocus="true" class="avatar">
                                    <img
                                        src="/music/images/${col.menu.menuImage}" style="height: 40px;width: 40px;"
                                        alt=""></a></div>
                                <p class="name f-thide"><a hidefocus="true" href="/myMusic2?menuId=${col.menu.menuId}" class="s-fc0"
                                                           title="${col.menu.menuName}">${col.menu.menuName}</a>
                                </p>
                                <p class="s-fc4 f-thide num">${col.menu.musicAmount}首&nbsp;by ${col.ownerNickname}</p></div>
                            <span class="oper hshow" style="display: block;"><a data-action="delete" hidefocus="true"
                                                                               title="删除" href="javascript:void(0);"
                                                                               class="u-icn u-icn-11"onclick="openDelColMenu(${col.menu.menuId});"></a></span>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
                <div style="height:100px;"></div>

            </div>



        </div>

        <div class="g-mn3 f-pr j-flag">
            <div class="f-pr">
                <div class="j-flag" id="auto-id-yznv3y1GNo4dF7q6">
                    <div class="g-wrap">
                        <div class="m-info f-cb">
                            <div class="cover u-cover u-cover-dj"><img id="flag_cover"
                                                                       src="/music/images/${menu.menuImage}" style="height: 200px;width: 200px"><span
                                    class="msk"></span></div>
                            <div class="cnt">
                                <div class="cntc m-info">
                                    <div class="hd f-cb"><i class="type u-icn u-icn-13"></i>
                                        <c:if test="${menu.menuName!='我喜欢的音乐'}">
                                            <a href="myMusic/edit?menuId=${menu.menuId}"  class="edit s-fc7">编辑</a>
                                        </c:if>
                                        <h2 class="f-ff2 f-thide">${menu.menuName}</h2></div>
                                    <div class="user f-cb"><a class="face" href="#"><img
                                            src="/user/images/${user.image}"></a><span
                                            class="name f-thide"><a href="/home" class="s-fc7"
                                                                    title="${user.nickname}">${user.nickname}</a></span><span
                                            class="time s-fc4">${menu.createtime}&nbsp;创建</span></div>
                                    <div class="btns f-cb" id="flag_play_addto_btn_wrapper"><a id="flag_play"
                                                                                               href="javascript:;"
                                                                                               class="u-btn2 u-btn2-2 u-btni-addply f-fl"
                                                                                               hidefocus="true"
                                                                                               title="播放"
                                                                                               data-res-type="13"
                                                                                               data-res-id="475407140"
                                                                                               data-res-action="play"><i><em
                                            class="ply"></em>播放</i></a><a href="javascript:;" class="u-btni u-btni-add"
                                                                          hidefocus="true" title="添加到播放列表"
                                                                          data-res-type="13" data-res-id="475407140"
                                                                          data-res-action="addto"></a>
                                        <a data-res-id="475407140" data-res-type="13" data-res-action="fav"
                                            href="javascript:void(0)" hidefocus="true"
                                            class="u-btni u-btni-fav u-btni-fav-dis"><i>收藏</i></a>
                                      <a
                                            id="flag_dl" data-res-id="475407140" data-res-type="13"
                                            data-res-action="download" class="u-btni u-btni-dl"
                                            href="javascript:void(0)"><i>下载</i></a>
                                       <%-- <a id="flag_comment"
                                                                                      data-res-action="comment"
                                                                                      href="javascript:;"
                                                                                      class="u-btni u-btni-cmmt"><i>评论</i></a>--%>
                                    </div>
                                    <c:if test="${menu.presentation!=null}">
                                        <p class="intr f-brk"><b>介绍：</b>${menu.presentation}</p>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="u-title u-title-1 f-cb" ><h3><span class="f-ff2" style="margin-left: 30px">歌曲列表</span></h3><span class="sub s-fc3"><span
                            id="flag_trackCount">${fn:length(musicList)}</span>首歌</span>
                       <%-- <div class="more s-fc3">播放：<strong id="flag_playCount" class="s-fc6">406</strong>次</div>--%>
                    </div>
                </div>
                <div class="j-flag">
                    <div oncopy="return false;" oncut="return false;" ondragstart="return false;"
                         id="auto-id-oxiWexGQFhpTCHCM">
                        <c:if test="${fn:length(musicList)==0}">
                            <div class="n-nmusic">
                                <h3 class="f-ff2"><i class="u-icn u-icn-21"></i>暂无音乐！</h3>
                                <p class="txt s-fc4">点击<i class="u-icn u-icn-22"></i>即可将你喜欢的音乐收藏到“我的音乐”&nbsp;&nbsp;&nbsp;&nbsp;马上去<a href="index" class="s-fc7">发现音乐</a></p>
                            </div>
                        </c:if>
                        <c:if test="${fn:length(musicList)!=0}">
                            <div class="j-flag" id="auto-id-c5J2uTtItNkIXosl">
                                <table class="m-table ">
                                    <thead>
                                    <tr>
                                        <th class="first w1">
                                            <div class="wp">&nbsp;</div>
                                        </th>
                                        <th>
                                            <div class="wp af0"></div>
                                        </th>
                                        <th class="w2">
                                            <div class="wp af1"></div>
                                        </th>
                                        <th class="w3">
                                            <div class="wp af2"></div>
                                        </th>
                                        <th class="w4">
                                            <div class="wp af3"></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${musicList}" var="music" varStatus="st">
                                        <tr id="4529863511555838920284" class=" ">
                                            <td class="left">
                                                <div class="hd "><span data-res-id="452986351" data-res-type="18"
                                                                       data-res-action="play" data-res-from="13"
                                                                       data-res-data="475407140" class="ply ply2" onclick="window.parent.way('${music.musicId}','${music.musicName}','${music.singerName}',true)">&nbsp;</span><span
                                                        class="num">${st.index+1}</span></div>
                                            </td>
                                            <td class="">
                                                <div class="f-cb">
                                                    <div class="tt">
                                                        <div class="ttc"><span class="txt"><a href="/music?musicId=${music.musicId}&userId=${user.id}"><b
                                                                title="${music.musicName}">${music.musicName}</b></a></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class=" s-fc3"><span class="u-dur candel">${music.musicTime}</span>
                                                <div class="opt hshow">
                                                    <a class="u-icn u-icn-81 icn-add" href="javascript:;"
                                                                          title="添加到播放列表" hidefocus="true" data-res-type="18"
                                                                          data-res-id="452986351" data-res-action="addto"
                                                                          data-res-from="13" data-res-data="475407140" onclick="window.parent.way('${music.musicId}','${music.musicName}','${music.singerName}',false)"></a>

                                                    <span
                                                            data-res-id="452986351" data-res-type="18" data-res-action="fav"
                                                            class="icn icn-fav" title="收藏" onclick="openSZ(${music.musicId});"></span>
                                                    <a
                                                            data-res-id="452986351" data-res-type="18" data-res-action="download"
                                                            class="icn icn-dl" href="/music/mp3/${music.musicId}.mp3" download="${music.musicName}-${music.singerName}" title="下载"></a>
                                                    <span data-res-id="452986351"
                                                          data-res-type="18"
                                                          data-res-action="delete"
                                                          class="icn icn-del"
                                                          title="删除" onclick="delMusic(${music.musicId});">删除</span></div>
                                            </td>
                                            <td class="">
                                                <div class="text" title="${music.singerName}"><span title="${music.singerName}">
                                           <a class="" href="#" hidefocus="true">${music.singerName}</a></span></div>
                                            </td>
                                            <td class="">
                                                <div class="text"><a href="#" title="${music.album}">${music.album}
                                                </a></div>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </c:if>

                        <div class="j-flag"></div>
                    </div>
                </div>
            </div>-
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

</div>
<!--新建歌单框-->
<div id="light" class="auto-1555851581913 m-layer z-show m-layer-w2" style="top: 220px; left: 521px;">
    <div class="zbar" id="auto-id-Tm4vO9KhgnxkkVJa"><div class="zttl f-thide">新建歌单</div></div><div class="zcnt"><div class="lyct m-crgd f-cb f-tc" id="auto-id-KCTkx4TGQGIhv2Cc">
    <p>歌单名：<input type="text" class="u-txt j-flag" name="menuName" id="menuName"></p>
    <p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
    <div class="btn">
        <a href="javascript:;" onclick="severCheck();" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-p02hvU4waNw0kfEm"><i>新 建</i></a>
        <a href="javascript:;" onclick="closeDialog();" class="u-btn2 u-btn2-1 u-btn2-w2 j-flag" hidefocus="true" id="auto-id-0Nv9JVTqcyvd1tTL"><i>取 消</i></a>
    </div>
</div></div><span class="zcls" title="关闭窗体" onclick="closeDialog();" id="auto-id-A1AOvvBWUVyekJ5U">×</span></div>


<%--<iframe name="contentFrame" id="g_iframe" class="g-iframe" scrolling="auto" frameborder="0" src="/title.jsp" allowfullscreen="true">
    <p>no</p>>
</iframe>--%>
<input style="display: none" value="" id="musicId">
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="top: 140px;">回到顶部</a>
</body>
<script type="text/javascript">
    var flag=0;
    var flag1=0;
    $('.tri2').click(function () {
        if(flag==0){
            $('.cj').hide();
            flag=1;
        }else{
            $('.cj').show();
            flag=0;
        }


    });
    $('.tri3').click(function () {
        if(flag1==0){
            $('.sz').hide();
            flag1=1;
        }else{
            $('.sz').show();
            flag1=0;
        }


    });
</script>
<!--收藏音乐-->
<script type="text/javascript">

    function delMusic(musicId) {
        window.location.href="delMusic?musicId="+musicId+"&menuId=${menu.menuId}";
    }

    var flag_menuId=null;
    var flag=0;
    function openSZ(musicId) {
        var m=document.getElementById('musicId');
        m.value=musicId;
        console.log(m.value);
        document.getElementById('sz-show').style.display='block';
    }

    function closeSZ() {
        document.getElementById('sz-show').style.display='none';
    }
    function openDelMenu(menuId) {
        flag_menuId=menuId;
        document.getElementById('delMenu').style.display='block';
    }
    function openDelColMenu(menuId) {
        flag=1;
        flag_menuId=menuId;
        document.getElementById('delMenu').style.display='block';
    }
    function closeDelMenu() {

        document.getElementById('delMenu').style.display='none';
    }
    function addMenu() {
        closeSZ();
        openDialog();
    }
    function delMenu() {
        if(flag==0)
        {window.location.href="delMenu?menuId="+flag_menuId;}
        else{
            window.location.href="delColMenu?menuId="+flag_menuId;
            flag=0;
        }
    }

    function addMusic(menuId) {
        var m=document.getElementById('musicId');
        var musicId=m.value;
        $.ajax({
            type:"POST",
            url:'addMusic',
            data:{
                menuId:menuId,
                musicId:musicId
            },
            dataType:'json',
            cache: false,
            success:function (data) {
                closeSZ();
                if(data.status==200){

                    document.getElementById('tips2').style.display='block';
                    setTimeout(function () {
                        window.location.href="myMusic2?menuId=${menu.menuId}";
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
    var userId=${user.id};
    function severCheck() {
        var musicId=document.getElementById('musicId');

        console.log("新建id"+musicId.value);
        var menuName=$("#menuName").val();

        $.ajax({
            type:"POST",
            url:'addMenu',
            data:{
                menuName:menuName,
                musicId:musicId.value
            },
            dataType:'json',
            cache:false,
            success:function (data) {
                closeDialog();
                if(200==data.status){
                    window.location.href="myMusic2?menuId=${menu.menuId}";
                 /*   document.getElementById('tips2').style.display='block';
                    setTimeout(function () {

                    },1000);*/
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
<!--audio-->
<script type="text/javascript">

    $('.u-btni-add').click(function () {
        $('.icn-add').click();
    });
    $('.u-btni-addply').click(function () {
        $('.icn-add').click();
        window.parent.audioFn.selectMenu(0,true);
    });
</script>
<script type="text/javascript">
    $('.m-back').click(function () {
        scrollTo(0,0);
    });
</script>
</html>