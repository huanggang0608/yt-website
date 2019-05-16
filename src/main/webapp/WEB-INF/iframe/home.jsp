<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${user.username} - 用户 - 悦听音乐</title>
    <link rel="stylesheet" href="css/discover.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>

    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="//s2.music.126.net/web/s/core_497ec9c9ed294e61babbfcc8dab817ec.css?497ec9c9ed294e61babbfcc8dab817ec"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/core_ecf905c2264a250ea4e274cc53080eac.css?ecf905c2264a250ea4e274cc53080eac"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_profile_home_aacde839b771299940b3aed124a3cb2d.css?aacde839b771299940b3aed124a3cb2d"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_4c683000e2340dfda85c07f79ff9d1d4.css?4c683000e2340dfda85c07f79ff9d1d4"
          type="text/css" rel="stylesheet">

</head>

<div>
    <div id="sample">

        <div class="g-bd">
            <div class="g-wrap p-prf">
                <dl class="m-proifo f-cb" id="head-box">
                    <dt class="f-pr" id="ava">
                        <img src="user/images/${other.image}" style="height: 180px;width: 180px">
                    </dt>
                    <dd>
                        <div class="name f-cb">
                            <div class="f-cb">
                                <c:if test="${other.id==user.id}">
                                <div class="edit"><a href="editUser?userId=${user.id}" hidefocus="true"
                                                     class="u-btn2 u-btn2-1"><i>编辑个人资料</i></a></div>
                                </c:if>
                                <div class="rect" id="newmusician"></div>
                                <h2 id="j-name-wrap" class="wrap f-fl f-cb ">
                                    <span class="tit f-ff2 s-fc0 f-thide">${other.nickname}</span>
                                    <span id="j-vip-code"></span>
                                    <!--用户等级-->
                                    <%--<span class="lev u-lev u-icn2 u-icn2-lev">7<i class="right u-icn2 u-icn2-levr"></i></span>--%>
                                    <!--用户性别-->
                                  <%--  <i class="icn u-icn u-icn-01"></i>--%>
                                </h2>
                                <c:if test="${other.id!=user.id}">
                                        <div id="head-oper">
                                            <c:if test="${state==0}">
                                                <a href="#" class="btn u-btn u-btn-8 f-tdn" data-action="follow" id="att1" onclick="addAttention(${other.id});"style="
                                                float: right;">关 注</a>
                                            </c:if>
                                            <c:if test="${state!=0}">
                                                <a href="#" class="btn u-btn u-btn-6 f-tdn" data-action="delfollow" id="att2" onclick="delAttention();"style="
                                                float: right;"><i>已关注</i></a>
                                            </c:if>


                                        </div>
                                </c:if>
                            </div>
                        </div>
                        <ul class="data s-fc3 f-cb" id="tab-box">
                            <li><a href="/follow?otherId=${other.id}"><strong id="follow_count">${other.folNum}</strong><span>关注</span></a></li>
                            <li>
                                <a href="/fans?otherId=${other.id}">
                                    <strong id="fan_count">${other.fansNum}</strong>
                                    <span>粉丝</span>
                                </a></li>
                        </ul>
                        <c:if test="${other.presentation!=null}">
                        <div class="inf s-fc3 f-brk">个人介绍：${other.presentation}</div>
                        </c:if>

                    </dd>
                </dl>
                <!-- <span class="f-ff2" data-action="week" id="week">最近一周</span>
                <span class="f-ff2" data-action="all" id="all">所有时间</span> -->
                <!--我创建的歌单-->
                <div class="u-title u-title-1 f-cb" id="cHeader" style="">
                    <h3><span class="f-ff2">我创建的歌单（${fn:length(menuList)}）</span></h3>
                </div>
                <ul class="m-cvrlst f-cb" id="cBox">
                    <c:forEach items="${menuList}" var="menu">
                        <li id="auto-id-eBWXyoe3HHhpSMyE">
                            <div class="u-cover u-cover-1"><img
                                    src="music/images/${menu.menuImage}"style="height: 140px;width: 140px"><a
                                    href="otherMusic?menuId=${menu.menuId}&otherId=${other.id}" class="msk" title="${menu.menuName}"></a>
                                <div class="bottom"><a class="icon-play f-fr" href="javascript:;" title="播放" data-res-action="play"
                                                       data-res-type="13" data-res-id="475407140"></a><span class="icon-headset"></span><span
                                        class="nb">410</span></div>
                            </div>
                            <p class="dec"><a class="tit f-thide s-fc0" href="otherMusic?menuId=${menu.menuId}&otherId=${other.id}" title="${menu.menuName}">${menu.menuName}</a>
                            </p></li>
                    </c:forEach>
                </ul>
                <!--我收藏的歌单-->
                <div class="u-title u-title-1 f-cb" id="sHeader" style="">
                    <h3><span class="f-ff2">我收藏的歌单（${fn:length(colMenuList)}）</span></h3>
                </div>
                <ul class="m-cvrlst f-cb" id="sBox">
                    <c:forEach items="${colMenuList}" var="col">
                        <li id="auto-id-aTJMtgWeDSqvI6JQ">
                            <div class="u-cover u-cover-1"><img
                                    src="music/images/${col.menu.menuImage}">
                                <a href="/otherMusic?otherId=${col.menu.userId}&menuId=${col.menu.menuId}" class="msk" title="${col.menu.menuName}"></a>
                                <div class="bottom"><a class="icon-play f-fr" href="javascript:;" title="播放" data-res-action="play"
                                                       data-res-type="13" data-res-id="533472686"></a><span class="icon-headset"></span>
                                   </div>
                            </div>
                            <p class="dec"><a class="tit f-thide s-fc0" href="/otherMusic?otherId=${col.menu.userId}&menuId=${col.menu.menuId}" title="${col.menu.menuName}">${col.menu.menuName}</a>
                            </p></li>
                    </c:forEach>

                </ul>
            </div>
            <div class="j-flag"></div>
        </div>
    </div>

</div>
</div>
</div>
<a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
</body>
<script type="text/javascript">
    function addAttention(otherId) {
        $.ajax({
           type:"POST",
           url:"addAttention",
           data:{
               userId:${user.id},
               otherId:otherId
           },
           dataType:'json',
           cache:false,
            success(data){
               if(data.status==200){
                  /*var input= document.getElementById('fan_count');
                  var num=input.html();
                   input.value=num+1;
                   document.getElementById('att1').style.display='none';
                   document.getElementById('att2').style.display='block';*/
                   location.reload();
               }
               else{
                   console.log("关注失败");
               }
            }
        });
    }
    function delAttention() {
        $.ajax({
            type:"POST",
            url:"delAttention",
            data:{
                userId:${user.id},
                otherId:${other.id}
            },
            dataType:'json',
            cache:false,
            success(data){
                if(data.status==200){
                  /*  var input= document.getElementById('fan_count');
                    var num=input.html();
                    input.value=num-1;
                    document.getElementById('att1').style.display='block';
                    document.getElementById('att2').style.display='none';*/
                  location.reload();

                }
                else{
                    console.log("取消关注失败");
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
</html>