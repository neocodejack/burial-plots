$(document).ready({

});

var orderNow = function () {
    var fname = $("#txtFname").val();
    var lname = $("#txtLname").val();
    var address = $("#txtAddress").val();
    var country = $("#txtCountry").val();
    var cellno = $("#txtCellNo").val();
    if (fname == "" || lname == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/BillingInfo",
            type: "post",
            data: { fname: fname, lname: lname, address: address, country: country, cellno: cellno },
            success: function (res) {
                if (res == "true") {
                    showLoader("Thank you for order, We will contact you with in 24 hours.", "success");
                    setTimeout(function () {
                        window.location.href = "/Market/Index";
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