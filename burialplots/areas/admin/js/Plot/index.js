$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#lis-plotListing").addClass("start active");
    $("#li-member").addClass("start active open");
    loadPlotListing();
});
var loadPlotListing = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadPlotListingUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadPlotListing").html(res);
            $("#tblLoadPlotListing").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var deletePlot = function (id) {
    var aa = confirm("Are you sure you want to delete this Plot?");
    if (aa) {
        var link = $("#hidDeletePlotUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadPlotListing();
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
