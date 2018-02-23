$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-setting").addClass("active start open");
    $("#lis-Religions").addClass("active start");
    loadReligions();
    loadDrpReligion();
    loadSect();
});

var loadReligions = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/LoadReligions",
        type: "post",
        success: function (res) {
            $("#divLoadReligions").html(res);
            $("#tblLoadReligions").DataTable({
                "iDisplayLength": 100,
            });
            hideLoader();
        }
    });
}

var loadDrpReligion = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/LoadDrpReligions",
        type: "post",
        success: function (res) {
            $("#drpReligions").html(res);
            hideLoader();
        }
    });
}

var saveReligions = function () {
    var id = $("#hidReligionId").val();
    var name = $("#txtReligionName").val();
    if (name == "") {
        $("#txtReligionName").css("border", "1px solid red");
        setTimeout(function () {
            $("#txtReligionName").css("border", "");
        }, 3000);
    }
    else {
        var formData = new FormData();
        var totalFiles = document.getElementById("ImgUpload").files.length;
        for (var i = 0; i < totalFiles; i++) {
            var file = document.getElementById("ImgUpload").files[i];
            formData.append("ImgUpload", file);
        }
        if (totalFiles > 0) {
            showLoader("Please wait..", "info");
            $.ajax({
                url: "/Admin/Settings/UploadReligionImage",
                type: "POST",
                async: false,
                dataType: 'json',
                contentType: false,
                processData: false,
                data: formData,
                success: function (res) {
                    showLoader("Please wait..", "info");
                    $.ajax({
                        url: "/Admin/Settings/SaveReligion",
                        type: "post",
                        data: { id: id, name: name, image: res },
                        success: function (res) {
                            if (res == "true") {
                                $("#hidReligionId").val("");
                                $("#txtReligionName").val("");
                                $("#ImgUpload").val("");
                                $("#thumbnil").attr("src", "");
                                showLoader("Saved Successfully", "success");
                                setTimeout(function () {
                                    hideLoader();
                                    loadReligions();
                                    loadDrpReligion();
                                }, 3000);
                            }
                        }
                    });
                }
            });
        }
        else {
            showLoader("Please wait..", "info");
            $.ajax({
                url: "/Admin/Settings/SaveReligion",
                type: "post",
                data: { id: id, name: name, image: "" },
                success: function (res) {
                    if (res == "true") {
                        $("#hidReligionId").val("");
                        $("#txtReligionName").val("");
                        showLoader("Saved Successfully", "success");
                        setTimeout(function () {
                            hideLoader();
                            loadReligions();
                            loadDrpReligion();
                        }, 3000);
                    }
                }
            });
        }
    }
}

var saveSect = function () {
    var id = $("#hidSectId").val();
    var religion = $("#drpReligions").val();
    var name = $("#txtSectName").val();
    if (name == "") {
        $("#txtSectName").css("border", "1px solid red");
        setTimeout(function () {
            $("#txtSectName").css("border", "");
        }, 3000);
        return;
    }
    if (religion == "") {
        $("#drpReligions").css("border", "1px solid red");
        setTimeout(function () {
            $("#drpReligions").css("border", "");
        }, 3000);
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/SaveSect",
        type: "post",
        data: { id: id, name: name, religion: religion },
        success: function (res) {
            if (res == "true") {
                $("#hidSectId").val("");
                $("#drpReligions").val("");
                $("#txtSectName").val("");
                showLoader("Saved Successfully", "success");
                setTimeout(function () {
                    hideLoader();
                    loadSect();
                }, 3000);
            }
        }
    });
}

var loadSect = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/LoadSects",
        type: "post",
        success: function (res) {
            $("#divLoadSects").html(res);
            $("#tblLoadSects").DataTable({
                "iDisplayLength": 100,
            });
            hideLoader();
        }
    });
}

var deleteReligion = function (id) {
    if (confirm("Are you sure you want to delete this Religion?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Settings/DeleteReligion",
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    showLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                        loadReligions();
                    }, 3000);
                }
            },
            error: function () {
                showLoader("Religion is not deleted because it has sects.", "success");
            }
        });
    }
}
var deleteSect = function (id) {
    if (confirm("Are you sure you want to delete this Sect?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Settings/DeleteSect",
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    showLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                        loadSect();
                    }, 3000);
                }
            }
        });
    }
}

var editReligion = function (id, name) {
    $("#hidReligionId").val(id);
    $("#txtReligionName").val(name);
}

var editSect = function (id, name, religion) {
    $("#hidSectId").val(id);
    $("#drpReligions").val(religion);
    $("#txtSectName").val(name);
}

function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageType = /image.*/;
        if (!file.type.match(imageType)) {
            continue;
        }
        var img = document.getElementById("thumbnil");

        img.file = file;
        var reader = new FileReader();
        reader.onload = (function (aImg) {
            return function (e) {
                aImg.src = e.target.result;
            };
        })(img);
        reader.readAsDataURL(file);
    }
}