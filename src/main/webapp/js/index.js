var i = 1;


function LeftSlide() {

	document.getElementById("img").src = "index/" + i + ".png";
	i--;
	if(i == 0) {
		i = 3
	}
	ways(i);
}

function reightSlide() {

	document.getElementById("img").src = "index/" + i + ".png";
	i++;
	if(i == 4) {
		i = 1
	}
	ways(i);
}


var id;
function ways(id) {


		document.getElementById("img").src = "index/" + id + ".png";
		var doc = document.getElementById(id);
		doc.style.cssText = "background-color: white; ";

}
var index;

/*function show(index) {

	alert("show");
	var data = document.getElementById("img1" + index);
	data.style.visibility = "visible";

	var data2 = document.getElementById("img2" + index);
	data2.style.visibility = "visible";

	var data3 = document.getElementById("img3" + index);
	data3.style.visibility = "visible";

}*/

/*function conceal(index) {
    alert("conceal");
	var data = document.getElementById("img1" + index);
	data.style.visibility = "hidden";

	var data2 = document.getElementById("img2" + index);
	data2.style.visibility = "hidden";

	var data3 = document.getElementById("img3" + index);
	data3.style.visibility = "hidden";
}*/


function showsure() {
    document.getElementById("overDiv").style.display = "block";
    document.getElementById("hsDiv").style.display = "block";
}
function closeDiv() {
    document.getElementById("overDiv").style.display = "none";
    document.getElementById("hsDiv").style.display = "none";
}
showsure2= function () {
    document.getElementById("overDiv2").style.display = "block";
    document.getElementById("hsDiv2").style.display = "block";
}

function closeDiv2() {
	document.getElementById("overDiv2").style.display = "none";
	document.getElementById("hsDiv2").style.display = "none";
}

/*function CheckChinese(obj, name) {
	var val = document.getElementById(obj).value;　　
	var reg = /[a-z0-9]/i;　　
	if(!reg.test(val) && val != "") {
		alert(name + "只能包含字母和数字!");
		var strObj = document.getElementById(obj);
		strObj.value = "";

		　　
	}
}*/

/*function Confirm(pass1, pass2) {
	var data = document.getElementById(pass1).value;
	var data2 = document.getElementById(pass2).value;

	if(data != data2) {
		alert("两次密码不匹配");
	}
}*/

var kaiguan = true;
var myAuto=null;
var imguanem=null;
var age=1;
var musicarray=[
	"http://localhost:8888/chapter04/music/010203.mp3",
	"http://localhost:8888/chapter04/music/060504.mp3",
	"http://localhost:8888/chapter04/music/090807.mp3",
	"http://localhost:8888/chapter04/music/020103.mp3",
	"http://localhost:8888/chapter04/music/060504.mp3",
	"http://localhost:8888/chapter04/music/080907.mp3",
	"http://localhost:8888/chapter04/music/070809.mp3",
	"http://localhost:8888/chapter04/music/040203.mp3",
	"http://localhost:8888/chapter04/music/060702.mp3",
	"http://localhost:8888/chapter04/music/040506.mp3",
	"http://localhost:8888/chapter04/music/030406.mp3",
	"http://localhost:8888/chapter04/music/030604.mp3",
	"http://localhost:8888/chapter04/music/090604.mp3",
	"http://localhost:8888/chapter04/music/060409.mp3",
	"http://localhost:8888/chapter04/music/030201.mp3",
	"http://localhost:8888/chapter04/music/030106.mp3",
	"http://localhost:8888/chapter04/music/060901.mp3",
	"http://localhost:8888/chapter04/music/030140.mp3"
	
]
function getURl(id,index,musicname){
	var music=document.getElementById(id);
	var musicname=document.getElementById(musicname);
	music.href="http://localhost:8888/chapter04/addMysql?url="+musicarray[index]+"&musicnames="+musicname.innerText;
	
	
}
function autoPlay(name, imgname, url){

	for(var i = 0; i < document.getElementsByClassName('reset').length; i++) {
		document.getElementsByClassName('reset')[i].src="img/ann.jpg";
		document.getElementsByClassName('musicname-img1')[i].src="img/ann2.jpg";
		
	}
	myAuto = document.getElementById('myaudio');
	if(imguanem==imgname){
		kaiguan=false;
		if(age==2){
			kaiguan=true;
			age-=2;
		}
		age++;
	}
	
	if(kaiguan) {
		myAuto.src = musicarray[url];
		mStart()
		document.getElementById(imgname).src = "img/ann3.jpg";
		kaguan = false;
		imguanem=imgname;
		
	} else {
		mStop()
		document.getElementById(imgname).src = "img/ann.jpg";
		kaiguan = true;
	}
}

