<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>悦听音乐</title>
    <link rel="stylesheet" href="css/Mymusic.css"/>
    <link rel="stylesheet" href="css/discover.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <link rel="stylesheet" href="css/enter.css"/>
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <link rel="shortcut icon" href="favicon.ico"/>
    <link rel="bookmark" href="favicon.ico"/>
    <link rel="canonical" href="https://music.163.com/discover/playlist/?cat=%E5%8D%8E%E8%AF%AD&amp;order=hot">
    <link href="https://s2.music.126.net/web/s/pt_search_index_8a3a1ee4567d554761f8a3702a48ac4e.css?8a3a1ee4567d554761f8a3702a48ac4e"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/core_ecf905c2264a250ea4e274cc53080eac.css?ecf905c2264a250ea4e274cc53080eac"
          type="text/css" rel="stylesheet">
    <link href="//s2.music.126.net/web/s/pt_frame_4c683000e2340dfda85c07f79ff9d1d4.css?4c683000e2340dfda85c07f79ff9d1d4"
          type="text/css" rel="stylesheet">

</head>

<body>
<div id="sample">
    <!--1.logo-->
    <div id="logo">
        <div class="logo-width">
            <img src="img/music.png"/>
            <h1 class="font">悦&nbsp;&nbsp;听&nbsp;&nbsp;音&nbsp;&nbsp;乐&nbsp;&nbsp;网</h1>
            <div class="logt-text">
                <input type="text" class="span" id="content"  value="${searchName}" onkeydown="entersearch();"/>
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
            <a href="/myMusic">
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
    <div class="g-bd">
        <div id="box1" class="g-wrap" id="baseBox" >
            <div class="u-title u-title-2 f-cb">
                <h3><span class="f-ff2">个人设置</span></h3>
            </div>
            <ul class="m-tabs f-cb">
                <li class="fst"><a href="javascript:void(0);" class="z-slt"><em>基本设置</em></a></li>
            </ul>
            <form name="form2" action="editUser/save" method="post" enctype="multipart/form-data">
                <div class="n-base f-cb">
                    <div class="frm m-frm">
                        <div class="itm">
                            <label class="lab">昵称：</label>
                            <input type="text" class="u-txt txt" name="nickname"value="${user.nickname}" id="nickname" maxlength="30">
                            <div class="u-err" style="display:none;" id="err"><i class="u-icn u-icn-25"></i><span>昵称已存在！</span></div>
                        </div>
                        <div class="itm f-cb">
                            <label class="lab">介绍：</label>
                            <div class="u-txtwrap f-pr">
                                <textarea class="u-txt area" name="presentation" id="signature">${user.presentation}</textarea>
                                <span class="zs s-fc2" id="remain">100</span>
                            </div>
                        </div>
                       <%-- <div class="itm f-cb">
                            <label class="lab">性别：</label>
                            <div class="f-cb">
                                <label class="check"><input name="gender" type="radio" class="u-rdi" checked="true" value="1"> 男</label>
                            <label class="check"><input name="gender" type="radio" class="u-rdi"  value="2"> 女</label>
                            <label class="check"><input name="gender" type="radio" class="u-rdi" value="0"> 保密</label>
                        </div>
                        </div>--%>
                       <%-- <div class="itm f-cb" style="z-index:11;">
                            <label class="lab">生日：</label>
                            <div class="u-slt u-slt-1 f-pr" id="yselect">
                                <span class="curr">1997</span>
                                <i class="btn" id="auto-id-rh5fQusdLzG1zOnW"></i>
                                <ul style="display: none;"><!-- ie6下，高超过150px就设_height:150px; -->
                                    <li class="f-thide" id="auto-id-bZf2uLpdLZhLTDLb"><a href="#">2019</a></li><li class="f-thide" id="auto-id-3UVJ8VVyxmsRIeWf"><a href="#">2018</a></li><li class="f-thide" id="auto-id-tGUVgzkTxQi8eFBa"><a href="#">2017</a></li><li class="f-thide" id="auto-id-fUzV1crM7Zcubuii"><a href="#">2016</a></li><li class="f-thide" id="auto-id-d2UfahHB9NfKL9wK"><a href="#">2015</a></li><li class="f-thide" id="auto-id-7dXTb4UoV1rSZ50P"><a href="#">2014</a></li><li class="f-thide" id="auto-id-6h07llEO4Jpeo0AJ"><a href="#">2013</a></li><li class="f-thide" id="auto-id-N48FTgxnrgWDrbLo"><a href="#">2012</a></li><li class="f-thide" id="auto-id-Gw3HGAgyZyayHMzi"><a href="#">2011</a></li><li class="f-thide" id="auto-id-3DylFdq8B94HzTcV"><a href="#">2010</a></li><li class="f-thide" id="auto-id-sT2Jzs5qKJimPCSM"><a href="#">2009</a></li><li class="f-thide" id="auto-id-fTB1bxFWx960pIWM"><a href="#">2008</a></li><li class="f-thide" id="auto-id-DZv3c0dWlsasDILZ"><a href="#">2007</a></li><li class="f-thide" id="auto-id-IEq4XP3UmI6sm3sI"><a href="#">2006</a></li><li class="f-thide" id="auto-id-2Jr6chwIshJ6zTrO"><a href="#">2005</a></li><li class="f-thide" id="auto-id-t19GTN2PAs0rW8wT"><a href="#">2004</a></li><li class="f-thide" id="auto-id-u6vqNBiuTsE7nAVi"><a href="#">2003</a></li><li class="f-thide" id="auto-id-XcmXRJBfftJnHA1p"><a href="#">2002</a></li><li class="f-thide" id="auto-id-GDn7cMd8XPfE2VTf"><a href="#">2001</a></li><li class="f-thide" id="auto-id-ifuTaIbxcixdeeBF"><a href="#">2000</a></li><li class="f-thide" id="auto-id-rW9lrPEGmHiRSzgT"><a href="#">1999</a></li><li class="f-thide" id="auto-id-HU4XrDzhTFKXDaFQ"><a href="#">1998</a></li><li class="f-thide" id="auto-id-wOCD7Vuf7LG0nPtb"><a href="#">1997</a></li><li class="f-thide" id="auto-id-LHCtvTIZyZdLoXBa"><a href="#">1996</a></li><li class="f-thide" id="auto-id-gI6eu4ppvJGTctnb"><a href="#">1995</a></li><li class="f-thide" id="auto-id-3ZsqMlKK0D6EeZ33"><a href="#">1994</a></li><li class="f-thide" id="auto-id-4CKxbsJbsPvlsTJF"><a href="#">1993</a></li><li class="f-thide" id="auto-id-xJDsV4FDMT3zyLDS"><a href="#">1992</a></li><li class="f-thide" id="auto-id-MLdyMlVoMp0JET6H"><a href="#">1991</a></li><li class="f-thide" id="auto-id-kifEBZK8aNTLZdBW"><a href="#">1990</a></li><li class="f-thide" id="auto-id-LBdmO3TDBqUy9GVX"><a href="#">1989</a></li><li class="f-thide" id="auto-id-CyHlaTwN55Lczzvk"><a href="#">1988</a></li><li class="f-thide" id="auto-id-cz4pQF8Ou1i2Kw01"><a href="#">1987</a></li><li class="f-thide" id="auto-id-yyP6vTGdmoy503Nf"><a href="#">1986</a></li><li class="f-thide" id="auto-id-PdFSBJTb24yreLUf"><a href="#">1985</a></li><li class="f-thide" id="auto-id-X8OkTwuIbL7OSHHr"><a href="#">1984</a></li><li class="f-thide" id="auto-id-ROm7AWTVWh2Gcxlq"><a href="#">1983</a></li><li class="f-thide" id="auto-id-gQVe925ELrGmroBV"><a href="#">1982</a></li><li class="f-thide" id="auto-id-ilb6bVCGfQCQfPRg"><a href="#">1981</a></li><li class="f-thide" id="auto-id-tZ9mq676GrLbVdeL"><a href="#">1980</a></li><li class="f-thide" id="auto-id-8L8vIMA3Cz2T5qGa"><a href="#">1979</a></li><li class="f-thide" id="auto-id-frsEpkxMsbT3XpgW"><a href="#">1978</a></li><li class="f-thide" id="auto-id-PyDCE1QxIezFlMRQ"><a href="#">1977</a></li><li class="f-thide" id="auto-id-ZTH8O1iFl5K57SMw"><a href="#">1976</a></li><li class="f-thide" id="auto-id-JZ6c5VTlEyJ8Glm4"><a href="#">1975</a></li><li class="f-thide" id="auto-id-WgOmvtk1teiaVwem"><a href="#">1974</a></li><li class="f-thide" id="auto-id-ehNreSu4IUTZ87si"><a href="#">1973</a></li><li class="f-thide" id="auto-id-PTDL0Sek2MfVmSPI"><a href="#">1972</a></li><li class="f-thide" id="auto-id-tOkc3Mca67iRoG3a"><a href="#">1971</a></li><li class="f-thide" id="auto-id-BewoyP8ea53fSHwH"><a href="#">1970</a></li><li class="f-thide" id="auto-id-60pD0vgor1n8kZ8Q"><a href="#">1969</a></li><li class="f-thide" id="auto-id-cro6xKXbbN6s7MAO"><a href="#">1968</a></li><li class="f-thide" id="auto-id-8maV52zBbk2r33kc"><a href="#">1967</a></li><li class="f-thide" id="auto-id-mK12WV4Jo0eU4lVu"><a href="#">1966</a></li><li class="f-thide" id="auto-id-XDhId5mpxHZpeiST"><a href="#">1965</a></li><li class="f-thide" id="auto-id-pTFFeRhI4IGSwhTq"><a href="#">1964</a></li><li class="f-thide" id="auto-id-XRm467CoJzNIQtlF"><a href="#">1963</a></li><li class="f-thide" id="auto-id-LahVJdHaTore4bzz"><a href="#">1962</a></li><li class="f-thide" id="auto-id-OP0angGmxT1mD6am"><a href="#">1961</a></li><li class="f-thide" id="auto-id-UE5mbgUCxsZTzloI"><a href="#">1960</a></li><li class="f-thide" id="auto-id-dfKp5KFf5cVMaJRT"><a href="#">1959</a></li><li class="f-thide" id="auto-id-i4A8qKh3fZR1I3QR"><a href="#">1958</a></li><li class="f-thide" id="auto-id-WXCazlwwVk4POzAi"><a href="#">1957</a></li><li class="f-thide" id="auto-id-bbeXxohTnfKtLg4T"><a href="#">1956</a></li><li class="f-thide" id="auto-id-UTXbqZTaFcl1EICk"><a href="#">1955</a></li><li class="f-thide" id="auto-id-GbNnhMorQ8zdsx79"><a href="#">1954</a></li><li class="f-thide" id="auto-id-2AuwI1Rx1RWuP8ie"><a href="#">1953</a></li><li class="f-thide" id="auto-id-8TG5T8yrJZ9QOq8q"><a href="#">1952</a></li><li class="f-thide" id="auto-id-4CrHPn4q96SqmtL6"><a href="#">1951</a></li><li class="f-thide" id="auto-id-y5ssqRZlZiIR4nUB"><a href="#">1950</a></li><li class="f-thide" id="auto-id-iWzuUhwIgR05PWIC"><a href="#">1949</a></li><li class="f-thide" id="auto-id-kOOLVHsmGG464ZwM"><a href="#">1948</a></li><li class="f-thide" id="auto-id-ySrFrAbCCciHU4r5"><a href="#">1947</a></li><li class="f-thide" id="auto-id-PgEud0FQvfvHa7DJ"><a href="#">1946</a></li><li class="f-thide" id="auto-id-kohD3Mmp5593ThDA"><a href="#">1945</a></li><li class="f-thide" id="auto-id-ODNc3o7JrU0IbTT7"><a href="#">1944</a></li><li class="f-thide" id="auto-id-fQuyLZzpKTBl1ZsW"><a href="#">1943</a></li><li class="f-thide" id="auto-id-XmZGsl5QkGa8J0qN"><a href="#">1942</a></li><li class="f-thide" id="auto-id-bMvaWDV7AcD95GkU"><a href="#">1941</a></li><li class="f-thide" id="auto-id-FNBcTsZEySnrALXR"><a href="#">1940</a></li><li class="f-thide" id="auto-id-TuZWbETJ14DGr1HU"><a href="#">1939</a></li><li class="f-thide" id="auto-id-kuEocT2yM0t35mor"><a href="#">1938</a></li><li class="f-thide" id="auto-id-yrhUxDRNMgMSDcMt"><a href="#">1937</a></li><li class="f-thide" id="auto-id-BrOmLB3vvmg0nKub"><a href="#">1936</a></li><li class="f-thide" id="auto-id-A8bAwpScZxPDZPpv"><a href="#">1935</a></li><li class="f-thide" id="auto-id-ePDntnwkz0yWvN7y"><a href="#">1934</a></li><li class="f-thide" id="auto-id-k5Rzt6RhNURb8cSh"><a href="#">1933</a></li><li class="f-thide" id="auto-id-oNhPH0RCb2rkaVvX"><a href="#">1932</a></li><li class="f-thide" id="auto-id-qn7xkNAyoJJNyJU8"><a href="#">1931</a></li><li class="f-thide" id="auto-id-qEUczmQfuepgDEMD"><a href="#">1930</a></li><li class="f-thide" id="auto-id-Q1yxlKGLy4ltVGOW"><a href="#">1929</a></li><li class="f-thide" id="auto-id-dxAmU8bC8e1wZSXe"><a href="#">1928</a></li><li class="f-thide" id="auto-id-2fc2d5xoBqDEHqSC"><a href="#">1927</a></li><li class="f-thide" id="auto-id-0f10pQrWWyHcOx14"><a href="#">1926</a></li><li class="f-thide" id="auto-id-3RXFGGwOC4mMhsvn"><a href="#">1925</a></li><li class="f-thide" id="auto-id-NIywXhvZiaQeJa8y"><a href="#">1924</a></li><li class="f-thide" id="auto-id-45lTtJo4pwi9GBwM"><a href="#">1923</a></li><li class="f-thide" id="auto-id-TimiaAmvSCWmGxWF"><a href="#">1922</a></li><li class="f-thide" id="auto-id-4Sg8whTgfAllesbg"><a href="#">1921</a></li><li class="f-thide" id="auto-id-iwTPbara0mhOa324"><a href="#">1920</a></li></ul>
                            </div>
                            <span class="wrd f-fl">年</span>
                            <div class="u-slt u-slt-2 f-pr" id="mselect">
                                <span class="curr">06</span>
                                <i class="btn" id="auto-id-CpKdcCyybdrUPBMJ"></i>
                                <ul style="display: none;">
                                    <li class="f-thide" id="auto-id-zyPsG5hZnNZR3Mn6"><a href="#">01</a></li><li class="f-thide" id="auto-id-HhVJM9ncbfVEHnrq"><a href="#">02</a></li><li class="f-thide" id="auto-id-bCWLJMIHIgXsrfle"><a href="#">03</a></li><li class="f-thide" id="auto-id-3FHVQVwRzWXfxCaG"><a href="#">04</a></li><li class="f-thide" id="auto-id-8RGl3t3J4SX7eiXC"><a href="#">05</a></li><li class="f-thide" id="auto-id-e8WCtNee4m3TuyZC"><a href="#">06</a></li><li class="f-thide" id="auto-id-iTH8lFeX7myPNUPr"><a href="#">07</a></li><li class="f-thide" id="auto-id-ezTe3vkTpWck3BH2"><a href="#">08</a></li><li class="f-thide" id="auto-id-oAvLb7bSduby5Ipl"><a href="#">09</a></li><li class="f-thide" id="auto-id-3iP9i3fm2Vop4P4p"><a href="#">10</a></li><li class="f-thide" id="auto-id-IcWlCOLmz3t8MRsR"><a href="#">11</a></li><li class="f-thide" id="auto-id-rPi3TEiGHzdIB3hV"><a href="#">12</a></li></ul>
                            </div>
                            <span class="wrd f-fl">月</span>
                            <div class="u-slt u-slt-2 f-pr" id="dselect">
                                <span class="curr">08</span>
                                <i class="btn" id="auto-id-GiClGOr6zoI8cSFH"></i>
                                <ul style="display: none;">
                                    <li class="f-thide" id="auto-id-fpzCNt7WH40x8prX"><a href="#">01</a></li><li class="f-thide" id="auto-id-bdQdFudPMgp3Xow7"><a href="#">02</a></li><li class="f-thide" id="auto-id-DouZdzpdzLFk7dRR"><a href="#">03</a></li><li class="f-thide" id="auto-id-Cdv1RQ1Wl1HmrnFk"><a href="#">04</a></li><li class="f-thide" id="auto-id-wTyHre8GTlESXgLh"><a href="#">05</a></li><li class="f-thide" id="auto-id-Ec2AqGhtosGBnJqQ"><a href="#">06</a></li><li class="f-thide" id="auto-id-5EgTKWFTSXIrTetX"><a href="#">07</a></li><li class="f-thide" id="auto-id-MZmCCPbueL600zDT"><a href="#">08</a></li><li class="f-thide" id="auto-id-76Qd2PJfT6UPAC36"><a href="#">09</a></li><li class="f-thide" id="auto-id-DVO0bTSRMXzKbW0c"><a href="#">10</a></li><li class="f-thide" id="auto-id-o3TwuQTdzu06MX1w"><a href="#">11</a></li><li class="f-thide" id="auto-id-xDt8IfXXwzzowasb"><a href="#">12</a></li><li class="f-thide" id="auto-id-0sOwJrLuCOsJsMdK"><a href="#">13</a></li><li class="f-thide" id="auto-id-HWKcyZaFIXRAJqc7"><a href="#">14</a></li><li class="f-thide" id="auto-id-dGWXcmh75MNhy4D7"><a href="#">15</a></li><li class="f-thide" id="auto-id-EbHL2GhBeQGVELHq"><a href="#">16</a></li><li class="f-thide" id="auto-id-KoSHbelTcf6SeDKH"><a href="#">17</a></li><li class="f-thide" id="auto-id-Ackbsr8c9v4cyqsm"><a href="#">18</a></li><li class="f-thide" id="auto-id-lZ4TNmOOCo9gITXI"><a href="#">19</a></li><li class="f-thide" id="auto-id-nLln3phw3ydfQcsm"><a href="#">20</a></li><li class="f-thide" id="auto-id-T7tEMr3m3bIPpTPT"><a href="#">21</a></li><li class="f-thide" id="auto-id-8eQ2WdzN0AlVeifw"><a href="#">22</a></li><li class="f-thide" id="auto-id-8qZJJb9HF99QgtXs"><a href="#">23</a></li><li class="f-thide" id="auto-id-7b5aUWXcKUMdNKfO"><a href="#">24</a></li><li class="f-thide" id="auto-id-ESH2RoaAU2lDJ7lV"><a href="#">25</a></li><li class="f-thide" id="auto-id-GTdeAIAN9kWFKegi"><a href="#">26</a></li><li class="f-thide" id="auto-id-oHm0JktJAbsTTGw6"><a href="#">27</a></li><li class="f-thide" id="auto-id-kTCEhiEJr3f64Xdf"><a href="#">28</a></li><li class="f-thide" id="auto-id-uGUUkLc7plt3x4O7"><a href="#">29</a></li><li class="f-thide" id="auto-id-x9130g86c65qdw4d"><a href="#">30</a></li></ul>
                            </div>
                            <span class="wrd f-fl">日</span>
                        </div>--%>

                        <div class="itm ft"><%--   <div class="itm itm-1 f-cb" style="z-index:10;">
                            <label class="lab">地区：</label>
                            <div class="u-slt f-pr" id="pselect">
                                <span class="curr">浙江省</span>
                                <i class="btn" id="auto-id-6OCnHVcqbiddfRtC"></i>
                                <ul style="display: none;"><!-- ie6下，高超过150px就设_height:150px; -->
                                    <li class="f-thide" id="auto-id-XQTSlAOegkdDuPiT"><a href="#">直辖市</a></li><li class="f-thide" id="auto-id-G5zpzDuTsucwkUcZ"><a href="#">特别行政区</a></li><li class="f-thide" id="auto-id-WM67kk3sP8ymVEGx"><a href="#">河北省</a></li><li class="f-thide" id="auto-id-pdbPuHuv3bW4vQG1"><a href="#">山西省</a></li><li class="f-thide" id="auto-id-cv1SIdOHd0ZJp46o"><a href="#">内蒙古</a></li><li class="f-thide" id="auto-id-QpEopT2JyNBCDgXA"><a href="#">辽宁省</a></li><li class="f-thide" id="auto-id-ke6to1kHTNZKTDkx"><a href="#">吉林省</a></li><li class="f-thide" id="auto-id-NJAya8UBd3CTK1rC"><a href="#">黑龙江省</a></li><li class="f-thide" id="auto-id-IED9zBicgTXXW1Cp"><a href="#">江苏省</a></li><li class="f-thide" id="auto-id-vSXwv7AKJ9HPW6v2"><a href="#">浙江省</a></li><li class="f-thide" id="auto-id-p3o1GPUVSNA23D9d"><a href="#">安徽省</a></li><li class="f-thide" id="auto-id-3sTRZAUtpzc9Xec2"><a href="#">福建省</a></li><li class="f-thide" id="auto-id-NLFldvqbmEg1ToMk"><a href="#">江西省</a></li><li class="f-thide" id="auto-id-EvdbClyOLgS1yVbV"><a href="#">山东省</a></li><li class="f-thide" id="auto-id-HteiwCACF9PE698a"><a href="#">河南省</a></li><li class="f-thide" id="auto-id-N5ROScUkmnv1ENvh"><a href="#">湖北省</a></li><li class="f-thide" id="auto-id-m8PZwtMl6G829mxQ"><a href="#">湖南省</a></li><li class="f-thide" id="auto-id-eTOgnayPCOiki1yR"><a href="#">广东省</a></li><li class="f-thide" id="auto-id-hSylrqN6nCqqdKDx"><a href="#">广西</a></li><li class="f-thide" id="auto-id-0fZuIJ66IgezqdiX"><a href="#">海南省</a></li><li class="f-thide" id="auto-id-zIzQ3o0yvgHPcZkQ"><a href="#">四川省</a></li><li class="f-thide" id="auto-id-Q8PNHcWi9gIOWp5R"><a href="#">贵州省</a></li><li class="f-thide" id="auto-id-Q19G62T7XuGekB39"><a href="#">云南省</a></li><li class="f-thide" id="auto-id-hpR10waOCqEfWMEE"><a href="#">西藏</a></li><li class="f-thide" id="auto-id-QKzuqfdF075t8Po4"><a href="#">陕西省</a></li><li class="f-thide" id="auto-id-mN3AAN3gS2OSHKlG"><a href="#">甘肃省</a></li><li class="f-thide" id="auto-id-gsexGWqN1zwb79wb"><a href="#">青海省</a></li><li class="f-thide" id="auto-id-hDKRcxptkaukZf2T"><a href="#">宁夏</a></li><li class="f-thide" id="auto-id-7KcWq3A1bIkcag3M"><a href="#">新疆</a></li><li class="f-thide" id="auto-id-0dcEPDb3OR6xH2g9"><a href="#">台湾省</a></li><li class="f-thide" id="auto-id-iI7umngnMse3wbIK"><a href="#">海外</a></li></ul>
                            </div>
                            <div class="u-slt f-pr" id="cselect">
                                <span class="curr f-thide">宁波市</span>
                                <i class="btn" id="auto-id-nik7roHoLihWXtIB"></i>
                                <ul style="display: none;">
                                    <li class="f-thide" id="auto-id-3Nd0se8gppzoXT9n"><a href="#">杭州市</a></li><li class="f-thide" id="auto-id-ISM6NdATCBaN7B2y"><a href="#">宁波市</a></li><li class="f-thide" id="auto-id-JV3U1CTRmBvLSTu5"><a href="#">温州市</a></li><li class="f-thide" id="auto-id-B9qomXmNQD1PfxaT"><a href="#">嘉兴市</a></li><li class="f-thide" id="auto-id-2pCzUwp7iPkAsIeG"><a href="#">湖州市</a></li><li class="f-thide" id="auto-id-REAAPWMpQG9i6TD9"><a href="#">绍兴市</a></li><li class="f-thide" id="auto-id-byytADXKuIs9FPnk"><a href="#">金华市</a></li><li class="f-thide" id="auto-id-58szoTlDbus0ZRkI"><a href="#">衢州市</a></li><li class="f-thide" id="auto-id-9MKOtPW9DPZKVK9B"><a href="#">舟山市</a></li><li class="f-thide" id="auto-id-TvuhbAnOE12cR9i1"><a href="#">台州市</a></li><li class="f-thide" id="auto-id-wHDHS2GE9npATOPG"><a href="#">丽水市</a></li></ul>
                            </div>
                        </div>--%>
                            <a class="u-btn2 u-btn2-2 u-btn2-w2" hidefocus="true" href="javascript:document.form2.submit();" data-action="save"><i>保 存</i></a>
                            <a class="u-btn2 u-btn2-1 u-btn2-w2" hidefocus="true" href="#" data-action="cancel" onclick="javascript:history.back(-1);"><i>取 消</i></a>
                        </div>
                    </div>
                    <div class="avatar f-pr">
                        <img src="user/images/${user.image}"style="height: 140px;width: 140px" id="edit_cover">
                        <span class="btm"></span>
                        <a href="javascript:;" class="upload" id="upload" onclick="changeImage();">更换头像</a>
                        <input class="upload"  style="display: none" type="file" name="file" id="editImage" value="编辑头像" accept="image/jpg,image/jpeg,image/png,image/bmp">
                    </div>
                </div>
            </form>
        </div>
        <a title="回到顶部" class="m-back" href="javascript:void(0);" id="g_backtop" hidefocus="true" style="">回到顶部</a>
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

</body>
<script type="text/javascript">
    function changeImage(){
        $("#editImage").click();
    }
    <!--显示图片-->
    $("#editImage").change(function(){
        $("#edit_cover").attr("src",URL.createObjectURL($(this)[0].files[0]));
    });
</script>

</html>