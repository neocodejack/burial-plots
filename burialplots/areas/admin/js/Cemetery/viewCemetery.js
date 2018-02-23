$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-cemetery").addClass("active start");
    loadCemeteriesPartial();
});

var loadCemeteriesPartial = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadCemeteryUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadCemeteriesPartial").html(res);
            $("#tblLoadCemteries").DataTable({
                "iDisplayLength": 100,
                "order": [[4, "desc"]]
            });
            hideLoader();
        },
        error: function () {
            showLoader("Some error occured", "error");
            setTimeout(function () {
                hideLoader();
            }, 3000);
        }
    });
}

var deleteCemetery = function (id) {
    var aa = confirm("Are you sure you want to delete this Cemetery?");
    if (aa) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeleteCemeteryUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadCemeteriesPartial();
                    showLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            }
        });
    }
}
