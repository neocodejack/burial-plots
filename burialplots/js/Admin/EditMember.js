$(document).ready(function () {
    $("#li-user").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#lis-viewUser").addClass("start active");
})
var EditMember = function (id, fname, lname, email, pass) {
    ID = id;
    $("#fname").val(fname);
    $("#lname").val(lname);
    $("#email").val(email);
    $("#pass").val(pass);
    $("#pass1").val(pass);
    $("#Memid").val(id);
    $("#modaldata").css('display', 'block');

   
    

}
var suspend = function (id) {
    $.ajax({
        url: "/Admin/Suspend",
        type: "post",
        data: {id:id},
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
  
    var fname = $("#fname").val();
    var lname = $("#lname").val();
    var email = $("#email").val();
    var pass = $("#pass").val();
    var ID = $("#Memid").val();
   
    $.ajax({
        url: "/Admin/Edit",
        type: "post",
        data: { id: ID, FirstName: fname, LastName: lname, Password: pass, Email: email },
        success: function (res) {
           
            if (res == "True") {
                alert("data sucessfully updated");
            }

        }
    });


}

$("#hide").click(function () {
    $("#modaldata").hide();
});
var loadMember = function () {
    $.ajax({
        url: "/Admin/LoadMember",
        type: "get",
        success: function (res) {
            $("#Load").html(res);
            $("#tblMember").DataTable();
        }
    });
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