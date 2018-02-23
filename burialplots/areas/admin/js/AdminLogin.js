$(document).ready(function () {

    
})
var login = function () {
    var username = $("#username").val();
    var pass = $("#password").val();
    $.ajax({
        url: "/Admin/AdminLogin",
        type:"post",
        data: {username:username,pass:pass},
        success: function (res) {
            
           
            if (res == "True") {
                //$("#username").val("");
                //$("#password").val("");
                window.location.href = "AfterLogin";
            }

        }
    })

}