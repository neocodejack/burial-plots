$(document).ready(function () {
    datepicker();
});

var FormEnquiry = function () {

    var fName = $("#fName").val();
    var Email = $("#txtEmail").val();
    var cemeteryName = $("#txtCemeteryName").val();
    var noofPlots = $("#txtNoofPlots").val();
    var price = $("#txtPurchasePrice").val();
    var address = $("#txtAddress").val();
    var f = false;
    $(".txt-required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "1px solid red");
            setTimeout(function () {
                $(this).css("border", "");
            }, 3000);
            f = true;
        }
    });
    if (f) {
        setTimeout(function () {
            $(".txt-required").each(function () {
                $(this).css("border", "");
            });
        }, 3000);
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Market/EnquiryFormSellPlots",
        data: { fName: fName, Email: Email, cemeteryName: cemeteryName, noofPlots: noofPlots, price: price, address: address },
        type: "post",
        success: function (res) {
            if (res == "true") {
                $(".txt-required").val("");
                hideLoader();
                document.getElementById('btnClose').click();
                $(".sweet-alert").css("width", "70%");
                $(".sweet-alert").css("margin-left", "-482px");
                setTimeout(function () {
                    swal('Submitted!', "Thank you! \n Your inquiry has been sent. Our representative will respond you within 24 Hours.", 'success');
                }, 1000);
            }

        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });
}


var datepicker = function () {
    $(".datepicker").datepicker();
}

var submitEnquiry = function () {
    var fname = $("#txtFname").val();
    var lname = $("#txtLname").val();
    var email = $("#txtEmail").val();
    var message = $("#txtMessage").val();
    if (fname == "" || message == "") {
        $("#txtFname").css("border", "1px solid red");
        $("#txtMessage").css("border", "1px solid red");
        setTimeout(function () {
            $("#txtFname").css("border", "");
            $("#txtMessage").css("border", "");
        }, 3000);
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Market/SubmitSellPlotEnquiry",
        type: "post",
        data: { fname: fname, lname: lname, email: email, message: message },
        success: function(res){
            if (res == "true") {
                $("#txtFname").val("");
                $("#txtLname").val("");
                $("#txtEmail").val("");
                $("#txtMessage").val("");
                hideLoader();
                $(".sweet-alert").css("width", "70%");
                $(".sweet-alert").css("margin-left", "-482px");
                swal('Submitted!', "Thank you! \n Your inquiry has been sent. Our representative will respond you within 24 Hours.", 'success');
            }
        }
    });
}