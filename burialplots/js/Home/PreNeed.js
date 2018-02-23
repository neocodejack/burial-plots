$(document).ready(function () {
    //LoadBlogSection();
});
var searchByPostCodeApi = function () {
    var postCode = $("#txtPostCode").val();
    //var miles = $("#drpDistance").val();
    var religion = $("#drpReligion").val();
    if(postCode=="" && religion==""){
        $("#txtPostCode").css("border", "2px solid red");
        $("#drpReligion").css("border", "2px solid red");
        return;
    }
    window.location.href = "/Home/SearchbyPostCodeApi?postcode=" + postCode + "&religion=" + religion;
}