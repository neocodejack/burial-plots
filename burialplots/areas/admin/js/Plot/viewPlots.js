$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-cemetery").addClass("active start");
    loadPlots();
});

var loadPlots = function () {
    var getUrl = $("#hidLoadPlotsUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        success: function (res) {
            $("#divLoadPlots").html(res);
            $("#tblLoadPlots").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var deletePlotCemetry = function (id) {
    var aa = confirm("Are you sure you want to delete this plot?");
    if (aa) {
        var getUrl = $("#hidDeleteCemeteryPlotUrl").val();
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Deleted Successfully", "success");
                    loadPlots();
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}