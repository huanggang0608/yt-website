<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>悦听音乐</title>
    <link rel="stylesheet" href="css/discover.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>

    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="https://s2.music.126.net/web/s/core_08ab69c917b257e8d34b944f658b66a6.css?08ab69c917b257e8d34b944f658b66a6"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_profile_follows_37811b0f94f8231033006a4e5f33142e.css?37811b0f94f8231033006a4e5f33142e"
          type="text/css" rel="stylesheet">
    <link href="https://s2.music.126.net/web/s/pt_frame_49fff55527d8ef751c88fe269c3b303f.css?49fff55527d8ef751c88fe269c3b303f"
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
                                <div class="edit"><a href="editUser?userId=${other.id}" hidefocus="true"
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
                            <li><a href="/follow?otherId=${other.id}"><strong id="follow_count">${other.folNum}</strong><span>关注</span></a>
                            </li>
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
                <div class="u-title u-title-1 f-cb">
                    <h3><span class="f-ff2 s-fc3">关注（<span id="follow_count_down">${other.folNum}</span>）</span></h3>
                </div>
                <ul class="m-fans f-cb" id="main-box">
                    <c:forEach items="${folList}" var="fol">

                        <li class="last "><a href="/home?otherId=${fol.id}" class="ava f-pr" title="${fol.nickname}">
                            <img src="user/images/${fol.image}" style="width: 60px;height: 60px"></a>
                            <div class="info"><p><a href="/home?otherId=${fol.id}" class="s-fc7 f-fs1 nm f-thide" title="${fol.username}">${fol.nickname}</a>&nbsp;</p>
                                <p>
                                    <a href="/follow?otherId=${fol.id}">关注
                                        <em
                                        class="s-fc7">${fol.folNum}</em></a><span class="line">|</span><a href="/fans?otherId=${fol.id}">粉丝<em
                                        class="s-fc7">${fol.fansNum}</em></a></p>
                                <p class="s-fc3 f-thide">${fol.presentation}</p></div>
                            <c:if test="${fol.id != user.id}">
                            <div class="oper" id="oper_9003">
                                <c:if test="${fol.state!=0}">
                                    <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                                </c:if>
                                <c:if test="${fol.state==0}">
                                    <a class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="9003"
                                      onclick="addAttention(${fol.id})">关 注</a>
                                </c:if>

                            </div>
                            </c:if>
                        </li>
                    </c:forEach>
                   <%-- <li class="last "><a href="/user/home?id=9003" class="ava f-pr" title="云音乐小秘书"><img
                            src="http://p1.music.126.net/_aEPXmHuskM-g140GROZnQ==/109951163879490620.jpg?param=60y60"></a>
                        <div class="info"><p><a href="/user/home?id=9003" class="s-fc7 f-fs1 nm f-thide" title="云音乐小秘书">云音乐小秘书</a>&nbsp;<sup
                                class="u-icn u-icn-1 "></sup>&nbsp;<i class="icn u-icn u-icn-s-00"></i></p>
                            <p><a href="/user/event?id=9003">动态<em class="s-fc7">5860</em></a><span
                                    class="line">|</span><a href="/user/follows?id=9003">关注<em
                                    class="s-fc7">427</em></a><span class="line">|</span><a href="/user/fans?id=9003">粉丝<em
                                    class="s-fc7">99999</em></a></p>
                            <p class="s-fc3 f-thide">网易云音乐是6亿人都在使用的音乐平台...</p></div>
                        <div class="oper" id="oper_9003"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                            data-userid="9003" data-nickname="云音乐小秘书"><i>发私信</i></a>
                            <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="9003"
                                    style="display:none;">关 注</a></div>
                    </li>
                    <li class=""><a href="/user/home?id=1" class="ava f-pr" title="网易云音乐">
                        <img
                            src="http://p1.music.126.net/QWMV-Ru_6149AKe0mCBXKg==/1420569024374784.jpg?param=60y60"/></a>
                        <div class="info"><p><a href="/user/home?id=1" class="s-fc7 f-fs1 nm f-thide" title="网易云音乐">网易云音乐</a>&nbsp;<sup
                                class="u-icn u-icn-1 "></sup>&nbsp;<i class="icn u-icn u-icn-s-01"></i></p>
                            <p><a href="/user/event?id=1">动态<em class="s-fc7">12556</em></a><span
                                    class="line">|</span><a href="/user/follows?id=1">关注<em
                                    class="s-fc7">419</em></a><span class="line">|</span><a href="/user/fans?id=1">粉丝<em
                                    class="s-fc7">99999</em></a></p>
                            <p class="s-fc3 f-thide">网易云音乐是6亿人都在使用的音乐平台...</p></div>
                        <div class="oper" id="oper_1"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                         data-userid="1" data-nickname="网易云音乐"><i>发私信</i></a>
                            <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="1"
                                    style="display:none;">关 注</a></div>
                    </li>
                    <li class="odd "><a href="/user/home?id=37179178" class="ava f-pr" title="陈粒"><img
                            src="http://p1.music.126.net/4uXL3QilHiWTPAy9A7OxcA==/109951163661594508.jpg?param=60y60"></a>
                        <div class="info"><p><a href="/user/home?id=37179178" class="s-fc7 f-fs1 nm f-thide" title="陈粒">陈粒</a>&nbsp;<sup
                                class="icn u-icn2 u-icn2-music2 "></sup>&nbsp;<i class="icn u-icn u-icn-s-02"></i></p>
                            <p><a href="/user/event?id=37179178">动态<em class="s-fc7">101</em></a><span
                                    class="line">|</span><a href="/user/follows?id=37179178">关注<em class="s-fc7">1</em></a><span
                                    class="line">|</span><a href="/user/fans?id=37179178">粉丝<em
                                    class="s-fc7">3026657</em></a></p>
                            <p class="s-fc3 f-thide">也！！！</p></div>
                        <div class="oper" id="oper_37179178"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                                data-userid="37179178" data-nickname="陈粒"><i>发私信</i></a>
                            <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="37179178"
                                    style="display:none;">关 注</a></div>
                    </li>
                    <li class="bg "><a href="/user/home?id=288007045" class="ava f-pr" title="一直在吃的周梓琦"><img
                            src="http://p1.music.126.net/tXmOj3IgdnhwQ1hcCj4znQ==/109951163272892848.jpg?param=60y60"></a>
                        <div class="info"><p><a href="/user/home?id=288007045" class="s-fc7 f-fs1 nm f-thide"
                                                title="一直在吃的周梓琦">一直在吃的周梓琦</a>&nbsp;<sup
                                class="icn u-icn2 u-icn2-music2 "></sup>&nbsp;<i class="icn u-icn u-icn-s-02"></i></p>
                            <p><a href="/user/event?id=288007045">动态<em class="s-fc7">158</em></a><span
                                    class="line">|</span><a href="/user/follows?id=288007045">关注<em
                                    class="s-fc7">19</em></a><span class="line">|</span><a
                                    href="/user/fans?id=288007045">粉丝<em class="s-fc7">93849</em></a></p>
                            <p class="s-fc3 f-thide">音乐网剧《薛定谔的猫》中饰演林嘉伽</p></div>
                        <div class="oper" id="oper_288007045"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                                 data-userid="288007045"
                                                                 data-nickname="一直在吃的周梓琦"><i>发私信</i></a>
                            <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="288007045"
                                    style="display:none;">关 注</a></div>
                    </li>
                    <li class="odd bg last "><a href="/user/home?id=16058308" class="ava f-pr" title="何洁"><img
                            src="http://p1.music.126.net/sI6-hIMEx3ZeayryLa5eLw==/5942860348330124.jpg?param=60y60"></a>
                        <div class="info"><p><a href="/user/home?id=16058308" class="s-fc7 f-fs1 nm f-thide" title="何洁">何洁</a>&nbsp;<sup
                                class="u-icn u-icn-1 "></sup>&nbsp;<i class="icn u-icn u-icn-s-02"></i></p>
                            <p><a href="/user/event?id=16058308">动态<em class="s-fc7">1</em></a><span
                                    class="line">|</span><a href="/user/follows?id=16058308">关注<em class="s-fc7">0</em></a><span
                                    class="line">|</span><a href="/user/fans?id=16058308">粉丝<em
                                    class="s-fc7">114680</em></a></p>
                            <p class="s-fc3 f-thide">工作联系：hejieworks@si...</p></div>
                        <div class="oper" id="oper_16058308"><a class="u-btn u-btn-7 f-tdn" href="#" data-action="send"
                                                                data-userid="16058308" data-nickname="何洁"><i>发私信</i></a>
                            <p class="s-fc4"><i class="u-icn u-icn-67"></i> 已关注</p>
                            <p class="s-fc4" style="display:none;"><i class="u-icn u-icn-66"></i> 相互关注</p><a
                                    class="u-btn u-btn-8 f-tdn" href="#" data-action="follow" data-userid="16058308"
                                    style="display:none;">关 注</a></div>
                    </li>--%>

                </ul>
                <c:if test="${fn:length(folList)==0}">
                <div class="u-page" id="page" >
                    <div class="n-nmusic"><h3 class="f-ff2"><i class="u-icn u-icn-21"></i>还没有关注人</h3></div>
                </div>
                </c:if>
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
                   /* var count= document.getElementById('fan_count');
                    var num=count.value;
                    count.value=num+1;
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