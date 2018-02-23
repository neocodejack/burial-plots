$(document).ready(function () {
    $('img').click(function (e) {
        var offset = $(this).offset();
        var X = (e.pageX - offset.left);
        var Y = (e.pageY - offset.top);
        $('#coord').text('X: ' + X + ', Y: ' + Y);
    });
});

var getPlanPrice = function () {
    var sPlanIds = [];
    $(".chkExtend").each(function () {
        if ($(this).is(":checked")) {
            sPlanIds.push($(this).val());
        }
    });
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Users/GetServicePlanPrice",
        type: "post",
        data: {sPlanIds: JSON.stringify(sPlanIds)},
        success: function (res) {
            $("#spnTotal").text("Total Price: " + res);
            totalAmount = parseFloat(res);
            hideLoader();
        }
    });
}
var totalAmount = 0;
var ExtendExpiryDate = function () {
    var sPlanIds = [];
    $(".chkExtend").each(function () {
        if ($(this).is(":checked")) {
            sPlanIds.push($(this).val());
        }
    });
    if (sPlanIds.length == "") {
        AutoLoader("Please select Payment Plan", "info");
        return;
    }
    if (totalAmount == 0) {
        AutoLoader("Please select Payment Plan", "info");
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Users/ExtendExpiryDate",
        type: "post",
        data: { sPlanIds: JSON.stringify(sPlanIds) },
        success: function (res) {
            hideLoader();
            if (res == "true") {
                window.location.href = "/Admin/Checkouts/ExtendCheckout"
            }
            else {
                AutoLoader("Something went wrong", "error");
            }
        }
    });
}