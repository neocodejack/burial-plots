$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active");
    $("#lis-towns").addClass("start active open");
    
    loadTowns();
});

var loadTowns = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadTownsUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadTowns").html(res);
            $("#tblLoadTowns").DataTable({
                "iDisplayLength": 100,
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}

var saveTown = function () {
    var link = $("#hidSaveTownUrl").val();
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var county = $("#drpCountry").val();
    var description = $("#txtDescription").val();
    if (name == "" || county == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, name: name, description: description, county: county },
            success: function (res) {
                if (res == "true") {
                    loadTowns();
                    resetAllFields();
                    showLoader("Saved Successfully", "success");
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

var editTown = function (id, name, desc, country) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtDescription").val(desc);
    $("#drpCountry").val(country);
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
    $("#drpCountry").val("");
}

var deleteTown = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteTownUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadTowns();
                    resetAllFields();
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