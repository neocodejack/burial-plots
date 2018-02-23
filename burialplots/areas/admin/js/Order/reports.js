$(document).ready(function () {
    $("#li-sale").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-reports").addClass("start active");
    datePicker();
    loadReports();
});
var datePicker = function () {
    $(".datepicker").datepicker();
}
var loadReports = function () {
    var report = $("#drpReportTitle").val();
    var fromDate = $("#dateFrom").val();
    var toDate = $("#dateTo").val();
    var status = $("#drpStatus").val();
    var link = $("#hIdLaodReportsLnk").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: link,
        type: "post",
        data: { dtFrom: fromDate, dtTo: toDate, status: status, reportTitle: report },
        success: function (res) {
            $("#divLoadReports").html(res);
            $("#tblLoadOrdersReport").DataTable({
                "iDisplayLength": 100,
                "order": [[4, "desc"]]
            });
            hideLoader();
        }
    });
}
var SearchReports = function () {

    var dtFrom = $("#dateFrom").val();
    var dtTo = $("#dateTo").val();
    var status = $("#drpStatus").val();
    var reportTitle = $("#drpReportTitle").val();
   
    
    if (reportTitle == "" || null) {
        AutoLoader("Please select the report title.", "warning");
        return;
    }

    if (dtFrom == "" || null) {
        if (dtTo == "" || null) {
            if (status == "" || null) {
                AutoLoader("Please select the filters.", "warning");
                return;
            }
        }
    }

    if (dtFrom == "") {
        dtFrom = null;
    }
    if (dtTo == "") {
        dtTo = null;
    }
    if (status == "") {
        status = null;
    }
    
    loadReports(dtFrom, dtTo, status, reportTitle);
}



var deleteOrder = function (id) {
    var ss = confirm("Are you sure you want to delete this order?");
    if (ss) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeleteOrderUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadOrders();
                    showLoader("Deleted successfully", "success");
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

var editOrder = function (id) {
    var link = $("#hidEditOrderUrl").val();
    window.location.href = link + "?id=" + id;
}

var deletePlanOrder = function (id) {
    var ss = confirm("Are you sure you want to delete this order?");
    if (ss) {
        showLoader("Please wait..", "info");
        var link = $("#hidDeletePlanOrderUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadPlanOrders();
                    showLoader("Deleted successfully", "success");
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

var editPlanOrder = function (id) {
    var link = $("#hidEditPlanOrderUrl").val();
    window.location.href = link + "?id=" + id;
}