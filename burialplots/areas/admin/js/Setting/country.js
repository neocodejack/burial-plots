$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-country").addClass("start active");
    loadCountries();
});

var loadCountries = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadCountriesUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadCountries").html(res);
            $("#tblLoadCountries").DataTable({
                "iDisplayLength": 100,
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}

var saveCountry = function () {
    var link = $("#hidSaveCountryUrl").val();
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var description = $("#txtDescription").val();
    if (name == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, name: name, description: description },
            success: function (res) {
                if (res == "true") {
                    loadCountries();
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

var editCountry = function (id, name, desc) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtDescription").val(desc);
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
}

var deleteCountry = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteCountryUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadCountries();
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