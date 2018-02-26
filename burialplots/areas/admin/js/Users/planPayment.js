$(function () {
    $("#divThank").hide();


})
var Submit = function (PlanId) {
   
    $.ajax({
        url: "/Users/SavePlan",
        type: "post",
        data: { PlanId: PlanId },
        success: function (res) {
            if (res == "true") {

                $("#divPayment").hide();
                $("#divThank").show();
            }
        },
        error: function () {
            AutoLoader("Error","error");
        }


    });
   
    

}