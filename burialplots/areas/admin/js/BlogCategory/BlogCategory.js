$(document).ready(function () {
    $("#lis-blogcat").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-Blogs").addClass("start active");
    $("#li-contentManage").addClass("start active");
    loadBlogCategory();
});

var loadBlogCategory = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadFuneralServices").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadBlogCategories").html(res);
            $("#tblLoadBlogCategory").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}
var saveBlogCategory = function () {

    var link = $("#hidSaveBlogCategoryUrl").val();
    var id = $("#hidId").val();
    var name = $("#txtName").val();

    $.ajax({

        url: link,
        type: "post",
        data: { id: id, name: name },
        success: function (res) {
            if (res == "true") {
                loadBlogCategory();
                resetAllFields();
                AutoLoader("Success","success");
            }
        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });
    
}
var editBlogCategory = function (id, name) {
    $("#hidId").val(id);
    $("#txtName").val(name);
}
var deleteBlogCategory = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidDeleteBlogCategoryUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadBlogCategory();
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
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    
}