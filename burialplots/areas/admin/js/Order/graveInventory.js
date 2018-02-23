$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-inventory").addClass("start active open");
    $("#li-graveInventory").addClass("start active open");
    loadCemeterLayers();
});

var loadCemeterLayers = function () {
    var filter = $("#drpFilter").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Order/LoadCemeteryLayers",
        type: "post",
        data: { filter: filter },
        success: function (res) {
            $("#divLoadGraves").html(res);
            $("#tblLoadGraves").DataTable({
            "iDisplayLength": 50
            });
            $("#drpFilter").val($("#hidFilterType").val());
            hideLoader();
        }
    });
}

var loadGravesWise = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Order/LoadGravesWise",
        type: "post",
        success: function (res) {
            $("#divLoadGraves").html(res);
            $("#tblLoadGraves").DataTable({
                "iDisplayLength": 50
            });
            hideLoader();
        }
    });
}

var toggleGravesDiv = function () {
    if ($("#drpViewType").val() == "internement") {
        loadCemeterLayers();
    }
    else {
        loadGravesWise();
    }
}

var GravesLayerInventoryExport = function () {
    var filter = $("#drpFilter").val();
    window.location.href = "/Admin/Order/GravesLayerInventoryExport?filter=" + filter;
}