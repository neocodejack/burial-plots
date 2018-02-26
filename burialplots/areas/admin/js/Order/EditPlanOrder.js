$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-planOrders").addClass("start active");
});

var updateOrderStatus = function (id) {
    var link = $("#hidUpdatePlanOrderStatusUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: link,
        type: "post",
        data: { id: id, status: $("#drpStatus").val() },
        success: function (res) {
            if (res == "true") {
                showLoader("Updated successfully", "success");
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