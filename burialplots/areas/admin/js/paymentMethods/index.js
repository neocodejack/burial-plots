$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-setting").addClass("active start open");
    $("#lis-paymentMethods").addClass("active start");
    loadPaymentMethods();
});

var savePaymentMethod = function () {
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var instId = $("#txtInstId").val();
    var active = "false";
    if ($("#chkActive").is(":checked")) {
        active = "true";
    }
    if (name == "" || instId == "") {
        AutoLoader("Please enter name and installation ID first", "info");
        return;
    }
    $.ajax({
        url : "/Admin/PaymentMethods/SavePaymentMethod",
        type: "post",
        data: { id: id, name: name, instId: instId, active: active },
        success: function (res) {
            if (res == "true") {
                AutoLoader("Saved Successfully", "success");
                loadPaymentMethods();
                clearAllFields();
            }
            else {
                AutoLoader("Something went wrong", "error");
            }
        }
    });
}

var loadPaymentMethods = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/PaymentMethods/LoadPaymentMethods",
        type: "post",
        success: function (res) {
            $("#divLoadPaymentMethods").html(res);
            $("#tblLoadPaymentMethods").DataTable();
            hideLoader();
        }
    });
}

var clearAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtInstId").val("");
    $("#chkActive").prop("checked", false);
}

var editPaymentMethods = function (id, name, inst, active) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtInstId").val(inst);
    if (active == "true") {
        $("#chkActive").prop("checked", true);
    }
    else {
        $("#chkActive").prop("checked", false);
    }
}

var deletePaymentMethod = function(id)
{
    if (confirm("Are you sure you want to delete this Method?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/PaymentMethods/DeletePaymentMethod",
            type: "post",
            data: {id: id},
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Deleted Successfully", "success");
                    loadPaymentMethods();
                }
                else {
                    AutoLoader("Something went wrong", "error");
                }
            }
        });
    }
}