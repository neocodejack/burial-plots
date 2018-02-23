$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-inventory").addClass("start active open");
    $("#li-planInventory").addClass("start active open");
    loadPurchasePlan();
});

var loadPurchasePlan = function () {
    var filter = $("#drpFilter").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Order/LoadPurchasePlan",
        type: "post",
        data: { filter: filter },
        success: function (res) {
            $("#divLoadPlans").html(res);
            $("#tblLoadPlans").DataTable({
                "iDisplayLength": 50
            });
            $("#drpFilter").val($("#hidFilterType").val());
            hideLoader();
        }
    });
}

var loadServiceListingWise = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Order/LoadServiceListingWise",
        type: "post",
        success: function (res) {
            $("#divLoadPlans").html(res);
            $("#tblLoadPlans").DataTable({
                "iDisplayLength": 50
            });
            hideLoader();
        }
    });
}

var planPurchaseDetails = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Order/LoadPlanPurchaseDetails",
        type: "post",
        data: {id: id},
        success: function (res) {
            $("#divLoadPlans").html(res);
            $("#tblLoadPlans").DataTable({
                "iDisplayLength": 50
            });
            hideLoader();
        }
    });
}
var togglePlanDiv = function () {
    if ($("#drpViewType").val() == "plans") {
        loadPurchasePlan();
    }
    else {
        loadServiceListingWise();
    }
}

var GravesLayerInventoryExport = function () {
    var filter = $("#drpFilter").val();
    window.location.href = "/Admin/Order/GravesLayerInventoryExport?filter=" + filter;
}