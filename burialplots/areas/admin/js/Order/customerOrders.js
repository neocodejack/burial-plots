$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-orders").addClass("start active");
    $("#tblLoadOrders").DataTable();
});
