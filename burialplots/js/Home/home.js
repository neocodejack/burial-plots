$(document).ready(function () {
    $("#cotactfoter").hide();
})
var chekemial = function () {
    var email = $("#email").val();
    if (isEmail(email)) {
        alert("Email True");
    }
    else {
        alert("Email not True");
    }
}
var cimtryplot = function () {
    var name = $("#compnayname").val();
    var city = $("#city").val();
    var aone = $("#aone").val();
    var atwo = $("#atwo").val();
    var country = $("#country").val();
    var postcode = $("#postcode").val();
    var telephne = $("#telephne").val();
    var email = $("#email").val();
    var website = $("#website").val();
    var contctName = $("#txtContactName").val();
    if (email != '') {
        if (isEmail(email)) {

        }
        else {

            email = '1';
        }

    }

    if (name == "") {
        $("#compnayname").css("border-color", "red");
        setTimeout(function () {
            $("#compnayname").css("border-color", "");
        }, 3000);
    }
    else {
        $("#compnayname").css("border-color", "Green");
    }
    if (city == "") {
        $("#city").css("border-color", "red");
        setTimeout(function () {
            $("#city").css("border-color", "");
        }, 3000);
    }
    else {
        $("#city").css("border-color", "Green");
    }
    if (aone == "") {
        $("#aone").css("border-color", "red");
        setTimeout(function () {
            $("#aone").css("border-color", "");
        }, 3000);
    }
    else {
        $("#aone").css("border-color", "Green");
    }
    if (atwo == "") {
        $("#atwo").css("border-color", "red");
        setTimeout(function () {
            $("#atwo").css("border-color", "");
        }, 3000);
    }
    else {
        $("#atwo").css("border-color", "Green");
    }
    if (country == "") {
        $("#country").css("border-color", "red");
        setTimeout(function () {
            $("#country").css("border-color", "");
        }, 3000);
    }
    else {
        $("#country").css("border-color", "Green");
    }
    if (postcode == "") {
        $("#postcode").css("border-color", "red");
        setTimeout(function () {
            $("#postcode").css("border-color", "");
        }, 3000);
    }
    else {
        $("#postcode").css("border-color", "Green");
    }
    if (telephne == "") {
        $("#telephne").css("border-color", "red");
        setTimeout(function () {
            $("#telephne").css("border-color", "");
        }, 3000);
    }
    else {
        $("#telephne").css("border-color", "Green");
    }
    if (email == "") {
        $("#email").css("border-color", "red");
        setTimeout(function () {
            $("#email").css("border-color", "");
        }, 3000);
    }
    else {
        $("#email").css("border-color", "Green");
    }
    if (website == "") {
        $("#website").css("border-color", "red");
        setTimeout(function () {
            $("#website").css("border-color", "");
        }, 3000);
    }
    else {
        $("#website").css("border-color", "Green");
    }
    if (contctName == "") {
        $("#txtContactName").css("border-color", "red");
        setTimeout(function () {
            $("#txtContactName").css("border-color", "");
        }, 3000);
    }
    else {
        $("#txtContactName").css("border-color", "Green");
    }
    if (email == '1') {
        $("#email").css("border-color", "B6BCC8");
        $("#email").val('Emial Not Valid');
        email = '';
    }
    if ((name == '' || city == '' || aone == '' || atwo == '' || country == '' || postcode == '' || telephne == '' || email == '' || website == '')) {


    }
    else {
        showLoader("Please Wait", "warning");
        $.ajax({
            url: "/Home/PlotAdd",
            type: "post",
            data: { name: name, city: city, aone: aone, atwo: atwo, country: country, postcode: postcode, telephne: telephne, email: email, website: website },
            success: function (res) {

                if (res == "true") {
                    hideLoader();
                    swal('Thankyou for your submission', "Dear " + name + " Thank you for registeration your interest our representative will contact you within 24 hours", 'success');
                    // AutoLoader("Dear " + name + " Thank You For Register Your Interest Over Sale Team Will Contact you Within 24Hours", "success");
                }
                else {
                    AutoLoader("Plot Not Register", "error");
                }
            }
        });




    }




}

