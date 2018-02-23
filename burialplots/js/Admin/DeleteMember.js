$(document).ready(function () {

})
var Delete = function (id) {
   
    confirm("Are You Sure Want to delete");
    $.ajax({
        url: "/Admin/DeleteMember",
        type: "post",
        data: {id:id},
        success: function (res) {
            if (res == "True") {
                alert("Succesfully deleted record");
                window.location.reload();
            }
        }
    })


}