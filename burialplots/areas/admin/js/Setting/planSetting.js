$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-plan").addClass("start active");
    LoadPlanList();
    
});

var LoadPlanList = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadPlanLnk").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadPlanList").html(res);
            $("#tblPlanList").DataTable({
                "order":[[0, "asc"]]
            });
            hideLoader();
        }
    });
}
var SavePlan = function () {

    var link = $("#hidSavePlanLnk").val();
    var id = $("#hidId").val();
    var Title = $("#txtTitle").val();
    var Price = $("#txtPrice").val();
    var Description = $("#Description").val();
    var position = $("#txtPosition").val();
    var planPeriod = $("#drpPlanPeriod").val();
    var freePeriod = $("#drpFreePeriod").val();
    if (Title == "" || Price == "" || Description == "") {
        $("#txtTitle").css("border", "2px solid red");
        $("#txtPrice").css("border", "2px solid red");
        $("#Description").css("border", "2px solid red");
        $("#txtPosition").css("border", "2px solid red");
        return;
    }
    $.ajax({
        url: link,
        type: "post",
        data: { id: id, Title: Title, Price: Price, Description: Description, position: position, planPeriod: planPeriod, freePeriod: freePeriod },
        success: function (res) {
            if (res == "true") {
                resetAllFields();
                LoadPlanList();
                AutoLoader("Plan is successfully saved", "success");
            }
            else if(res == "exists") {
                AutoLoader("This position is already exist on another plan", "error");
            }
            else {
                AutoLoader("Error", "error");
            }
        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });

}

var editPlan = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/EditPlan",
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            $("#hidId").val(data.Id);
            $("#txtPrice").val(data.Price);
            $("#txtTitle").val(data.Title);
            $("#Description").val(data.Description);
            $("#txtPosition").val(data.Position);
            $("#drpPlanPeriod").val(data.PlanPeriod);
            $("#drpFreePeriod").val(data.FreePeriod);
            hideLoader();
        }
    });
}
var deletePlan = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidDeletePlanUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    LoadPlanList();
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
var resetAllFields = function () {
    $("#txtTitle").val("");
    $("#txtPrice").val("");
    $("#hidId").val("");
    $("#Description").val("");
    $("#txtPosition").val("");
    $("#drpPlanPeriod").val("0");
    $("#drpFreePeriod").val("0");
}