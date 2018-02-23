$(document).ready(function () {
    showmain();
    $("#li-contentManage").addClass("start active open");
    $("#li-MenuManage").addClass("start active");
    $("#lis-createMenu").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
})
var AddedMenu = function () {

    var Menu = $("#txt_menu").val();
    var url = $("#pagurl").val();


    $.ajax({
        url: "/Admin/Menu/MenuAdded",
        type: "Post",
        data: { name: Menu, url: url },
        success: function (res) {
            if (res == "true") {
                AutoLoader("Menu created successfully", "success");
                clearAllFields();
            }
            else {
                AutoLoader("Error", "error");
            }
        }
    })
}
var AddedSubmenu = function () {

    var Menu = $("#txt_menum").val();
    var url = $("#pagurls").val();
    var mmenu = $("#mainmenulink").val();


    $.ajax({
        url: "/Admin/Menu/SubmenuAdd",
        type: "Post",
        data: { name: Menu, url: url, mainmenu :mmenu},
        success: function (res) {
            if (res == "true") {
                AutoLoader("Sub menu created successfully", "success");
                clearAllFields();
            }
            else {
                AutoLoader("Error", "error");
            }
        }
    })
}
var AddedSubChildmenu = function () {

    var Menu = $("#txt_submenuchild").val();
    var url = $("#pagurlsch").val();
  
    var submenu = $("#sabmenulinkch").val();

    $.ajax({
        url: "/Admin/Menu/SubmenuChildAdd",
        type: "Post",
        data: { name: Menu, url: url ,submenu: submenu},
        success: function (res) {
            if (res == "true") {
                AutoLoader("Menu created successfully", "success");
                clearAllFields();
            }
            else {
                AutoLoader("Error", "error");
            }
        }
    })
}

var clearAllFields = function () {
    $("#pagurlsch").val("");
    $("#txt_submenuchild").val("");
    $("#sabmenulinkch").val("");
    $("#txt_menu").val("");
    $("#pagurl").val("");
    $("#mainmenulink").val("");
    $("#txt_menum").val("");
    $("#pagurls").val("");
}
var showmain=function()
{
    
    var menu = $("#supermenu").css('display', 'block');
    var menu = $("#childmenu").css('display', 'none');
    var menu = $("#childsubmenu").css('display', 'none');
}
var showsub = function () {
    
    var menu = $("#supermenu").css('display', 'none');
    var menu = $("#childmenu").css('display', 'block');
    var menu = $("#childsubmenu").css('display', 'none');
}
var showsubchild = function () {

    var menu = $("#supermenu").css('display', 'none');
    var menu = $("#childmenu").css('display', 'none');
    var menu = $("#childsubmenu").css('display', 'block');
}




