$(function () {
    $("#li-Plan").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
});
var Myplan = function () {
    var pId = $("#hPartnerPlanId").val();
    if ($("#NoPlan").is(":checked")) {
        AutoLoader("Select a Plan.");
        return;
    }
    var plan = "";
    $(".plan").each(function () {
     
        if ($(this).is(":checked")) {
            plan = $(this).val();
        }
    });
    $.ajax({

        url: "/Users/GetPlanById",
        type: "post",
        data: { planId: plan },
        success: function (res) {
            
            myObj = JSON.parse(res);
            AutoLoader("You have choosen the Plan" +' ' + myObj.Title + ' '+ "with Price : " + ' '+ myObj.Price);
            window.location.href = "/admin/Checkouts/Index?PlanId=" + plan;
        }

    });

    //AutoLoader("You have choosen the Plan" );
    //window.location.href = "/admin/Users/PlanPayment?PlanId=" + plan;
   
    //$.ajax({

    //    url: "/Users/SavePlan",
    //    type: "post",
    //    data: { plan: plan, pId: pId },
    //    success: function (res) {
    //        if (res == "true") {
    //            AutoLoader("Your plan is successfully saved.", "success");
    //            window.location.href = "/Admin/Users/PlanPayment";
    //        }
    //    },
    //    error: function () {

    //        AutoLoader("Your plan is not  saved.", "error");
    //    }

    //});
}
