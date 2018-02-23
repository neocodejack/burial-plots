$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-ServiceBox").addClass("start active");
    $("#lis-ViewServiceBox").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    loadServiceBoxes();
});

var loadServiceBoxes = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Page/LoadServiceBoxes",
        type: "post",
        success: function (res) {
            $("#divLoadServiceBoxes").html(res);
            $("#tblLoadServiceBoxes").DataTable({
                "iDisplayLength": 50
            });
            hideLoader();
        }
    });
}

var deleteServiceBox = function (id) {
    if (confirm("Are you sure you want to delete this service box?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Page/DeleteServiceBox",
            type: "post",
            data: {id: id},
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Deleted Successfully", "success");
                    loadServiceBoxes()
                }
                else {
                    AutoLoader("You can't delete this service box because it is already used in some pages.", "error");
                }
            }
        });
    }
}