$(document).ready(function () {

})
var Save = function () {

    var firstname = $("#fname").val();
    var lastname = $("#lname").val();
    var email = $("#email").val();
    var dob = $("#dob").val();
    $.ajax({
        url: "/Admin/AddMember",
        type: "post",
        data: {FirstName:firstname,LastName:lastname,Email:email,DOB:dob},
        success: function (res) {
            alert("successfully added data");

            if (res == "True") {



            }
        }

    })
}