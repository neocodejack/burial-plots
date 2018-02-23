$(function () {
    $("#li-listing").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
    LoadServiceList();
});
var LoadServiceList = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadServiceListingUrl").val();
    $.ajax({
        url: link,
        type: "get",
        success: function (result) {
            $("#divLoadServiceListing").html(result);
            $("#tblLoadServiceListing").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        },
        error: function () {
            showLoader("Some error occured", "error");
            setTimeout(function () {
                hideLoader();
            }, 3000);
        }
    });


}
var deleteServiceListings = function (id) {
    var aa = confirm("Are you sure you want to delete this ServiceListing?");
    if (aa) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeleteServiceListingUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    LoadServiceList();
                    AutoLoader("Deleted Successfully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}