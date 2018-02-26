$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-import").addClass("active start");
   // loadUnMappedGraves();
});
var changeCemetery = function () {
    var id = $("#drpCemetery").val();
    var getUrl = $("#hidLoadSectionUrl").val();
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            data: { id: id },
            success: function (res) {
                $("#drpSection").html(res);
                hideLoader();
            }
        });
}

var uploadFile = function () {
    showLoader("Please wait...", "info");
    var message = "";
    var getUrl = $("#hidUploadImageUrl").val();
    var file = $("#file").val();
    if (file !== "") {
        var ex = getExt(file);
        if (ex === "csv") {
            var fileUpload = $("#file").get(0);
            var files = fileUpload.files;
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            data.append("sectionId", $("#drpSection").val());
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    hideLoader();
                    var data = xhr.responseText;
                    var res = JSON.parse(data);
                    if (res.msg == "true") {
                        hideLoader();
                        setTimeout(function(){
                            AutoLoader(res.count + " Plots Imported Successfully", "success");
                            setTimeout(function () {
                                window.location.href = "/Admin/Plots/ViewPlots";
                            }, 1000);
                        }, 600);
                    }
                    else {
                        AutoLoader("Error", "error");
                    }
                }
            };
            xhr.open("POST", getUrl);
            xhr.send(data);

        } else {
            message = "Please select image or document file...";
            AutoLoader(message, "error");
        }
    }
}
function getExt(filename) {
    var ext = filename.split('.').pop();
    if (ext === filename) return "";
    return ext.toLowerCase();
}

var loadUnMappedGraves = function () {
    var sectionId = $("#drpSection").val();
    var getUrl = $("#hidLoadUnMappedGravesUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url : getUrl,
        type: "post",
        data: {sectionId: sectionId},
        success: function (res) {
            $("#divLoadPlots").html(res);
            $("#tblLoadMappingGraves").DataTable();
            hideLoader();
        }
    });
}