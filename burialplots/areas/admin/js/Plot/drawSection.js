$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-section").addClass("active start");
    //loadCemetery();
    loadSections();
});

var loadCemetery = function () {
    //var id = $("#hidId").val();
    var id = $("#drpCemetery").val();
    if (id == "") {
        AutoLoader("Please select cemetery first", "info");
        return;
    }
    var getUrl = $("#hidLoadCemeteryUrl").val();
    var returnLink = $("#hidReturnLink").val();
    $.ajax({
        url: getUrl,
        data: { id: id },
        type: "post",
        async: false,
        success: function (res) {
            var data = JSON.parse(res);
            var code = data.Code.replace(/\\/g, '').slice(1, -1);
            var obj = JSON.parse(code);
            $('#image-map-pro-container').imageMapPro(obj);
            $("#divCemeteryMap").fadeIn(2000);
            setTimeout(function () {
                $.each(obj.spots, function (index, val) {
                    var idd = val.id;
                    $("#" + idd).on("click", function () {
                        showLoader("Please wait", "info");
                        var getcheckUrl = $("#hidCheckSectionMappingUrl").val();
                        $.ajax({
                            url: getcheckUrl,
                            type: "post",
                            data: {
                                cemeteryId: id, spotId: idd
                            },
                            success: function (res) {
                                if (res == "exists") {
                                    AutoLoader("Already Mapped this section", "info");
                                }
                                else {
                                    window.location.href = returnLink + "?cemeteryId=" + id + "&spotId=" + idd;
                                }
                            }
                        });
                    });

                });
            }, 2000);
        }
    });
}

var hideCemeteryMap = function () {
    $("#divCemeteryMap").fadeOut(1000);
}

var loadSections = function () {
    showLoader("Please wait", "info");
    var cemeteryId = $("#drpCemetery").val();
    var getUrl = $("#hidLoadSectionsUrl").val();
    $.ajax({
        url: getUrl,
        type: "post",
        data: { cemeteryId: cemeteryId },
        success: function (res) {
            $("#divLoadSectionsPartial").html(res);
            $("#tblLoadSections").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var deleteSection = function (id) {
    var getUrl = $("#hidDeleteSectionsUrl").val();
    if (confirm("Are you sure you want to delete this section?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            data: { id: id },
            success: function (res) {
                loadSections();
                hideLoader();
            }
        });
    }
}