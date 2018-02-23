$(document).ready(function () {
    $("#li-user").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    if ($("#hidType").val() == "cemetery") {
        $("#li-cemterymanager").addClass("start active");
    }
    else {
        $("#li-superUsers").addClass("start active");
    }
    loadMember();
})
//var EditMember = function (id,user,pass,role) {
    
//    $("#usename").val(user);
//    $("#pass").val(pass);
//    $("#rooltype").val(role);
    
//    $("#Memid").val(id);
   
//    $("#modaldata").css('display', 'block');



//}
var UpdateSystemUser = function () {

    var user = $("#username").val();
    var pass = $("#password").val();
    var role = $("#roleType").val();

    var id = $("#hIdSytemUser").val();

    $.ajax({
        url: "/Admin/Admin/Updatesuer",
        type: "post",
        data: { id: id, user: user, pass: pass, role: role },
        success: function (res) {

            if (res == "True") {
                AutoLoader("User sucessfully updated", "success");
                window.location.href = "/Admin/Admin/ViewSystemUser?type=" + role;
            }

        },
        error: function (error) {
            AutoLoader("Error", "error");
        }

    });


}

var suspend = function (id) {
    $.ajax({
        url: "/Admin/Admin/Suspend",
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {

                loadMember();

            }
            else {
                loadMember();
            }

        }
    })
}

var update = function () {

   var user= $("#usename").val();
  var pass=  $("#pass").val();
   var role= $("#rooltype").val();

   var id= $("#Memid").val();

    $.ajax({
        url: "/Admin/Admin/Updatesuer",
        type: "post",
        data: { id: id, user:user,pass:pass,role:role},
        success: function (res) {

            if (res == "True") {
                alert("User sucessfully updated");
                loadMember();
            }

        }
    });


}

$("#hide").click(function () {
    $("#modaldata").hide();
});
var loadMember = function () {
    var type = $("#hidType").val();
    var ur = $("#laoduser").val();
    $.ajax({
        url: ur,
        type: "POST",
        data: {type: type},
        success: function (res) {
            $("#Loaduser").html(res);
            $("#tbluser").DataTable({
                 "iDisplayLength": 100,
                "order": [[0, "desc"]]


            });
        }
    })

}
var Delete = function (id) {

    confirm("Are You Sure Want to delete");
    $.ajax({
        url: "/Admin/Admin/DeletesystemUser",
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {
                AutoLoader("Succesfully deleted record","success");
                loadMember();
            }
        }
    })


}


//var save = function () {
//    var url = $("#Editcontrol").val
//    alert("save");
//    $.ajax({
//        url: "/Admin/Edit",
//        type: "post",
//        success: function () {

//        }
//    });
//}