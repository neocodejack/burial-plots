$(function () {
    $("#li-Order").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
    loadOrders();
});
var loadOrders = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Users/LoadOrders",
        type: "post",
        success: function (res) {
            $("#loadOrders").html(res);
            $("#tblLoadOrders").DataTable({
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}
