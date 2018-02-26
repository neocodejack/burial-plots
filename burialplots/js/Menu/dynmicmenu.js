$(document).ready(function () {
    
    loadCategories();
    
});

var loadCategories = function () {

    var id="1";
    var getUrl = $("#hidLoadCategories").val();
    if (getUrl == "/Admin/Home/loadmenu")
    {
        getUrl="/Home/loadmenu"
    }
    $.ajax({
        url: getUrl,
        type: "get",
        data: { html: id },
        success: function (msg) {
            $('#divLoadCategoriesLayout').html(msg);
            $('#divLoadCategoriesLayout').show();
          //loadCartItems();
        },
        error: function () {
        }
    });
}

var loadCartItems = function () {
    $.ajax({
        url: "/Market/AddToCart",
        type: "post",
        success: function (res) {
            alert(res);
            if (res == "qty") {
                $("#cartCount").text("0");
            }
            else {
                $("#cartCount").text(res);
            }
        }
    });
}