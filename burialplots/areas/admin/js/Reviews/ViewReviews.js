$(document).ready(function () {
    $("#tblLoadReviewsListing").DataTable({
        "iDisplayLength": 100
    });
});

var Approved = function (id) {
    showLoader("Please wait..", "info");
    var link = $("#hidApprovedReview").val();
    $.ajax({
        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "true") {
                window.location.reload();
                showLoader("Approved Successfully", "success");
            }
        },
        error: function () {
            showLoader("Error", "error");
        }
    });
    hideLoader();

}
var DeltedReview = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidDeleteReview").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    window.location.reload();
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