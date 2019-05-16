<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" import="java.util.* ,com.example.ssmspringboot.controller.MusicController"
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
    <link href="https://s2.music.126.net/web/s/core_08ab69c917b257e8d34b944f658b66a6.css?08ab69c917b257e8d34b944f658b66a6"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_frame_49fff55527d8ef751c88fe269c3b303f.css?49fff55527d8ef751c88fe269c3b303f"
          type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="css/download/demo.css"/>
    <link rel="stylesheet" href="css/download/iconfont.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
    <link rel="stylesheet" href="css/Mymusic.css"/>
    <link rel="stylesheet" href="css/icon/demo.css"/>
    <link rel="stylesheet" href="css/icon/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="css/audio.css">

    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>

    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>
    <script type="text/javascript" src="js/audio.js"></script>

</head>

<body>
<div id="sample">

    <div id="m-playlist" class="g-bd4 f-cb">
        <div class="g-mn4">
            <div class="g-mn4c">
                <div class="g-wrap6">
                    <div class="m-info f-cb" id="auto-id-sIj3TLZqyy8umsn">
                        <div class="cover u-cover u-cover-dj">
                            <img src="music/images/${menu.menuImage}" style="height: 200px;width: 200px" class="j-img">
                            <span class="msk"></span>
                        </div>
                        <div class="cnt">
                            <div class="cntc">
                                <div class="hd f-cb">
                                    <i class="f-fl u-icn u-icn-13"></i>
                                    <div class="tit">
                                        <h2 class="f-ff2 f-brk">${menu.menuName}</h2>
                                    </div>
                                </div>
                                <div class="user f-cb">
                                    <a class="face" href="/home?otherId=${other.id}"><img
                                            src="user/images/${other.image}" style="width: 40px;height: 40px"></a>
                                    <span class="name">
