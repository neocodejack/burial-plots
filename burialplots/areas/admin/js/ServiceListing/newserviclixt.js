$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-mynewlist").addClass("start active");
    loadServiceListing();
});

var loadServiceListing = function () {
    var businessId = $("#drpBusiness").val();
    var partnerId = $("#hidPartnerId").val();
    showLoader("Please wait..", "info");
    var link = $("#hidLoadServiceListingUrl").val();
    $.ajax({
        url: link,
        type: "post",
        data: {businessId: businessId, partnerId: partnerId},
        success: function (res) {
            $("#divLoadServiceListingbne").html(res);
            $("#tblLoadServicenewListing").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        }
    });
}

var Approved = function (id) {
    showLoader("Please wait..", "info");
    var link = $("#hidApprovedService").val();
    $.ajax({
        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "true") {
                loadServiceListing();
                AutoLoader("Approved Successfully", "success");
            }
        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });
   

}
var DisApproved = function (id) {
    showLoader("Please wait..", "info");
    var link = $("#hidDisApprovedService").val();
    $.ajax({
        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "true") {
                loadServiceListing();
                AutoLoader("DisApproved Successfully", "success");
            }
        },
        error: function () {
            AutoLoader("Error", "error");
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
                    loadServiceListing();
                    AutoLoader("Deleted Successfully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}