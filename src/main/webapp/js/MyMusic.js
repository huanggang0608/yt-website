
function delMusic(musicId) {
    winw.location.href="delMusic?musicId="+musicId+"&menuId=${menu.menuId}";
}
var szmusicId=null;
var flag_menuId=null;
function openSZ(musicId) {
    szmusicId=musicId;
    document.getElementById('sz-show').style.display='block';
}
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
                },1200);


            }else {
                document.getElementById('tips1').style.display='block';
                setTimeout(function () {
                    window.location.href="myMusic2?menuId=${menu.menuId}";
                },1200);

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