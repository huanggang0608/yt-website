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
<script type="text/javascript">
    $('.m-back').click(function () {
        scrollTo(0,0);
    });
</script>
</html>