<a href="/home?otherId=${other.id}" class="s-fc7">${other.nickname}</a>
</span>
                                    <sup class="u-icn u-icn-84 "></sup>
                                    <span class="time s-fc4">${menu.createtime}&nbsp;创建</span>
                                </div>
                                <div id="content-operation" class="btns f-cb" data-rid="2754515548" data-type="13"
                                     data-special="0">
                                    <a data-res-action="play" data-res-id="2754515548" data-res-type="13"
                                       href="javascript:;" class="u-btn2 u-btn2-2 u-btni-addply f-fl" hidefocus="true"
                                       title="播放"><i><em class="ply"></em>播放</i></a>
                                    <a data-res-action="addto" data-res-id="2754515548" data-res-type="13"
                                       href="javascript:;" class="u-btni u-btni-add" hidefocus="true"
                                       title="添加到播放列表"></a>
                                    <c:if test="${flag==0}">
                                        <a data-res-id="2754515548" data-res-type="13" data-count="1101"
                                           data-res-action="fav" id="col" class="u-btni u-btni-fav col" title="收藏" href="javascript:;">
                                           <i class="colNum">${colNum}</i>
                                        </a>
                                    </c:if>
                                    <c:if test="${flag!=0}">
                                        <a data-res-id="2754515548" data-res-type="13" data-count="1101"
                                           data-res-action="fav"  class="u-btni u-btni-fav " title="收藏" href="javascript:;"style="color: #bebebe">
                                            <i id="colNum">${colNum}</i>
                                        </a>
                                    </c:if>


                                </div>
                                <p id="album-desc-dot" class="intr f-brk"><b>介绍：</b>
                                    ${menu.presentation}
                                </p>

                                <%--<div class="f-cb"><a id="album-desc-spread" href="javascript:;" class="s-fc7 f-fr">展开<i
                                        class="u-icn u-icn-69"></i></a></div>--%>
                            </div>
                        </div>
                    </div>
                    <div class="n-songtb">
                        <div class="u-title u-title-1 f-cb">
                            <h3>
                                <span class="f-ff2">歌曲列表</span>
                            </h3>
                            <span class="sub s-fc3"><span id="playlist-track-count">${fn:length(musicList)}</span>首歌</span>
                        </div>
                        <div id="song-list-pre-cache" data-key="track_playlist-2754515548" data-simple="1"
                             data-pvnamed="1">
                            <div oncopy="return false;" oncut="return false;" ondragstart="return false;"
                                 id="auto-id-FCgQTWMlxnz4sv87">
                                <div class="j-flag" id="auto-id-lNhF66GPgG1UQ3aX">
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
                                            <tr id="5692053101556430393893" class="even ">
                                                <td class="left">
                                                    <div class="hd "><span data-res-id="569205310" data-res-type="18"
                                                                           data-res-action="play" data-res-from="13"
                                                                           data-res-data="2754515548"
                                                                           class="ply "onclick="window.parent.way('${music.musicId}','${music.musicName}','${music.singerName}',true)">&nbsp;</span><span
                                                            class="num">${st.index+1}</span></div>
                                                </td>
                                                <td class="">
                                                    <div class="f-cb">
                                                        <div class="tt">
                                                            <div class="ttc"><span class="txt"><a href="/music?musicId=${music.musicId}"><b
                                                                    title="${music.musicName}">${music.musicName}</b></a></span></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class=" s-fc3"><span class="u-dur ">${music.musicTime}</span>
                                                    <div class="opt hshow"><a class="u-icn u-icn-81 icn-add"
                                                                              href="javascript:;" title="添加到播放列表"
                                                                              hidefocus="true" data-res-type="18"
                                                                              data-res-id="569205310"
                                                                              data-res-action="addto" data-res-from="13"
                                                                              data-res-data="2754515548" onclick="window.parent.way('${music.musicId}','${music.musicName}','${music.singerName}',false)"></a>
                                                        <span
                                                                data-res-id="452986351" data-res-type="18" data-res-action="fav"
                                                                class="icn icn-fav" title="收藏" onclick="openSZ(${music.musicId});"></span>
                                                        <a
                                                                data-res-id="452986351" data-res-type="18" data-res-action="download"
                                                                class="icn icn-dl" href="/music/mp3/${music.musicId}.mp3" download="${music.musicName}" title="下载"></a>
                                                    </div>
                                                </td>
                                                <td class="">
                                                    <div class="text" title="${music.singerName}"><span title="${music.singerName}"><a class=""
                                                                                                       href="javascript:void(0)"
                                                                                                       hidefocus="true">${music.singerName}</a></span></div>
                                                </td>
                                                <td class="">
                                                    <div class="text"><a href="javascript:void(0)" title="${music.album}">${music.album}</a></div>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="j-flag"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="g-sd4">
            <div class="g-wrap7">
                <div id="j-music-ad" class="m-sidead f-hide" data-has-music-ad="0">
                    <div class="j-flag f-hide" id="auto-id-AzaGSUtmbwf1vrQp"></div>
                    <div class="f-hide j-flag">
                        <ins class="adsbydm" inner-prod="adbid" inner-width="200" inner-height="220"
                             inner-src="https://iad.g.163.com/wa/ad?site=netease&amp;affiliate=music&amp;cat=detail&amp;type=logo200x220&amp;location=1"
                             check-src="https://iad.g.163.com/wa/ad_check?site=netease&amp;affiliate=music&amp;cat=detail&amp;type=logo200x220&amp;location=1">
                            <div>
                                <iframe id="058bf27ed75e4a9cbd4b9e294e10d92d" width="200" height="220" prod="adbid"
                                        frameborder="0" scrolling="no" border="0"
                                        src="https://iad.g.163.com/wa/ad?site=netease&amp;affiliate=music&amp;cat=detail&amp;type=logo200x220&amp;location=1&amp;uuid=058bf27ed75e4a9cbd4b9e294e10d92d"></iframe>
                            </div>
                        </ins>
                    </div>
                </div>
                <h3 class="u-hd3">
                    <span class="f-fl">喜欢这个歌单的人</span>
                </h3>
                <ul class="m-piclist f-cb">
                    <c:forEach items="${userList}" var="user">
                        <li>
                            <a href="/home?otherId=${user.id}" class="f-tdn" title="${user.nickname}">
                                <img src="user/images/${user.image}" style="height: 40px;width: 40px">
                            </a>
                        </li>

                    </c:forEach>
                  <%--  <li>
                        <a href="/user/home?id=432579910" class="f-tdn" title="_偷心大盗_"><img
                                src="http://p1.music.126.net/gLW-VU23Sj8EXFka08n8HQ==/109951163785926013.jpg?param=40y40">
                        </a></li>
                    <li>
                        <a href="/user/home?id=1489497866" class="f-tdn" title="梦醒终花落"><img
                                src="http://p1.music.126.net/ma8NC_MpYqC-dK_L81FWXQ==/109951163250233892.jpg?param=40y40">
                        </a></li>--%>
                </ul>


            </div>
        </div>
    </div>
    <!--收藏弹框-->
    <div id="sz-show" class="auto-1556077290173 m-layer z-show m-layer-w2"
         style="top: 130px; left: 480px; display: none">
        <div class="zbar" id="auto-id-b4zf03B8iRlBbytU">
            <div class="zttl f-thide">添加到歌单</div>
        </div>
        <div class="zcnt">
            <div class="lyct lyct-1 m-favgd f-cb">
                <div class="tit j-flag" id="auto-id-Zbnc2rsp1z1IHZNi">
                    <i class="u-icn u-icn-33" onclick="addMenu();"></i>新歌单
                </div>
                <div class="j-flag" id="auto-id-53sLe7SbFUZo0JHm">
                    <ul>
                        <c:forEach items="${menuList}" var="menu">
                            <li data-id="475407140" class="xtag " onclick="addMusic(${menu.menuId});">
                                <div class="item f-cb">
                                    <div class="left">
                                        <a href="javascript:void(0)" class="avatar" target="_blank">
                                            <img alt="" src="/music/images/${menu.menuImage}"
                                                 style="height: 40px;width: 40px"/>
                                        </a>
                                    </div>
                                    <p class="name f-thide">
                                        <a class="s-fc0" href="javascript:void(0)" target="_blank">${menu.menuName}</a>
                                    </p>
                                    <p class="s-fc3">${menu.musicAmount}首</p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <span class="zcls" title="关闭窗体" onclick="closeSZ();" id="auto-id-88dNPXp0u8zWHzo0">×</span></div>
    <!--歌曲已存在-->
    <div id="tips1" class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd"
         style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-32"></i><span>歌曲已存在！</span></div>
    </div>
    <!--收藏成功-->
    <div id="tips2" class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd"
         style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-31"></i><span>收藏成功</span></div>
    </div>

