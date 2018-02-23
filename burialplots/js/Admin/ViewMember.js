$(document).ready(function () {
  
    $.ajax({
        url: "/Admin/LoadMember",
        type: "get",
        success: function (res) {
            $("#Load").html(res);
            $("#tblMember").DataTable();
        }
    })


})