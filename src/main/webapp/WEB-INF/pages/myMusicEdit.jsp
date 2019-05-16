<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>

    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>


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
    <div id="navigation" style="height: 48px;">
        <ul style="margin-top: 14px;">
            <a href="index">
                <li class="li_1">首页</li>
            </a>
            <a href="myMusic">
                <li class="li_2">我的音乐</li>
            </a>
            <a href="#">
                <li class="li_3">朋友</li>
            </a>
            <a href="#">
                <li class="li_4">商城</li>
            </a>
            <a href="#">
                <li class="li_5">音乐人</li>
            </a>
        </ul>
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
    </div>

    <div class="g-bd3 f-cb" style="min-height: auto">


        <div class="g-sd3 u-scroll n-musicsd f-pr j-flag" style="height: auto">

            <!--创建的歌单-->
            <div id="auto-id-6CCZiimziVQx7UXC">
                <div class="n-minelst n-minelst-1" style="margin-top:8px;">
                    <h2 class="f-ff1">
                        <a hidefocus="true" href="javascript:void(0);" class="f-fr" onclick="openDialog()"><i>＋新建</i></a>
                        <span class="rtitle" data-action="spread"><i class="tri tri1"></i>创建的歌单(<span
                                class="j-flag">${fn:length(menuList)}</span>)</span>
                    </h2>
                    <c:forEach items="${menuList}" var="menu">
                        <ul class="j-flag f-cb">
                            <li class="j-iflag" id="${menu.menuId}" data-matcher="playlist-475407140">
                                <div class="item f-cb">
                                    <div class="left"><a hidefocus="true" class="avatar"><img
                                            src="/music/images/${menu.menuImage}" style="height: 40px;width: 40px"
                                            alt=""></a></div>
                                    <p class="name f-thide"><a hidefocus="true" href="/myMusic2?menuId=${menu.menuId}&userId=${user.id}" class="s-fc0"
                                                               title="${menu.menuName}">${menu.menuName}</a></p>
                                    <p class="s-fc4 f-thide num">${menu.musicAmount}首</p></div>
                                <c:if test="${menu.menuName!='我喜欢的音乐'}">
                                     <span class="oper hshow" style="display: block;">
                                    <a hidefocus="true" title="编辑" href="myMusic/edit?menuId=${menu.menuId}"  class="u-icn u-icn-10"></a>
                                    <a data-action="delete" hidefocus="true" title="删除" onclick=" openDelMenu(${menu.menuId});" class="u-icn u-icn-11"></a>
                                </span>
                                </c:if>

                            </li>
                        </ul>
                    </c:forEach>
                </div>
                <div style="height:100px;"></div>
            </div>

        </div>

        <div class="g-mn3 f-pr j-flag">
            <!--歌单编辑-->
            <div class="g-wrap" id="auto-id-oMkIrLz0Hk8SFupc"><div>
                <div class="u-bread1">
                    <a href="javascript:void(0)" class="s-fc7">${user.nickname}</a>
                    <span class="arr s-fc4">&gt;</span>
                    <span class="f-fw1">编辑歌单</span></div>
                <form name="form1" action="myMusic/edit/save" method="post" enctype="multipart/form-data">
                <div class="n-base f-cb">
                    <div class="frm frm-1 m-frm m-frm-1">
                        <div class="itm">
                            <span class="must s-fc6">*</span>
                            <label class="lab">歌单名：</label>
                            <input type="text" class="u-txt txt j-flag" name="menuName" value="${menu.menuName}" id="auto-id-w7o4xqWMLcqFFQAW"/>
                           <input type="hidden" value="${menu.menuId}" name="menuId"/>
                            <div class="u-err f-vhide j-flag">
                                <i class="u-icn u-icn-25"></i></div></div>

                        <div class="itm f-cb">
                            <label class="lab">介绍：</label>
                            <div class="u-txtwrap f-pr">
                                <textarea name="presentation" class="u-txt area j-flag" id="auto-id-7PuuDw6k5F2l0Qxt">${menu.presentation}</textarea>
                                <span class="zs s-fc2 j-flag">100</span></div></div>
                        <div class="itm ft">
                          <%--  <input type="submit" data-action="save"  hidefocus="true" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" >保 存</input>--%>
                            <a href="javascript:document.form1.submit();" data-action="save"  hidefocus="true" class="u-btn2 u-btn2-2 u-btn2-w2 j-flag" ><i>保 存</i></a>
                            <a data-action="cc" href="javascript:void(0)"  onclick="javascript:history.back(-1);" hidefocus="true" class="u-btn2 u-btn2-1 u-btn2-w2"><i>取 消</i></a></div></div>
                    <div class="avatar f-pr"id="pic">
                        <img id="edit_cover" src="music/images/${menu.menuImage}" />
                        <span class="btm">

                        </span>
                        <a href="javascript:void(0);" class="upload" onclick="changeImage()">编辑封面</a>

                        <input class="upload"  style="display: none"type="file" name="file" id="editImage" value="编辑封面" accept="image/jpg,image/jpeg,image/png,image/bmp">
                    </div></div>
                </form>
            </div></div>
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
<!--保存失败-->
    <div id="tips1"class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd" style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-32"></i><span>保存失败！</span></div></div>
   <!--保存成功-->
    <div id="tips2"class="auto-1556085610369 m-sysmsg" id="auto-id-D8Xa6UxKCybfChUd" style="top: 190px; left: 580px; display: none">
        <div class="sysmsg"><i class="u-icn u-icn-31"></i><span>保存成功</span></div></div>
    <!--播放栏-->
    <div class="audio-box">
        <div class="audio-container">
            <div class="audio-cover"></div>
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
                    <div class="audio-list">
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


