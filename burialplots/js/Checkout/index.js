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

var nextPreviousBtns = function (type) {
    if (type == "checkoutNext") {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/BillingInfoCheck",
            type: "post",
            success: function (res) {
                if (res == "empty") {
                    AutoLoader("Your cart is empty");
                    return;
                    //window.location.href = "/Market/CemeteryPlots";
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
                    hideLoader();
                    var customerData = JSON.parse(res);
                    
                    $("#FirstNextButtton").hide();
                    $("#divLoadCartItems").hide();
                    $("#divBillingInfo").show();
                    $("#BillingBar").addClass("current");
                    $("#checkoutBar").removeClass("current");
                    $("#txtRegFname").val(customerData.FirstName);
                    $("#txtRegLname").val(customerData.LastName);
                    $("#txtEmail").val(customerData.Email);
                    $("#txtCountry").val("UK");
                    $("#txtRegPassword").val(customerData.Password);
                }
            }
        });
    }
    if (type == "registerNext") {
        var err = 0;
        var fname = $("#txtRegFname").val();
        var lname = $("#txtRegLname").val();
        var address = $("#txtCountry").val();
        var country = $("#txtCountry").val();
        var cellno = $("#txtRegCellNo").val();
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
            $("#txtFname").val(fname);
            $("#txtLname").val(lname);
            $("#txtCellNo").val(cellno);
            $("#txtCountry").val("UK")
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
            if (regPassword != "" && (regPassword.length < 4)) {
                $("#txtRegPassword").css("border", "2px solid red");
                AutoLoader("Password length must be minimum 4  characters", "info");
                return;
            }
            else {
                $("#txtRegPassword").css("border", "");
            }
            function isEmail(email) {
                var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                return regex.test(email);
            }
          
            var regCellNo = $("#txtRegCellNo").val();
            var agentCode = $("#txtAgentCode").val();
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
                //alert(agentCode);
                showLoader("Please wait..", "info");
                $.ajax({
                    url: "/Checkout/BillingInfo",
                    type: "post",
                    data: {
                        fname: fname, lname: lname, address: address, country: country, cellno: cellno, regFname: regFname, regLname: regLname, regEmail: regEmail, regPassword: regPassword, regCellNo: regCellNo,
                        loginEmail: loginEmail, loginPassword: loginPassword, isLogin: isLogin, agentCode: agentCode
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
                                if ($("#txtLoginEmail").val() != "") {
                                    $("#email").val($("#txtLoginEmail").val());
                                }
                                else if ($("#txtEmail").val() != "") {
                                    $("#email").val($("#txtEmail").val());
                                }
                                $("#name").val(fname + " " + lname);
                                $("#btnSubmit").click();
                                //hideLoader();
                                //$("#divPayment").hide();
                                //$("#divThank").slideDown();
                                //$("#divThank").show();
                                //$("#ThankuBar").addClass("current");
                                //$("#PaymentBar").removeClass("current");
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