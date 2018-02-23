$(document).ready(function () {

});

function showLoader(message, type) {


    if (type === "info") {
        $("#static-loader").addClass("info_");
    }
    else if (type === "warning") {
        $("#static-loader").addClass("warning_");
    }
    else if (type === "success") {
        $("#static-loader").addClass("success_");
    }
    else if (type === "error") {
        $("#static-loader").addClass("error_");
    }
    else {

        $("#static-loader").addClass("info_");
    }

    $("#static-loader").html(message);
    $("#static-loader").slideDown();

}
function hideLoader() {
    $("#static-loader").slideUp(function () {
        $("#static-loader").html('');
        $("#static-loader").removeClass("warning_");
        $("#static-loader").removeClass("success_");
        $("#static-loader").removeClass("error_");
        $("#static-loader").removeClass("info_");
    });
}
function AutoLoader(message, type) {
    showLoader(message, type);
    setTimeout(function () {
        hideLoader();
    }, "5000");
}
function isEmail(email) {
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return regex.test(email);
}
var ContactUs = function () {
    var name = $("#txtname").val();
    var email = $("#txtemail").val();
    var phone = $("#txtphone").val();
    var mess = $("#txtmessage").val();
    var myurl = $("#hidLoadContactus").val();
  
    if (name == "" || email == "" || phone == "" || mess == "" || myurl == "") {

        $("#txtname").css("border", "2px solid red");
        $("#txtemail").css("border", "2px solid red");
        $("#txtphone").css("border", "2px solid red");
        $("#txtmessage").css("border", "2px solid red");
        $("#txtname").css("border", "2px solid red");
        $("#hidLoadContactus").css("border", "2px solid red");
        setTimeout(function () {
            $("#txtname").css("border", "");
            $("#txtemail").css("border", "");
            $("#txtphone").css("border", "");
            $("#txtmessage").css("border", "");
            $("#txtname").css("border", "");
            $("#hidLoadContactus").css("border", "");
        }, "3000");
        return;
    }
    else {
        $("#txtname").css("border", "");
        $("#txtemail").css("border", "");
        $("#txtphone").css("border", "");
        $("#txtmessage").css("border", "");
        $("#txtname").css("border", "");
        $("#hidLoadContactus").css("border", "");
    }
    var res = isEmail(email);
    if (res != true) {
        AutoLoader("Your email is invalid.", "warning");
        return;
    }
    showLoader("Please wait, while your message is being sent...", "info");
    $.ajax({
        url: myurl,
        type: "Post",
        data: { name: name, email: email, phone: phone, mess: mess },
        success: function (res) {


            if (res == "true") {

                Restcont();
                AutoLoader("Success! Your message has been sent.", "success");
            }
            else {

                AutoLoader("Server is not responding.", "error");
            }

        }
    })
}
var Restcont = function () {
    $("#txtname").val("");
    $("#txtemail").val("");
    $("#txtphone").val("");
    $("#txtmessage").val("");
}