</div>
<!--新建歌单框-->
<div id="light" class="auto-1555851581913 m-layer z-show m-layer-w2" style="top: 220px; left: 521px;">
    <div class="zbar" id="auto-id-Tm4vO9KhgnxkkVJa">
        <div class="zttl f-thide">新建歌单</div>
    </div>
    <div class="zcnt">
        <div class="lyct m-crgd f-cb f-tc" id="auto-id-KCTkx4TGQGIhv2Cc">
            <p>歌单名：<input type="text" class="u-txt j-flag" name="menuName" id="menuName"></p>
            <p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
            <div class="btn">
                <a href="javascript:;" onclick="severCheck();" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" hidefocus="true"
                   id="auto-id-p02hvU4waNw0kfEm"><i>新 建</i></a>
                <a href="javascript:;" onclick="closeDialog();" class="u-btn2 u-btn2-1 u-btn2-w2 j-flag"
                   hidefocus="true" id="auto-id-0Nv9JVTqcyvd1tTL"><i>取 消</i></a>
            </div>
        </div>
    </div>
    <span class="zcls" title="关闭窗体" onclick="closeDialog();" id="auto-id-A1AOvvBWUVyekJ5U">×</span></div>

<audio id="myaudio" src="" controls="controls" loop="false" hidden="true">
</audio>

<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>
<script type="text/javascript">
    function delMusic(musicId) {
        window.location.href = "delMusic?musicId=" + musicId + "&menuId=${menu.menuId}";
    }

    var szmusicId = null;
    var flag_menuId = null;

    function openSZ(musicId) {
        szmusicId = musicId;
        document.getElementById('sz-show').style.display = 'block';
    }
    $('.col').click(function () {
        collect();
    });
    function collect() {
        var menuId=${menu.menuId};
        var otherId=${other.id};
        console.log("歌单ID："+menuId);
        console.log("歌单用户ID："+otherId);
        $.ajax({
            type:"post",
            url:"addColMenu",
            data:{
                menuId:menuId,
                otherId:otherId
            },
            dataType: 'json',
            cache: false,
            success:function(data){
                if(data.status==200){

                    document.getElementById('tips2').style.display='block';
                   var colNum= $('.u-btni').find('.colNum').html();
                   colNum++;

                    $('.u-btni').find('.colNum').html(colNum);
                    setTimeout(function () {
                        document.getElementById('tips2').style.display='none';
                    },1200);
                    $('.col').unbind('click');
                    $('.col').style.color='#bebebe';
                }
            }
        });

    }
    function closeSZ() {
        document.getElementById('sz-show').style.display = 'none';
    }

    function addMenu() {
        closeSZ();
        openDialog();
    }

    function addMusic(menuId) {
        console.log(szmusicId);
        $.ajax({
            type: "POST",
            url: 'addMusic',
            data: {
                menuId: menuId,
                musicId: szmusicId
            },
            dataType: 'json',
            cache: false,
            success: function (data) {
                closeSZ();
                if (data.status == 200) {

                    document.getElementById('tips2').style.display = 'block';
                    setTimeout(function () {
                        document.getElementById('tips2').style.display = 'none';
                    }, 1200);


                } else {
                    document.getElementById('tips1').style.display = 'block';
                    setTimeout(function () {
                        document.getElementById('tips1').style.display = 'none';
                    }, 1200);

                }
            }
        });
    }
</script>
<script type="text/javascript">
    $('.m-back').click(function () {
        scrollTo(0,0);
    });
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
</html>