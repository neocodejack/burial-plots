$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-orders").addClass("start active");
    loadOrders();
});

var loadOrders = function () {
    var link = $("#hidLoadOrdersUrl").val();
    var memberId = $("#hIdMember").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: link,
        type: "post",
        data: { memberId: memberId },
        success: function (res) {
            $("#divLoadOrders").html(res);
            $("#tblLoadOrders").DataTable({
                "iDisplayLength": 100,
                "order": [[ 4, "desc" ]]
            });
            hideLoader();
        }
    });
}

var deleteOrder = function (id) {
    var ss = confirm("Are you sure you want to delete this order?");
    if (ss) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeleteOrderUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadOrders();
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

var editOrder = function (id) {
    var link = $("#hidEditOrderUrl").val();
    window.location.href = link + "?id=" + id;
}