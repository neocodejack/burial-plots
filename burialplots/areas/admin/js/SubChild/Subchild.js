$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-MenuManage").addClass("start active open");
    $("#lis-viewMenu").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    LoadPage();
})
var LoadPage = function () {
    var url = $("#LoadSubMenu").val();
    var id = $("#hidId").val();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id },
        success: function (res) {
            $("#Load").html(res);
            $("#tblload").DataTable();
        }
    })
}
var Delete = function (id) {
    if (confirm("Are you sure you want to delete this sub child menu?")) {
        var url = $("#HiddenDelete").val();
        $.ajax({
            url: url,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "True") {
                    AutoLoader("Sub child menu deleted successfully", "success");
                    LoadPage();
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        })
    }
}

var edit = function (id, menu, menuid, pagetitle, pageurl) {
    var purlArr = pageurl.split('/');
    $("#id").val(id);
    $("#menu").val(menu);
    $("#menuid").val(menuid);
    $("#pagetitle").val(pagetitle);
    $("#pageurl").val(purlArr[purlArr.length - 1]);
    $("#memid").val(id);
    $("#modaldata").css('display', 'block');

}
var hide = function () {
    $("#modaldata").css('display', 'none');
}
var update = function () {
    var url = $("#updateee").val();
    var id = $("#memid").val();
    var b = $("#pagetitle").val();
    var c = $("#pageurl").val();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id, b: b, c: c },
        success: function (res) {
            if (res == "True") {
                AutoLoader("Updated Successfully", "success")
                hide();
                LoadPage();
            }
        }
    })
}