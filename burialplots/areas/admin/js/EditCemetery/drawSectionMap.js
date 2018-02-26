$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-section").addClass("active start");
    localStorage.clear();
    $("#txtIconUrl").val($("#hidRequestUrl").val()+"Images/Pins/pin.png");
    setTimeout(function () {
        $("#wcp-editor-button-new").click();
        $("#wcp-editor-input-create-new").val("unknown");
        $("#wcp-editor-button-create-new-instance").click();
    }, 1000);
    loadSect();
    setTimeout(function () {
        $("#wcp-editor-button-new").click();
        $("#wcp-editor-input-create-new").val("unknown");
        $("#wcp-editor-button-create-new-instance").click();
        loadSectionDetails();
    }, 1000);
    //setMapping();
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
var activeElement = function () {
    var spot = $("#hidSpotId").val();
    $(".imp-editor-shape").removeClass("selected");
    //$("[data-id='" + spot + "']").addClass("selected");
    $("[data-wcp-editor-toolbar-button-name='zoom-in']").click();
    $("#wcp-editor-list-item-" + spot).click();
    $("#wcp-editor-list-item-" + spot).click();
}

var loadSectionDetails = function () {
    var getUrl = $("#hidLoadSectionDetailsUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        data: { id: $("#hidId").val() },
        type: "post",
        success: function (res) {
            var data = JSON.parse(res);
            var code = data.Code.replace(/\\/g, '').slice(1, -1);
            //var obj = JSON.parse(code);
            $('[data-wcp-editor-extra-main-button-name="import"]').click();
            $("#wcp-editor-textarea-import").val(code);
            $('#wcp-editor-confirm-import').click();
            setMapping();
            setTimeout(function () {
                activeElement();
            }, 3000);
            hideLoader();
        }
    });
}

var EditSection = function () {
    $('[data-wcp-editor-extra-main-button-name="export"]').click();
    var code = $("#wcp-editor-textarea-export").val();
    $("#wcp-editor-modal").css("display", "none");
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var religionId = $("#drpReligion").val();
    var sectId = $("#drpSect").val();
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
            id: id, name: name, code: JSON.stringify(code),
            religionId: religionId, sectId: sectId
        },
        success: function (res) {
            if (res == "true") {
                window.location.href = $("#hidReturnUrl").val();
            }
            else {
                AutoLoader("Error", "error");
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
            $("#drpSect").val($("#hidSectId").val());
            hideLoader();
        }
    });
}