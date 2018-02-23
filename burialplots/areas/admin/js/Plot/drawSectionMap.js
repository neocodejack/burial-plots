$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-section").addClass("active start");
    localStorage.clear();
    $("#txtIconUrl").val($("#hidRequestUrl").val() + "Images/Pins/pin.png");
    setTimeout(function () {
        $("#wcp-editor-button-new").click();
        $("#wcp-editor-input-create-new").val("unknown");
        $("#wcp-editor-button-create-new-instance").click();
        setMapping();
    }, 1000);
    getCemeteryCode();
});
var setMapping = function () {
    // $(window).bind("load", function () {
    showLoader("Please wait..", "info");
    setTimeout(function () {
        //$(".wcp-editor-extra-main-button").hide();
        $("#wcp-editor-left").hide();
        var newBtn = '<div id="divMenuBtn" class="wcp-editor-extra-main-button"><div class="wcp-editor-extra-main-button-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><div class="wcp-editor-extra-main-button-title">Menu</div></div>';
        $("#wcp-editor-extra-main-buttons").append(newBtn);
        $("#divMenuBtn").on("click", function () {
            if ($("#wcp-editor-left").is(':visible')) {
                $("#wcp-editor-left").hide();
            }
            else {
                $("#wcp-editor-left").show();
            }
        });
        hideLoader();
    }, 1000);
    // });
}
var uploadCemteryImage = function () {
    var message = "";
    var getUrl = $("#hidUploadCemeteryImageUrl").val();
    var file = $("#imageFile").val();
    if (file !== "") {
        var ex = getExt(file);
        if (ex === "png") {
        var fileUpload = $("#imageFile").get(0);
            var files = fileUpload.files;
            var size = files[0].size;
            if (size > 1000000) {
                AutoLoader("Please select file of size less than 1MB", "info");
                return;
            }
            showLoader("Please wait..", "info");
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var msg = xhr.responseText;
                    $("#hidImage").val(msg);
                    hideLoader();
                    $("#txtImg").val($("#hidRequestUrl").val() + "Images/CemeteryPlots/" + msg);
                    $('[data-wcp-main-tab-button-name="Image Map"]').click();
                    $('[data-wcp-form-tab-button-name="image"]').click();
                    //$("#txtImagePath").val("http://localhost:37175/Images/CemteryImages/" + msg);
                    //$("#btn-img-choose").click();
                }
            };
            xhr.open("POST", getUrl);
            xhr.send(data);

        } else {
            message = "Please select PNG file...";
            AutoLoader(message, "info");
        }
    }
};

function getExt(filename) {
    var ext = filename.split('.').pop();
    if (ext === filename) return "";
    return ext.toLowerCase();
}

var saveCemetery = function () {
    $('[data-wcp-editor-extra-main-button-name="export"]').click();
    var code = $("#wcp-editor-textarea-export").val();
    $("#wcp-editor-modal").css("display", "none");
    var name = $("#txtName").val();
    var cemeteryId = $("#hidCemeteryId").val();
    var spotId = $("#hidSpotId").val();
    var image = $("#hidImage").val();
    var cemeteryObj = JSON.parse(cemeteryCode);
    for (var i = 0; i < cemeteryObj.spots.length; i++) {
        if(cemeteryObj.spots[i].id == spotId)
        {
            cemeteryObj.spots[i].tooltip_content["plain_text"] = name;
            break;
        }
    }
    var getUrl = $("#hidSaveSectionUrl").val();
    if (name == "") {
        $("#txtName").css("border", "1px solid red");
        setTimeout(function () {
           $("#txtName").css("border", "");
        }, 3000);
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: {
            name: name, code: JSON.stringify(code), cemeteryId: cemeteryId, spotId: spotId,
            image: image, cemeteryCode: JSON.stringify(JSON.stringify(cemeteryObj))
        },
        success: function (res) {
            if (res == "true") {
                window.location.href = "/Admin/Cemeteries/ViewSection"
            }
        }
    });
}

var loadSect = function () {
    showLoader("Please wait..", "info");
    var getUrl = $("#hidLoadSectUrl").val();
    var religionId = $("#drpReligion").val();
    $.ajax({
        url: getUrl,
        type: "post",
        data: { religionId: religionId },
        success: function (res) {
            $("#drpSect").html(res);
            hideLoader();
        }
    });
}

var copyImageUrl = function () {
    if ($("#txtImg").val() != "") {
        var copyTextarea = document.querySelector('#txtImg');
        copyTextarea.select();
        var successful = document.execCommand('copy');
        if (successful) {
            AutoLoader("Url copied successfully", "info");
        }
        else {
            AutoLoader("Not copied", "error");
        }
    }
}


var getIDD = function () {
    var a = $(".imp-editor-shape.imp-editor-spot.selected").attr("data-id");
    $('[data-wcp-editor-extra-main-button-name="export"]').click();
    var code = $("#wcp-editor-textarea-export").val();
    $("#wcp-editor-modal").css("display", "none");
    var codearr = JSON.parse(code);
    for (var i = 0; i < codearr.spots.length; i++) {
        if (codearr.spots[i].id == a) {
            codearr.spots[i].default_style = { "icon_type": "custom", "icon_url": "http://localhost:6465/images/pins/pin.png" };
        }
    }
    $('[data-wcp-editor-extra-main-button-name="import"]').click();
    $("#wcp-editor-textarea-import").val(JSON.stringify(codearr));
    $('#wcp-editor-confirm-import').click();
    setMapping();
}
var cemeteryCode = "";
var getCemeteryCode = function () {
    $.ajax({
        url: "/Admin/Cemeteries/GetCemeteryCode",
        type: "post",
        data: { id: $("#hidCemeteryId").val() },
        success: function (res) {
            var code = res.replace(/\\/g, '').slice(1, -1);
            cemeteryCode = code;
        }
    });
}