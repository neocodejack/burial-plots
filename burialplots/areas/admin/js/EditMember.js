$(document).ready(function () {
    $("#li-user").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#lis-viewUser").addClass("start active");
   
    loadMember();
})
var EditMember = function (id, fname, lname, email, pass,cell,username,role) {
    ID = id;
    $("#fname").val(fname);
    $("#lname").val(lname);
    $("#email").val(email);
    $("#pass").val(pass);
    $("#pass1").val(pass);
    $("#Memid").val(id);
    $("#cell").val(cell);
    $("#usename").val(username);
    $("#role").val(role);
    $("#modaldata").css('display', 'block');

   
    

}
var suspend = function (id) {
    $.ajax({
        url: "/Admin/Admin/Suspend",
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
   var cell= $("#cell").val();
   var user = $("#usename").val();
  var role= $("#rooltype").val();
  showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Admin/Edit",
        type: "post",
        data: { id: ID, FirstName: fname, LastName: lname, Password: pass, Email: email,cell:cell,user:user,role:role },
        success: function (res) {
           
            if (res == "True") {
                AutoLoader("Updated Successfully", "success");
                loadMember();
            }

        }
    });


}

$("#hide").click(function () {
    $("#modaldata").hide();
});
var loadMember = function () {
    var ur = $("#laodmember").val();
    $.ajax({
        url: ur,
        type: "POST",
        success: function (res) {
            $("#Load").html(res);
            $("#tblMember").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]

            });
        }
    })

}
var Delete = function (id) {

    var input = confirm("Are you sure  to delete the record?");
    if (input) {

        $.ajax({
            url: "/Admin/Admin/DeleteMember",
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "True") {
                    alert("Succesfully deleted record");
                    loadMember();
                }
            }
        })
    }



}
  var ToggleMemberRegister=function()
  {
      if ($("#openrigster").is(":hidden")) {
          $("#openrigster").toggle().show();
          $("#btnTogle").text("Hide");
      }
      else {
          $("#openrigster").toggle().hide();
          $("#btnTogle").text("Add Customer");
      }
  }
  var AddCoustmers = function ()
  {
      var fname = $("#firstname").val();
      var lname = $("#lastname").val();
      var email = $("#email").val();
      var pass = $("#password").val();
      var cell = $("#phone").val();
      if (fname == "" || lname == "" || email == "" || pass == "" || cell == "")
      {
           AutoLoader("Please fill the required fields", "info");
      
          return ;
           }
      $.ajax({
          url: "/Admin/Admin/coustmeradd",
          type: "post",
          data: {FirstName: fname, LastName: lname, Password: pass, Email: email,cell:cell },
          success: function (res) {
           
              if (res == "True") {
                  $("#firstname").val("");
                  $("#lastname").val("");
                  $("#email").val("");
                  $("#password").val("");
                  $("#phone").val("");
                  AutoLoader("Added Successfully", "success");
                  loadMember();
              }
              else if (res == "exist") {
                  AutoLoader("Email address already exists", "error");
              }
              else {
                    AutoLoader("Error", "error");
              }
          }
      });


  }
