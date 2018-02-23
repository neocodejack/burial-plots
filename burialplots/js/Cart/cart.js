$(document).ready(function () {

});
var addtocart= function (Id) {
   
    var id = Id;
    var geturl = $("#addtocart").val();
    $.ajax({
        url: geturl,
        type: "Post",
        data: { Id: id },
        success:function(result)
        {
            if (result == "true") {
                alert("Product Added To Cart Succefully");
            }
            else {
                alert("Product Not Added To Succefully");
            }
        }
            
    })

    
}
var Deletetocart = function (Id) {

    var id = Id;
    var geturl = $("#deltecart").val();
    $.ajax({
        url: "/Product/DeleteCart",
        type: "Post",
        data: { Id: id },
        success: function (result) {
            if (result == "true") {
                alert("Product Deleted To Cart Succefully");
                loadcart();
            }
            else {
                alert("Product Not Deleted ");
            }
        }

    })


}
var Checkout = function () {

   
    var geturl = $("#addtocart").val();
    $.ajax({
        url: "/Product/Payment",
        type: "Post",
        data: { Id: 1 },
        success: function (result) {
            if (result !=null) {
                window.location = "/Orders/Index";
               
            }
            else {
                alert("Product Not Purchase Succefully");
            }
        }

    })


}

//var loadcart=function()
//{
//    var geturl = $("#relodpage").val();
//    $.ajax({
//        url: "/Product/Chekout"
//    })
//}