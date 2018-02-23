$(document).ready(function () {
    $("#li-profile").addClass("start active");
    $("#li-user").removeClass("start active");
});
$(function () {
 
    $('form').submit(function () {
        var email = $('#email').val();
        var paswword = $('#password').val();
        var link=$('#hProfileId').val();
        if (email == "" && paswword == "") {

            $('#email').css("border", "2px solid red");
            $('#password').css("border", "2px solid red");
            return;
        }
        

        $.ajax({
            
            type: "post",
            url:link,
            data:$(this).serialize(),
            success: function (result) {
                if (result) {

                    AutoLoader("Saved Successfully", "success");
                  
                }
                else
                {
                    AutoLoader("Error","error");
                }
            },
            error: function () {

                AutoLoader("Error", "error");
            }
        })

    });



});
var update=function()
{
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var email = $("#email").val();
    var password = $("#password").val();
    var cellno = $("#cellno").val();
    var email = $('#email').val();
    var paswword = $('#password').val();
    if (email == "" && paswword == "") {

        $('#email').css("border", "2px solid red");
        $('#password').css("border", "2px solid red");
    }
    else if (paswword.length < 4) {
        AutoLoader("Password length must be minimum 4", "info");
        $('#password').css("border", "2px solid red");
        return;
    }
    else {
        var myurl = $("#hProfileId").val();
        $.ajax({
            url: myurl,
            type: "post",
            data: { fname: fname, lname: lname, email: email, password: password, cellno: cellno },
            success: function (res) {


                if (res == "true") {
                    AutoLoader("Your profile is updated succefully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }

            }
        })
    }
   
}

