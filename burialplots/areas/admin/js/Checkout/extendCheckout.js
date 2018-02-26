$(document).ready(function () {
   // loadCartItems();
    nextPreviousBtns('checkoutNext')
});

var loadCartItems = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Users/LoadCartItems",
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
    window.location.href = "/Users/BillingInfo";
}


var nextPreviousBtns = function (type) {

    if (type == "checkoutNext") {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Users/ExtendBillingInfoCheck",
            type: "post",
            success: function (res) {
                if (res == "empty") {
                    window.location.href = "/Admin/Users/MyListings";
                }
                else if (res == "true") {
                    $("#FirstNextButtton").hide();
                    $("#divLoadCartItems").hide();
                    $("#divBillingInfo").show();
                    $("#BillingBar").addClass("current");
                    $("#checkoutBar").removeClass("current");
                }
                hideLoader();
            }
        })
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
            $("#BillingBar").addClass("current");
            $("#checkoutBar").removeClass("current");
        }
    }
    if (type == "registerPre") {
        $("#divRegisteration").hide();
        $("#FirstNextButtton").show();
        $("#divLoadCartItems").show();

    }
    if (type == "billingPre") {
        $("#divBillingInfo").hide();
        $("#divLoadCartItems").show();
        $("#checkoutBar").addClass("current");
        $("#BillingBar").removeClass("current");
        $("#FirstNextButtton").show();
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
            var fname = $("#txtFname").val();
            var lname = $("#txtLname").val();
            var address = $("#txtAddress").val() + " " + $("#txtAddress2").val();
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

                    }
                }
                showLoader("Please wait..", "info");
                $.ajax({
                    url: "/Admin/Checkouts/BillingExtendInfo",
                    type: "post",
                    data: {
                        fname: fname, lname: lname, address: address, country: country, cellno: cellno, regFname: regFname, regLname: regLname, regEmail: regEmail, regPassword: regPassword, regCellNo: regCellNo,
                        loginEmail: loginEmail, loginPassword: loginPassword, isLogin: isLogin
                    },
                    success: function (responce) {
                        if (responce == "exists") {
                            AutoLoader("This email address already exists", "error");
                            $("#txtEmail").css("border", "2px solid red");
                            $('html, body').animate({
                                scrollTop: $("#divSignup").offset().top
                            }, 2000);
                        }
                        else if (responce == "notExists") {
                            AutoLoader("Incorrect Email or Password", "error");
                            $("#txtLoginEmail").css("border", "2px solid red");
                            $("#txtLoginPassword").css("border", "2px solid red");
                            $('html, body').animate({
                                scrollTop: $("#divSignup").offset().top
                            }, 2000);
                        }
                        else if (responce == "false") {
                            showLoader("Error", "error");
                            setTimeout(function () {
                                hideLoader();
                            }, 3000);
                        }
                        else if (responce == "instalId") {
                            showLoader("Installation Id not Set", "error");
                            setTimeout(function () {
                                hideLoader();
                            }, 3000);
                        }
                        else {
                            var res = JSON.parse(responce);
                            if (res.Data.msg == "true") {
                                $("#instId").val(res.Data.InstallId);
                                $("#cartId").val(res.Data.CartId);
                                $("#amount").val(res.Data.Amount);
                                $("#currency").val(res.Data.Currency);

                                $("#postcode").val($("#txtPostCode").val());
                                $("#tel").val($("#txtCellNo").val());
                                $("#country").val($("#txtCountry").val());
                                $("#town").val($("#txtTown").val());
                                $("#address").val($("#txtAddress").val());
                                $("#address2").val($("#txtAddress2").val());
                                $("#region").val($("#txtRegion").val());
                                $("#name").val(fname + " " + lname);
                                $("#btnSubmit").click();
                            }
                        }
                    }
                });
            }
        }
    }
    if (type == "paymentPre") {
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

                }
            }
            showLoader("Please wait..", "info");
            $.ajax({
                url: "/Users/BillingInfo",
                type: "post",
                data: {
                    fname: fname, lname: lname, address: address, country: country, cellno: cellno, regFname: regFname, regLname: regLname, regEmail: regEmail, regPassword: regPassword, regCellNo: regCellNo,
                    loginEmail: loginEmail, loginPassword: loginPassword, isLogin: isLogin, token: token
                },
                success: function (res) {
                    if (res == "true") {
                        hideLoader();
                        $("#divPayment").hide();
                        $("#divThank").slideDown();
                        $("#divThank").show();
                        $("#ThankuBar").addClass("current");
                        $("#PaymentBar").removeClass("current");
                        //$("#divPayment").slideUp();
                        //$("#divBillingInfo").slideUp();
                        //$("#divCheckout").slideUp();
                        //$("#divRegisteration").slideUp();
                        //$("#divThank").slideDown();
                        //$("#txtHead").text("");
                        //$('html, body').animate({
                        //    scrollTop: $("#divPro").offset().top
                        //}, 2000);
                        //$("#thankProgress").css("width", "100%");
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
                    else if (res == "false") {
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

var removeFromCart = function (county, business, plan) {
    if (confirm("Are you sure you want to remove this item from cart")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Users/RemoveFromCart",
            type: "post",
            data: { county: county, business: business, plan: plan },
            success: function (res) {
                AutoLoader("<p>Plan is Removed from cart Successfully </p>", "success");
                loadCartItems();
            }
        });
    }
}