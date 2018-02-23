$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-MenuManage").addClass("start active");
    $("#lis-viewMenu").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    Load();

})
var Load = function () {
    var url = $("#LoadMenu").val();

    $.ajax({
        url: url,
        type: "post",
        success: function (res) {
            $("#Menu").html(res);
            $("#tblmenu").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
        }
    })
}
var Delete = function (id) {
    if (confirm("Are you sure you want to delete this menu?")) {
        var url = $("#HiddenDelete").val();
        $.ajax({
            url: url,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "True") {
                    AutoLoader("Menu deleted successfully", "success");
                    Load();
                }
                else {
                    AutoLoader("Menu is not deleted because it has child Menu", "error");
                }
            }
        })
    }
}
var edit = function (id, url, cat) {
    var a = $("#txt_menu").val(url);
    var b = $("#category").val(cat);
    $("#hidid").val(id);
    $("#divEditMenu").slideDown();
}
var closeEditDiv = function () {
    $("#category").val("");
    $("#hidid").val("");
    $("#divEditMenu").slideUp();
}

var EditMenu = function () {
    var a = $("#txt_menu").val();
    var b = $("#category").val();
    var url = $("#EditMenu").val();
    var id = $("#hidid").val();
    closeEditDiv();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id, a: a, b: b },
        success: function (res) {
            AutoLoader("Updated successfully", "success");
            $("#modal").hide();
            Load();
        }
    })
}