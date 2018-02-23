$(document).ready(function () {
    $("#ShowLess").hide();
    $("#ShowMore").hide();
    LoadBlogList();
    
});
var LoadBlogList = function () {
    showLoader("Please wait..", "info");
    var link = $("#hIdLoadMoreBlog").val();
    $.ajax({
        url: link,
        type: "get",
        success: function (res) {
         
            $("#LoadBlogList").html(res);
            size_li = $("#myList li").size();
            x = 1;
            $('#myList li:lt(' + x + ')').show();
            
            var totalBlogCount = $("#hIdTotalBlogCount").val();
            var BlogCount = $("#hIdBlogCount").val();
            //alert(totalBlogCount + ' ' + BlogCount);
            if (BlogCount < totalBlogCount) {
                $("#ShowMore").show();
                $("#ShowLess").hide();
            }
            else {
                $("#ShowMore").hide();
            }
          
            hideLoader();
        },
       // error:function(){
       // AutoLoader("Error", "error");
       // hideLoader();
       //}
    });
}
var ShowMoreBlog = function () {
    showLoader("Please wait..", "info");
    var totalBlogCount = $("#hIdTotalBlogCount").val();
    var BlogCount = $("#hIdBlogCount").val();

    var BlogCount1 = $("#hIdMoreBlogCount").val();
    var totalBlogCount1 = $("#hIdMoreTotalBlogCount").val();

    //alert(BlogCount1 + ' ' + totalBlogCount1);
    if (BlogCount1 != undefined) {
        if (BlogCount1 != "") {
            BlogCount = BlogCount1;
            totalBlogCount = totalBlogCount1;
        }
    }

    
    $.ajax({

        url: "/NewsArticals/LoadMoreBlog",
        type: "get",
        data: { BlogCount: BlogCount, totalBlogCount: totalBlogCount },
        success: function (res) {
            hideLoader();
            $("#LoadMoreBlog").show();
            $("#LoadMoreBlog").html(res);
            var BlogCount1 = $("#hIdMoreBlogCount").val();
            var totalBlogCount1 = $("#hIdMoreTotalBlogCount").val();
            BlogCount1 = parseInt(BlogCount1);
            totalBlogCount1 = parseInt(totalBlogCount1);
            if (BlogCount1 >= totalBlogCount1) {
                $("#ShowMore").hide();
                $("#hIdMoreBlogCount").val("");
                $("#hIdMoreTotalBlogCount").val("");
                hideLoader();
            }
            $("#ShowLess").show();
            hideLoader();
        },
        error: function () {
            AutoLoader("Error", "error");
            hideLoader();
        }

    });
}
var LoadLessBlog = function () {
    $("#LoadMoreBlog").hide();
    LoadBlogList();

}