<audio id="myaudio" src="" controls="controls" loop="false" hidden="true">
</audio>
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>

<script type="text/javascript">
    var szmusicId=null;
    var flag_menuId=null;
    var menuId=${menu.menuId};

    function closeSZ() {
        document.getElementById('sz-show').style.display='none';
    }
    function openDelMenu(menuId) {
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
        window.location.href="delMenu?menuId="+flag_menuId;
    }

    function saveEdit() {
        var menuName=$("#auto-id-w7o4xqWMLcqFFQAW").val();
        var file=$('.upload').val();
        var presentation=$("#auto-id-7PuuDw6k5F2l0Qxt").val();
    $.ajax({
        type:"POST",
        url:"myMusic/edit/save",
        data:{
            menuId:menuId,
            file:file,
            menuName:menuName,
            presentation:presentation
        },
        dataType:'json',
        cache:'false',
        success:function(data){
            if(data.status=200){
                document.getElementById('tips2').style.display='block';
                setTimeout(function () {
                    window.location.href="myMusic2?menuId=${menu.menuId}";
                },900);
            }
            else {
                document.getElementById('tips1').style.display='block';
                setTimeout(function () {
                    window.location.href="myMusic2?menuId=${menu.menuId}";
                },900);
        }
        }
    });
  }
        function changeImage() {
            $('#editImage').click();
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
                        window.location.href="myMusic2?menuId=${menu.menuId}";
                    },1500);


                }else {
                    document.getElementById('tips1').style.display='block';
                    setTimeout(function () {
                        window.location.href="myMusic2?menuId=${menu.menuId}";
                    },1500);

                }
            }
        });
    }
<!--显示图片-->

    $("#editImage").change(function(){
        $("#edit_cover").attr("src",URL.createObjectURL($(this)[0].files[0]));
    });

