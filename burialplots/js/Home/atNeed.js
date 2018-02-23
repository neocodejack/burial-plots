$(function () {
    LoadBlogSection();
});
var LoadBlogSection = function () {

    showLoader("Please wait..", "info");
    var link = $("#hIdLoadBlogSection").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#loadBlogSection").html(res);
            hideLoader();
        },
        error: function () {
            AutoLoader("Error", "error");
            hideLoader();
        }
    });
}