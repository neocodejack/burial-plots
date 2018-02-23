$(document).ready(function () {
    //alert("ehlo");
   
    $("#none").css('display', 'none')
});
var login = function () {
   
    var username = $("#email").val();
    var pass = $("#password").val();
    $.ajax({
        url: "/Plots/Login",
        type: "post",
        data: { email: username, pass: pass },
        success: function (res) {
         

            if (res == "True") {
                //$("#username").val("");
                //$("#password").val("");
                window.location.href = "/Dashboard/Index";
            }
            else {
                alert("Enter correct Email and Password");
            }

        }
    })

}

var Save = function () {

    var firstname = $("#fname").val();
    var lastname = $("#lname").val();
    var email = $("#email").val();
    var pass = $("#pass").val();
    var passcnfirm = $("pass1").val();
    //var pass1 = $("#pass1").val();
    //var dob = $("#dob").val();
    $.ajax({
        url: "/Plots/AddMember",
        type: "post",
        data: { FirstName: firstname, LastName: lastname, Email: email, Password:pass },
        success: function (res) {
            alert("successfully added data");

            if (res == "True") {
                window.location.reload();

                //$("#fname").val("");
                //$("#lname").val("");
                //$("#email").val("");
                //$("#pass").val("");
                //$("pass1").val("");

            }
        }

    })
}