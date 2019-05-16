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

        <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="js/index.js"></script>
        <script type="text/javascript" src="js/jquery.tips.js"></script>

		<link rel="shortcut icon" href="favicon.ico"/>
		<link rel="bookmark" href="favicon.ico" />
       <script type="text/javascript">
           /*8秒轮播*/
           setInterval(reightSlide,8000);
       </script>
	</head>

	<body>

		<div id="sample">

			<!--轮播图-->
			<div id="slideshow">
				<p class="lefta">&lt;</p><input type="button" class="left_frame" onclick="LeftSlide()" />
				<p class="righta">&gt;</p><input type="button" class="right_frame" onclick="reightSlide()" />
				<div id="slideshow-box">
					<div class="slideshow-circle" onclick="ways(1)" id="1"></div>
					<div class="slideshow-circle" onclick="ways(2)" id="2"></div>
					<div class="slideshow-circle" onclick="ways(3)" id="3"></div>
				</div>
				<img src="index/2.png" id="img"/>

			</div>
            <div class="g-bd" id="m-disc-pl-c">

                <div class="g-wrap p-pl f-pr">

                        <div class="v-hd2">
                            <a href="/discover/playlist/" class="tit f-ff2 f-tdn">热门推荐</a>
                            <div class="tab">
                                <a href="/discover?type=华语" class="s-fc3">华语</a>
                                <span class="line">|</span>
                                <a href="/discover?type=流行" class="s-fc3">流行</a>
                                <span class="line">|</span>
                                <a href="/discover?type=摇滚" class="s-fc3">摇滚</a>
                                <span class="line">|</span>
                                <a href="/discover?type=民谣" class="s-fc3">民谣</a>
                                <span class="line">|</span>
                                <a href="/discover?type=电子" class="s-fc3">电子</a>
                            </div>
                            <span class="more"><a href="/discover?type=全部" class="s-fc3">更多</a><i class="cor s-bg s-bg-6">&nbsp;</i></span>
                        </div>
                    <ul class="m-cvrlst f-cb" id="m-pl-container">
                        <c:forEach items="${hotMusicList}" var="music" begin="0" end="9">
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
                                    <a title="${music.musicName}" href="music?musicId=${music.musicId}" class="tit f-thide s-fc0">${musicName}</a>
                                </p>
                                <p><span class="s-fc4">by</span> <a title="${music.singerName}" href="#" class="nm nm-icn f-thide s-fc3">${music.singerName}</a> <sup class="u-icn u-icn-84 "></sup>
                                </p>
                            </li>
                        </c:forEach>



                    </ul>

                    </div>
                </div>
            </div>

			<!--版权-->
			<div id="copyright">
				<div class="copyright-box">
					<ul class="copyright-box-ul">
						<li>
							<a href="##">关于我们</a>
						</li>
						<li>|</li>
						<li>
							<a href="##">联系我们</a>
						</li>
						<li>|</li>
						<li>
							<a href="##">客户服务</a>
						</li>
						<li>|</li>
						<li>
							<a href="##">意见反馈</a>
						</li>
					</ul>
					<br/>
					<p> 本网站为个人所有，不得用在商业。</p>
				</div>
			</div>
		</div>
		<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
	</body>
<script type="text/javascript">
    $('.m-back').click(function () {
        scrollTo(0,0);
    });
</script>
</html>