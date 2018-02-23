$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active");
    $("#lis-listingApproval").addClass("start active open");
});
var SaveServicesApproval = function () {
    var status = "false";
    $(".rdApprove").each(function () {
        if ($(this).is(":checked")) {
            if ($(this).val() == "on") {
                status = "true";
            }
        }
    });
   
    $.ajax({
        url: "/Admin/Settings/ToApproveListServices",
        type: "post",
        data: {Status: status },
        success:function(result){
            if (result) {
                AutoLoader("Sucessfully Applied selected option","Success");
            }
        },
        error: function (error) {
            
            AutoLoader("Error","error");
        }

    });
   
    }