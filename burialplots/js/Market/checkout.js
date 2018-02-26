$(document).ready(function () {
    loadCartItems();
    
});

var loadCartItems = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Market/LoadCartItems",
        type: "post",
        success: function (res) {
            $("#divLoadCartItems").html(res);
            hideLoader();
        }
    });
}

var removeCartItem = function (id) {
    var aa = confirm("Are you sure you want to remove this item?");
    if (aa) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/RemoveToCart",
            data: { id: id },
            success: function (res) {
                loadCartItems();
                loadCategories();
            }
        });
    }
}

var checkOut = function () {
    window.location.href = "/Market/BillingInfo";
}


var form = document.getElementById('paymentForm');
var token = "";
Worldpay.useOwnForm({
    'clientKey': 'T_C_92184359-f158-40c5-8713-b92ef25f72e9',
    'form': form,
    'reusable': false,
    'callback': function (status, response) {
        //document.getElementById('paymentErrors').innerHTML = '';
        if (response.error) {
            var cardfields = 0;
            $(".card-fields").each(function () {
                if ($(this).val() == "") {
                    $(this).css("border", "1px solid red");
                    cardfields++;
                }
            });
            if (cardfields != 0) {
                setTimeout(function () {
                    $(".card-fields").css("border", "1px solid #B6BCC8");
                }, 4000);
            }
            //else {
            //    AutoLoader("Some thing went wrong, Please fill again payment form carefully", "error");
            //}
        } else {
            token = response.token;
            Worldpay.formBuilder(form, 'input', 'hidden', 'token', token);
            nextPreviousBtns('paymentNext');
            //console.log(token);

            //$.ajax({
            //    url: "/Home/payment/",
            //    data: { token: token },
            //    success: function (data) {
            //        alert();
            //        form.submit();
            //    },
            //    dataType: "html",
            //    type: "POST",
            //    cache: false,
            //    error: function () {
            //    }
            //});
        }
    }
});

