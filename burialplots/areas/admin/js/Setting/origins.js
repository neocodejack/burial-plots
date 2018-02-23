$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-origin").addClass("start active");
    loadOrigins();
});

var loadOrigins = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadOriginsUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadOrigins").html(res);
            $("#tblLoadOrigins").DataTable({
                "iDisplayLength": 100,
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}

var saveOrigin = function () {
    var link = $("#hidSaveOriginUrl").val();
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
                    loadOrigins();
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

var editOrigin = function (id, name, desc) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtDescription").val(desc);
    $('html, body').animate({
        scrollTop: $("#divScroll").offset().top
    }, 2000);
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
}

var deleteOrigin = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteOriginUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadOrigins();
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