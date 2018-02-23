$(document).ready(function () {
    $("#li-user").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#lis-createUser").addClass("start active");


    loadMember();
})


var addnewuser = function () {

    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var email = $("#email").val();
    var pass = $("#pass").val();
    var ID = $("#Memid").val();
    var cell = $("#cell").val();
    var user = $("#usename").val();
    var role = $("#rooltype").val();
    $.ajax({
        url: "/Admin/Admin/Addnew",
        type: "post",
        data: { id: ID, FirstName: fname, LastName: lname, Password: pass, Email: email, cell: cell, user: user,role:role },
        success: function (res) {

            if (res == "True") {
                alert("User sucessfully Register");
                loadMember();
            }

        }
    });


}