</script>
<script type="text/javascript">
    var userId=${user.id};
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
                    window.location.href="myMusic?userId="+userId;
                    console.log("userId"+userId);
                }else if(201==data.status){

                    $("#menuName").tips({
                        side:1,
                        msg:"歌单名已存在",
                        bg:'#FF5080',
                        time:5
                    });
                    //showfh();
                    $("#menuName").focus();
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

<%--播放条--%>
<%--<div class="g-btmbar">
    <div class="m-playbar m-playbar-unlock" style="top: -7px; visibility: visible;" id="auto-id-1fITNdJwTdvhqfZE">
        <div class="updn">
            <div class="left f-fl"><a href="javascript:;" class="btn" hidefocus="true" data-action="lock"></a></div>
            <div class="right f-fl"></div>
        </div>
        <div class="bg"></div>
        <div class="hand" title="展开播放条"></div>
        <div class="wrap" id="g_player" style="margin-left: -498px;">
            <div class="btns">
                <a href="javascript:;" hidefocus="true" data-action="prev" class="prv" title="上一首(ctrl+←)">上一首</a>
                <a href="javascript:;" hidefocus="true" data-action="play" class="ply j-flag" title="播放/暂停(p)">播放/暂停</a>
                <a href="javascript:;" hidefocus="true" data-action="next" class="nxt" title="下一首(ctrl+→)">下一首</a>
            </div>
            <div class="head j-flag"><img src="http://s4.music.126.net/style/web2/img/default/default_album.jpg"><a href="javascript:;" hidefocus="true" class="mask"></a></div>
            <div class="play">
                <div class="j-flag words"></div>
                <div class="m-pbar" data-action="noop">
                    <div class="barbg j-flag" id="auto-id-pLzPz6IsTahSiTWd">
                        <div class="rdy" style="width:0%;"></div>
                        <div class="cur" style="width:0%;"><span class="btn f-tdn f-alpha" id="auto-id-htL4EMAfZnlZhSdn"><i></i></span></div>
                    </div>
                    <span class="j-flag time"><em>00:00</em> / 00:00</span>
                </div>
            </div>
            <div class="oper f-fl">
                <a href="javascript:;" hidefocus="true" data-action="like" class="icn icn-add j-flag" title="收藏">收藏</a>
                <a href="javascript:;" hidefocus="true" data-action="share" class="icn icn-share" title="分享">分享</a>
            </div>
            <div class="ctrl f-fl f-pr j-flag">
                <div class="m-vol" style="visibility:hidden;" id="auto-id-7QXeAAb4mAcKT0XF">
                    <div class="barbg"></div>
                    <div class="vbg j-t" id="auto-id-77STTToBWxOoG56b"><div class="curr j-t" style="height: 74.4px;"></div>
                        <span class="btn f-alpha j-t" style="top: 16.2px;"></span></div>
                </div>
                <a href="javascript:;" hidefocus="true" data-action="volume" class="icn icn-vol"></a>
                <a href="javascript:;" hidefocus="true" data-action="mode" class="icn icn-loop" title="循环"></a>
                <span class="add f-pr">
<span class="tip" style="display:none;">已添加到播放列表</span>
<a href="javascript:;" title="播放列表" hidefocus="true" data-action="panel" class="icn icn-list s-fc3">0</a>
</span>
                <div class="tip tip-1" style="display:none;">循环</div>
            </div>
        </div>
    </div>
</div>--%>

<%--<script type="text/javascript">
		
		var song=null;
		var audioFn=null; 
	/*$(function(){
		song = [
		
		<%
			low:for(int i=0;i<new MyMusic().getlowLength();i++){
				for(int j=0;j<1;j++){
					if(MyMusic.getmusicname(i,j)==null)
							break low;
			
				
		%>
			{
				'cover' : 'images/cover.jpg',
				'src' : '<%=MyMusic.getmusicname(i,1)%>',
				'title' : '<%=MyMusic.getmusicname(i,0)%>'
			},
			<%
				
								}
					}
					
			%>
		];
	
		audioFn = audioPlay({
			song : song,
			autoPlay : false  //是否立即播放第一首，autoPlay为true且song为空，会alert文本提示并退出
		});
	
		/!* 向歌单中添加新曲目，第二个参数true为新增后立即播放该曲目，false则不播放 *!/
		audioFn.newSong({
			'cover' : 'images/cover4.jpg',
			'src' : 'http://so1.111ttt.com:8282/2016/5/06m/06/199061931237.m4a?tflag=1494769315&pin=a0b26b2dddd976d74724841f6d2641d6&ip=114.233.172.33#.mp3',
			'title' : '极乐净土 - GARNiDELiA'
		},false);
		
				

		/!* 暂停播放 *!/
		//audioFn.stopAudio();
	
		/!* 开启播放 *!/
		//audioFn.playAudio();
	
		/!* 选择歌单中索引为3的曲目(索引是从0开始的)，第二个参数true立即播放该曲目，false则不播放 *!/
		//audioFn.selectMenu(3,true);
	
		/!* 查看歌单中的曲目 *!/
		//console.log(audioFn.song);
	
		/!* 当前播放曲目的对象 *!/
		//console.log(audioFn.audio);
	});*/
	function way(i){
		//alert("123")
		var stop=null;
		var play=null;
		play=document.getElementsByClassName("play")[0];
		stop=document.getElementsByClassName("stop")[0];
		//console.log(stop);
		//console.log(play);
		if(play!=null){
			audioFn.selectMenu(i,true);
			//play.src="img/ann3.png"
			//document.getElementById("butt").className="stop";
		}else if(stop!=null){
			//audioFn.stopAudio();
			//stop.src="img/ann2.png"
			//document.getElementById("butt").className="play";
			//stop=document.getElementsByClassName("play")[0];
		}
		
	}
	</script>--%>


</html>