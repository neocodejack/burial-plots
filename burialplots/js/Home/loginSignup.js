$(document).ready(function () {
    closeModalEvent();
});
var closeModalEvent = function(){
    $("#modalPasswordRecovery").on("hidden.bs.modal", function () {
        $("#txtRecoveryEmail").val("");
    });
}

var correctCaptcha = function (response) {
    if (response.length == 0) {
        AutoLoader("Please prove that you are not a robot.", "info");
    }

};
var signUp = function () {
    var err = 0;
    $(".txt-required").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "2px solid red");
            err = err + 1;
        }
    });
    setTimeout(function () {
        $(".txt-required").each(function () {
            $(this).css("border", "");
        });
    }, 2000);
 
   
    var fname = $("#txtFname").val();
    var lname = $("#txtLname").val();
    var email = $("#txtEmail").val();
    var password = $("#txtPassword").val();
    var repwd = $("#txtRePassword").val();
    var myurl = $("#hidmsgeurl").val();
    var cellno = $("#txtCellNo").val();

    function isEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }
    var res = isEmail(email);
    if (res != true) {
        AutoLoader("Your email is invalid.", "warning");
        return;
    }

    if (password != "" && password != repwd) {
        AutoLoader("Password does not match", "info");
        $("#txtRePassword").css("border", "2px solid red");
        err = err + 1;
        return;
    }
    if (password != "" && (password.length < 4)) {
        AutoLoader("Password length must be minimum 4  characters", "info");
        $("#txtRePassword").css("border", "2px solid red");
        err = err + 1;
        return;
    }
    //if (err == 0) {

    //    var v = grecaptcha.getResponse();
    //    if (v.length == 0) {
    //        AutoLoader("Please prove that you are not a robot.", "info");
    //        return;
    //    }
    //}

    if (err == 0) {
        showLoader("Please wait..", "info");
        var link = $("#hidSignupUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { fname: fname, lname: lname, email: email, password: password, cellno: cellno },
            success: function (res) {
                if (res == "true") {
                    $(".txt-required").each(function () {
                        $(this).val("");
                    });
                    $("#txtCellNo").val("");
                    hideLoader();

                    location.href = myurl;
                }
                else if (res == "exist") {
                    showLoader("Sorry, This email ID already exists", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            },
            error: function () {
                showLoader("Error", "error");
                setTimeout(function () {
                    hideLoader();
                }, 3000);
            }
        });
    }
}

var login = function () {
    var err = 0;
    $(".txt-required-login").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "2px solid red");
            err = err + 1;
        }
    });
    setTimeout(function () {
        $(".txt-required-login").each(function () {
            $(this).css("border", "");
        });
    }, 2000);
    var email = $("#txtEmailLogin").val();
    var role = $("#hidrole").val();
    var password = $("#txtPasswordLogin").val();
    if (err == 0) {
        showLoader("Please wait..", "info");
        var link = $("#hidLoginUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { email: email, password: password, role: role },
            success: function (res) {
                if (res == "true") {
                    $(".txt-required-login").each(function () {
                        $(this).val("");
                    });
                    window.location.href = "/Home/GetListed";
                    hideLoader();
                }
                else if (res == "false") {
                    showLoader("Incorrect username and password", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else if (res == "verify") {
                    showLoader("Please verify your email first.Check your inbox.", "info");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else if (res == "exist") {
                    showLoader("Incorrect username and password", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            },
            error: function () {
                showLoader("Error", "error");
                setTimeout(function () {
                    hideLoader();
                }, 3000);
            }
        });
    }
}

var loginByEnter = function (e) {
    if (e.which == 13) {
        login();
    }
}

var recoverPassword = function () {
    var email = $("#txtRecoveryEmail").val();
    if (email.trim() == "") {
        AutoLoader("Please enter email first", "info");
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Home/SendRecoveryEmail",
        type: "post",
        data: { email: email },
        success: function (res) {
            if (res == "true") {
                AutoLoader("Recovery email sent, Pleas check your email.", "success");
                $("#modalPasswordRecovery").modal("hide");
            }
            else if (res == "notExists") {
                AutoLoader("This email address does not exist", "error");
            }
            else {
                AutoLoader("Something went wrong", "error");
            }
        }
    });
}