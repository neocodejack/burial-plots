$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-planOrders").addClass("start active");
    loadPlanOrders();
});

var loadPlanOrders = function () {
    var link = $("#hidLoadPlanOrdersUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadPlanOrders").html(res);
            $("#tblPlanLoadOrders").DataTable({
                "iDisplayLength": 100,
                "order": [[5, "desc"]]
            });
            hideLoader();
        }
    });
}

var deletePlanOrder = function (id) {
    var ss = confirm("Are you sure you want to delete this order?");
    if (ss) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeletePlanOrderUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadPlanOrders();
                    showLoader("Deleted successfully", "success");
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

var editPlanOrder = function (id) {
    var link = $("#hidEditPlanOrderUrl").val();
    window.location.href = link + "?id=" + id;
}