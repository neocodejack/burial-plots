$(document).ready(function () {
    
})
var login = function () {
    var username = $("#username").val();
    var pass = $("#password").val();
    $("#errAlert").text("Please wait..");
    $("#divAlert").slideUp();
    $.ajax({
        url: "/Admin/Login/Login",
        type:"post",
        data: {username: username, pass: pass},
        success: function (res) {
            if (res == "true") {
                window.location.href = "/Admin/Dashboard/Index";
            }
            else if (res == "partner") {
                window.location.href = "/Admin/Users/Dashboard";
            }
            else if(res == "verify"){
                $("#errAlert").text("Please verify your account");
                $("#divAlert").slideDown();
                setTimeout(function () {
                    $("#divAlert").slideUp();
                }, 3000);
            }
            else {
                $("#errAlert").text("Incorrect Username or Password");
                $("#divAlert").slideDown();
                setTimeout(function () {
                    $("#divAlert").slideUp();
                }, 3000);
            }
        }
    })

}

var loginByEnter = function (e) {
    if (e.which == 13) {
        login();
    }
}