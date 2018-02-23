$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-county").addClass("start active");
    loadCounties();
});

var loadCounties = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadCountiesUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadCounties").html(res);
            $("#tblLoadCounties").DataTable({
                "iDisplayLength": 100,
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}

var saveCounty = function () {
    var link = $("#hidSaveCountyUrl").val();
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var description = $("#txtDescription").val();
    var CountryId = $("#drpCountries").val();
    if (name == "" || description == "" || CountryId=="") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, name: name, description: description, CountryId: CountryId },
            success: function (res) {
                if (res == "true") {
                    loadCounties();
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

var editCounty = function (id, name, desc,countryName) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtDescription").val(desc);
    $("#drpCountries").val(countryName);
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
    $("#drpCountries").val("");
}

var deleteCounty = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteCountyUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadCounties();
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