var nextPreviousBtns = function (type) {
    if (type == "checkoutNext") {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/BillingInfoCheck",
            type: "post",
            success: function (res) {
                if (res == "empty") {
                    window.location.href = "/Market/CemeteryPlots";
                }
                else if (res == "login") {
                    hideLoader();
                    $("#FirstNextButtton").hide();
                    $("#divLoadCartItems").hide();
                    $("#divRegisteration").show();
                    //$("#divRegisteration").slideDown();
                    //$('html, body').animate({
                    //    scrollTop: $("#divSignup").offset().top
                    //}, 2000);
                }
                else if (res == "true") {
                    hideLoader();
                    $("#FirstNextButtton").hide();
                    $("#divLoadCartItems").hide();
                    $("#divRegisteration").show();

                    //-------------------------------------//
                    //$("#FirstNextButtton").hide();
                    //$("#divLoadCartItems").hide();
                    //$("#BillingBar").addClass("current");
                    //$("#checkoutBar").removeClass("current");
                    //$("#divBillingInfo").show();
                    // -------------------------------------//
                    //$("#divCheckout").slideUp();
                    //$("#divBillingInfo").slideDown();
                    //$("#txtHead").text("2-Billing Info");
                    //$("#billingProgress").css("width", "100%");
                    //$('html, body').animate({
                    //    scrollTop: $("#divBillingInfo").offset().top
                    //}, 2000);
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
    if (type == "registerNext") {
        var err = 0;
        if ($("#chkLogin").is(":checked")) {
            $(".login-valid").each(function () {
                if ($(this).val() == "") {
                    $(this).css("border", "2px solid red");
                    err = err + 1;
                }
            });
            setTimeout(function () {
                $(".login-valid").each(function () {
                    $(this).css("border", "2px solid #DDDDDD");
                });
            }, 3000);
        }
        else {
            $(".field-valid").each(function () {
                if ($(this).val() == "") {
                    $(this).css("border", "2px solid red");
                    err = err + 1;
                }
            });
            setTimeout(function () {
                $(".field-valid").each(function () {
                    $(this).css("border", "2px solid #DDDDDD");
                });
            }, 3000);
        }

        if (err == 0) {
           
            $("#divRegisteration").hide();
            $("#divBillingInfo").show();
            //$("#billingInfo").css("border-bottom", "4px solid #1e222c");
            //$("#billingInfo").css("background-color", "#6e7a92");
            //$("#billingInfo").css("color", "#fff");
            $("#BillingBar").addClass("current");
            $("#checkoutBar").removeClass("current");
            //$("#divBillingInfo").slideDown();
            //$("#billingProgress").css("width", "100%");
            //$('html, body').animate({
            //    scrollTop: $("#divBillingInfo").offset().top
            //}, 2000);
        }
    }
    if (type == "registerPre") {
        //$("#divCheckout").slideDown();
        //$('html, body').animate({
        //    scrollTop: $("#divPro").offset().top
        //}, 2000);
        $("#divRegisteration").hide();
        $("#FirstNextButtton").show();
        $("#divLoadCartItems").show();
    }
    if (type == "billingPre") {
        //$("#divCheckout").slideDown();
        ////$("#txtHead").text("1-Checkout");
        //$("#billingProgress").css("width", "0%");
        //$('html, body').animate({
        //    scrollTop: $("#divPro").offset().top
        //}, 2000);
        $("#divRegisteration").show();
        $("#divBillingInfo").hide();
        $("#checkoutBar").addClass("current");
        $("#BillingBar").removeClass("current");
    }
    if (type == "billingNext") {
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

            $("#PaymentBar").addClass("current");
            $("#BillingBar").removeClass("current");
            $("#divBillingInfo").hide();
            $("#divPayment").show();
            
            
            //$("#divPayment").slideDown();
            //$("#divBillingInfo").slideUp();
            //$("#txtHead").text("3-Payment");
            //$("#paymentProgress").css("width", "100%");
            //$('html, body').animate({
            //    scrollTop: $("#divPayment").offset().top
            //}, 2000);
        }
    }
    if (type == "paymentPre") {
        //$("#divPayment").slideUp();
        //$("#divBillingInfo").slideDown();
        //$("#txtHead").text("3-Billing Info");
        //$("#paymentProgress").css("width", "0%");
        //$('html, body').animate({
        //    scrollTop: $("#divTempBiling").offset().top
        //}, 2000);
        $("#divPayment").hide();
        $("#divBillingInfo").show();
        $("#BillingBar").addClass("current");
        $("#PaymentBar").removeClass("current");
    }
    if (type == "paymentNext") {
        var fname = $("#txtFname").val();
        var lname = $("#txtLname").val();
        var address = $("#txtAddress").val();
        var country = $("#txtCountry").val();
        var cellno = $("#txtCellNo").val();
        //////////Registration//////////
        var regFname = $("#txtRegFname").val();
        var regLname = $("#txtRegLname").val();
        var regEmail = $("#txtEmail").val();
        var regPassword = $("#txtRegPassword").val();
        var regCellNo = $("#txtRegCellNo").val();
        ////////Login
        var isLogin = "false";
        if ($("#chkLogin").is(":checked")) {
            isLogin = "true";
        }
        var loginEmail = $("#txtLoginEmail").val();
        var loginPassword = $("#txtLoginPassword").val();
        if (fname == "" || lname == "") {
            showLoader("Please fill the required fields", "info");
            setTimeout(function () {
                hideLoader();
            }, 3000);
        }
        else {
            if (isLogin == "false") {
                if (regEmail == "" || regPassword == "") {
                    AutoLoader("Please fill Email or Password field", "info");
                    $('html, body').animate({
                        scrollTop: $("#divSignup").offset().top
                    }, 2000);
                    return;
                }
            }
            showLoader("Please wait..", "info");
            $.ajax({
                url: "/Market/BillingInfo",
                type: "post",
                data: {
                    fname: fname, lname: lname, address: address, country: country, cellno: cellno, regFname: regFname, regLname: regLname, regEmail: regEmail, regPassword: regPassword, regCellNo: regCellNo,
                loginEmail: loginEmail, loginPassword: loginPassword, isLogin: isLogin, token:token},
                success: function (res) {
                    if (res == "true") {
                        hideLoader();
                        $("#divPayment").hide();
                        $("#divThank").slideDown();
                        $("#divThank").show();
                        $("#ThankuBar").addClass("current");
                        $("#PaymentBar").removeClass("current");
                    }
                    else if (res == "exists") {
                        AutoLoader("This email address already exists", "error");
                        $("#txtEmail").css("border", "2px solid red");
                        $('html, body').animate({
                            scrollTop: $("#divSignup").offset().top
                        }, 2000);
                    }
                    else if (res == "notExists") {
                        AutoLoader("Incorrect Email or Password", "error");
                        $("#txtLoginEmail").css("border", "2px solid red");
                        $("#txtLoginPassword").css("border", "2px solid red");
                        $('html, body').animate({
                            scrollTop: $("#divSignup").offset().top
                        }, 2000);
                    }
                    else if(res == "false") {
                        showLoader("Error", "error");
                        setTimeout(function () {
                            hideLoader();
                        }, 3000);
                    }
                    else {
                        hideLoader();
                        $("#divPayment").hide();
                        $("#divThank").slideDown();
                        $("#divThank").show();
                        $("#ThankuBar").addClass("current");
                        $("#PaymentBar").removeClass("current");
                        $("#divShowApierror").html("<h2 style='color:red'>Payment Error</h2><br>" + res);
                    }
                }
            });
        }
    }
}

var showLogin = function (type) {
    if (type == "new") {
        $("#chkLogin").prop("checked", false);
        $("#divRegister").slideDown();
        $("#divLogin").slideUp();
        $("#spnLogin").show();
        $("#spnNew").hide();
        //$('html, body').animate({
        //    scrollTop: $("#divSignup").offset().top
        //}, 2000);
    }
    else {
        $("#chkLogin").prop("checked", true);
        $("#divRegister").slideUp();
        $("#divLogin").slideDown();
        $("#spnLogin").hide();
        $("#spnNew").show();
        //$('html, body').animate({
        //    scrollTop: $("#divSignup").offset().top
        //}, 2000);
    }

}

var removeFromCart = function (id) {
    if (confirm("Are you sure you want to remove this item from cart")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/RemoveFromCart",
            type: "post",
            data: { id: id },
            success: function (res) {
                $("#cartCount").text(res);
                showLoader("<p>Remove from cart Successfully </p><button class='btn btn-primary'>Checkout</button>", "success");
                setTimeout(function () {
                    hideLoader();
                }, 4000);
                loadCartItems();
            }
        });
    }
}