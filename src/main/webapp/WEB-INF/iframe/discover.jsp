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
                    <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13" data-res-id="2664947226" data-res-action="play"
                       onclick="window.parent.way('${music.musicId}','${music.musicName}','${music.singerName}',true)"></a>
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
    $('.m-back').click(function () {
        scrollTo(0,0);
    });
</script>
</html>