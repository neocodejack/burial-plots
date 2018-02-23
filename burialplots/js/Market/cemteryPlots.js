$(document).ready(function () {
    loadCemeteryPlots();
});

var loadCemeteryPlots = function () {
    showLoader("Please wait..", "info");
    var townId = $("#hidLocationId").val();
    $.ajax({
        url: "/Market/LoadCemeteryPlots",
        type: "post",
        data: { townId: townId },
        success: function (res) {
            $("#divLoadPlotCemetriesGrid").html(res);
            hideLoader();
        }
    });
}
