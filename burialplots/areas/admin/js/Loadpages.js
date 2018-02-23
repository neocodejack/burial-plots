$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-page").addClass("start active");
    $("#lis-viewPage").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    loadPages();
});

var loadPages = function () {
    $.ajax({
        url: "/Admin/Page/LoadPagesPartial",
        type: "post",
        success: function (res) {
            $("#LoadPages").html(res);
            $("#tblMember").DataTable({

                "aLengthMenu": [100],
                "order": [[0, "desc"]]
            });
        }
    });
}
var Delete = function (id) {
    var url = $ ("#HiddenDelete").val();
    if (confirm("Are you sure you want to delete this Page?")) {
        $.ajax({
            url: url,
            type: "Post",
            data: { id: id },
            success: function (res) {

                if (res == "True") {
                    AutoLoader("Deleted Successfully", "success");
                    loadPages();
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var vid;
var edit = function (id) {
    vid = id;
    window.location.href("/Page/Edit");
}