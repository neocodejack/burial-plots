$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-contentManage").addClass("start active open");
    $("#lis-footer").addClass("start active");
    loadFooterSetting();
});

var loadFooterSetting = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadFooterUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            var data = JSON.parse(res);
            $("#txtCopyRight").val(data.CopyRight);
            $("#txtBranding").val(data.Branding);
            hideLoader();
        }
    });
}


var saveFooterSetting = function () {
    var link = $("#hidSaveFooterUrl").val();
    var copyRight = $("#txtCopyRight").val();
    var branding = $("#txtBranding").val();
    if (copyRight == "" || branding == "") {
        showLoader("Please fill the required fields.", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: link,
            type: "post",
            data: { copyRight: copyRight, branding: branding },
            success: function (res) {
                if (res == "true") {
                    resetAllFields();
                    loadFooterSetting();
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

var editFooter = function (id, copyRight, brand) {
    $("#hidId").val(id);
    $("#txtCopyRight").val(copyRight);
    $("#txtBranding").val(brand);
}

var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtCopyRight").val("");
    $("#txtBranding").val("");
}