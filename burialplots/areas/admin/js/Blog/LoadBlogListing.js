$(document).ready(function () {
    $("#lis-BlogList").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-Blogs").addClass("start active");
    $("#li-contentManage").addClass("start active");
    loadBlogListing();
});
var loadBlogListing = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadBlogListingUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadBlogListing").html(res);
            $("#tblLoadBlogListing").DataTable({
                "iDisplayLength": 100,
                "order":[[0, "desc"]]
            });
            hideLoader();
        }
    });
}
// Delete Blog
var deleteBlogListing = function (id) {
    var aa = confirm("Are you sure, you want to delete this service?");
    if (aa) {
        var link = $("#hidBlogListingDeleteLnk").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadBlogListing();
                    showLoader("Deleted successfully", "success");
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

// Publish Blog
var blogPublish = function (id) {
    var link = $("#hidPublishBloglnk").val();
    $.ajax({

        url: link,
        type:"post",
        data: { id: id },
        success: function (res) {

            if (res == "true") {
                loadBlogListing();
                showLoader("Published successfully", "success");
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

var blogUnPublish = function (id) {
    var link = $("#hidUnPublishBloglnk").val();
    $.ajax({

        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {

            if (res == "true") {
                loadBlogListing();
                showLoader("Un-Published successfully", "success");
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