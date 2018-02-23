$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-postcode").addClass("start active");
    loadPostCodes();
});

var loadPostCodes = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadPostCodesUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadPostCodes").html(res);
            $("#tblLoadPostCodes").DataTable({
                "iDisplayLength": 100,
                "order":[[0,"desc"]]
            });
            hideLoader();
        }
    });
}

var savePostCode = function () {
    var link = $("#hidSavePostCodeUrl").val();
    var id = $("#hidId").val();
    var code = $("#txtCode").val();
    var description = $("#txtDescription").val();
    if (code == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, code: code, description: description },
            success: function (res) {
                if (res == "true") {
                    loadPostCodes();
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

var editPostCode = function (id, code, desc) {
    $("#hidId").val(id);
    $("#txtCode").val(code);
    $("#txtDescription").val(desc);
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtCode").val("");
    $("#txtDescription").val("");
}

var deletePostCode = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeletePostCodeUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadPostCodes();
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