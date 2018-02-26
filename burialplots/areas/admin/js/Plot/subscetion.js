$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-cemetery").addClass("active start");
    loadsubSection();
});

var loadsubSection = function () {
    var getUrl = $("#hidLoadsubSectionUrl").val();
    var id = $("#idscbsuciton").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: { id: id },
        success: function (res) {
            $("#divLoadsubsec").html(res);
            $("#tblloadsubsection").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var deletesection = function (id) {
    var aa = confirm("Are you sure you want to delete this Plot?");
    if (aa) {
        var link = $("#hidDeletePlotUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadsubSection();
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