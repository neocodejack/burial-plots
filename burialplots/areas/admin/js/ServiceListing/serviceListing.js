$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-user").addClass("start active");
    $("#li-ServiceListing").addClass("start active open");
    loadServiceListing();
});

var loadServiceListing = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadServiceListingUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadServiceListing").html(res);
            $("#tblMember").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        }
    });
}

var Approved = function (id) {
    showLoader("Please wait..", "info");
    var link = $("#hidApprovedService").val();
    $.ajax({
        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "true") {
                loadServiceListing();
                showLoader("Approved Successfully", "success");
            }
        },
        error: function () {
            showLoader("Error","error");
        }
            });
            hideLoader();
       
}
var suspend = function (id) {
    $.ajax({
        url: "/Admin/ServiceListing/Suspend",
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {

                showLoader("Approved Successfully", "success");
                loadServiceListing();


            }
            else {
                showLoader("Dis-Approved Successfully", "success");
                loadServiceListing();
            }

        }
    })
}
var Delete = function (id) {

    if(confirm("Are you sure you want to delete?")){
    $.ajax({
        url: "/Admin/ServiceListing/DeletePartner",
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {
                showLoader("Deleted Successfully", "success");
                loadServiceListing();
            }
        }
    })


}


}
    


var deleteServiceListing = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidDeleteService").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadServiceListing();
                    showLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            }
        });
    }
}
var TogglepatnerRegister=function(){
    $("#openpatnerrigster").toggle().show();



}
var Addpatner = function () {

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
        url: "/Admin/ServiceListing/patneradd",
        type: "post",
        data: {FirstName: fname, LastName: lname, Password: pass, Email: email,cell:cell },
        success: function (res) {
           
            if (res == "True") {
                AutoLoader("Added Successfully", "success");
            $("#firstname").val("");
            $("#lastname").val("");
            $("#email").val("");
            $("#password").val("");
            $("#phone").val("");
            loadServiceListing();
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





