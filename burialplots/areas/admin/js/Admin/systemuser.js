$(document).ready(function () {
    $("#li-user").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#superUsers").addClass("start active");
})


var addnewsystme = function () {

    var user = $("#username").val();
    var pass = $("#pass").val();
   
    var role = $("#rooltype").val();
    $.ajax({
        url: "/Admin/Admin/AddSystemUser",
        type: "post",
        data: { user: user, pass: pass, role: role },
        success: function (res) {

            if (res == "True") {
                AutoLoader("User successfully added","success");
                window.location.href = "/Admin/Admin/ViewSystemUser?type=" + role;
            }

        }
    });


}

