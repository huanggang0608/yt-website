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
       
	</head>

	<body>

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
					<a href="index">
						<li class="li_1">首页</li>
					</a>
					<a href="javascript:void(0);" onclick="checkLogin();">
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
			<!--轮播图-->
			<div id="slideshow">
				<p class="lefta">&lt;</p><input type="button" class="left_frame" onclick="LeftSlide()" />
				<p class="righta">&gt;</p><input type="button" class="right_frame" onclick="reightSlide()" />
				<div id="slideshow-box">
					<div class="slideshow-circle" onclick="way(1)" id="1"></div>
					<div class="slideshow-circle" onclick="way(2)" id="2"></div>
					<div class="slideshow-circle" onclick="way(3)" id="3"></div>
				</div>
				<img src="img/2.png" id="img"/>

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
                                        <a class="icon-play f-fr" title="播放" href="javascript:;" data-res-type="13" data-res-id="2664947226" data-res-action="play"></a>
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
		<audio id="myaudio" src="" controls="controls" loop="false" hidden="true">
		</audio>
		<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
	</body>
<script type="text/javascript">
    function checkLogin() {
    var userId="<%= request.getAttribute("userId")%>";
    if(userId!=0){
    window.location.href="myMusic";
    }else{
    console.log("请先登录！");
    this.showsure();
    }
    }
	$('.m-back').click(function () {
		window.scrollTo(0, 1);
	});
</script>
</html>