function mStop() {
	myAuto.pause();
}

function mStart() {
	myAuto.play();
}


function search3() {
    var content=$('#m-search-input').val();
    window.location.href="search?searchName="+content;
}

function severCheck() {
    if(check()){
        var username = $("#username").val();
        var password = $("#password").val();

        $.ajax({
            type:"POST",
            url:'loginCheck',
            data:{
                username:username,
                password:password
            },
            dataType:'json',
            cache:false,
            success:function (data) {

                /* alert(d.status);*/
                if(200==data.status){
                    window.location.href="main";
                }else if(201==data.status){

                    $("#password").tips({
                        side:2,
                        msg:"密码不正确！",
                        bg:'#FF5080',
                        time:1
                    });
                    //showfh();
                    $("#username").focus();
                }else{
                    $("#username").tips({
                        side:2,
                        msg:"系统繁忙 ，请尝试稍后重新登录 ...",
                        bg:'#FF5080',
                        time:1
                    });
                }

            }
        });

    }
}
function severCheck2() {
    if(check2()){
        var username = $("#rusername").val();
        var password = $("#rpassword").val();

        $.ajax({
            type:"POST",
            url:'registCheck',
            data:{
                username:username,
                password:password,
            },
            dataType:'json',
            cache:false,
            success:function (data) {

                /* alert(d.status);*/
                if(200==data.status){
                    $("#rusername").tips({
                        side:2,
                        msg:"注册成功",
                        bg:'#FF5080',
                        time:1
                    });

                }else if(201==data.status){

                    $("#rusername").tips({
                        side:2,
                        msg:"用户名已存在",
                        bg:'#FF5080',
                        time:1
                    });
                    //showfh();
                    $("#rsername").focus();
                }else{
                    $("#rusername").tips({
                        side:2,
                        msg:"系统繁忙 ，请尝试稍后重新注册 ...",
                        bg:'#FF5080',
                        time:1
                    });
                }

            }
        })

    }
}
function  check() {

    if($("#username").val()==""){
        $("#username").tips({
            side:2,
            msg:'用户名不能为空',
            bg:'#AE81FF',
            time:1

        });
        //showfh();
        $("#username").focus();
        return false;

    }
    /*else {
        $("#username").val(jQuery.trim($('#username').val()));}*/

    if ($("#password").val() == "") {
        $("#password").tips({
            side : 2,
            msg : '密码不得为空',
            bg : '#AE81FF',
            time : 1
        });
        //showfh();
        $("#password").focus();
        return false;
    }
    return true;
}
function  check2() {

    if($("#rusername").val()=="") {
        $("#rusername").tips({
            side: 2,
            msg: '用户名不能为空',
            bg: '#AE81FF',
            time: 1
        });
        //showfh();
        $("#rusername").focus();
        return false;

    }

    /*else {
        $("#username").val(jQuery.trim($('#username').val()));}*/

    if ($("#rpassword").val() == "") {
        $("#rpassword").tips({
            side : 2,
            msg : '密码不得为空',
            bg : '#AE81FF',
            time : 1
        });
        //showfh();
        $("#rpassword").focus();
        return false;
    }
    if ($("#password2").val() == "") {
        $("#password2").tips({
            side : 2,
            msg : '确认密码不得为空',
            bg : '#AE81FF',
            time : 1
        });
        //showfh();
        $("#password2").focus();
        return false;
    }else if(($("#password2").val())!=($("#rpassword").val())){
        $("#password2").tips({
            side : 2,
            msg : '两次密码不一致',
            bg : '#AE81FF',
            time : 1
        });
        //showfh();
        $("#password2").focus();
        return false;
    }
    return true;
}
