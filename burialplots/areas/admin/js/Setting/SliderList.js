$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-contentManage").addClass("start active open");
    $("#lis-slider").addClass("start active");
    loadSlideList();
});
var loadSlideList = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadSliderListUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadSliderList").html(res);
            $("#tblLoadSliderList").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
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
var saveSlider = function () {
    var name = $("#txtName").val();
    saveImage(name);
}
var saveImage = function (name) {
    var formData = new FormData();
    var totalFiles = document.getElementById("file").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("file").files[i];
        formData.append("file", file);
    }
    if (totalFiles > 0) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Slider/UploadImage",
            type: "POST",
            async: false,
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: function (res) {
                $.ajax({
                    url: "/Admin/Slider/SaveSlider",
                    type: "post",
                    data: {name: name, image: res },
                    success: function (result) {
                        if (result == "true") {
                            AutoLoader("Slider Saved Successfully", "success");
                        }
                        else {
                            AutoLoader("Error", "error");
                        }

                    },
                    error: function () {
                        AutoLoader("Error", "error");
                    }
                });
            }
        });
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Slider/SaveSlider",
            type: "post",
            data: { name: name, image: "" },
            success: function (result) {
                if (result == "true") {
                    AutoLoader("Slider Saved Successfully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }

            },
            error: function () {
                AutoLoader("Error", "error");
            }
        });
    }
};
var saveCaption = function () {
    var id = $("#hidId").val();
    var english = $("#txtEnglish").val();
    var urdu = $("#txtUrdu").val();
    var arabic = $("#txtArabic").val();
    var hindi = $("#txtHindi").val();
    var chinese = $("#txtChinese").val();
    var italian = $("#txtItalian").val();
    var turkish = $("#txtTurkish").val();
    var bengali = $("#txtBengali").val();
    var hebrew = $("#txtHebrew").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Slider/SaveCaption",
        type: "post",
        data: {
            id: id, english: english, urdu: urdu, arabic: arabic, hindi: hindi, chinese: chinese, italian: italian,
            turkish: turkish, bengali: bengali, hebrew: hebrew
        },
        success: function (result) {
            if (result == "true") {
                AutoLoader("Caption Saved Successfully", "success");
                loadSlideList();
                clearAllFields();
            }
            else {
                AutoLoader("Error", "error");
            }
        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });
}
var clearAllFields = function () {
    $("#hidId").val("");
    $("#txtEnglish").val("");
    $("#txtUrdu").val("");
    $("#txtArabic").val("");
    $("#txtHindi").val("");
    $("#txtChinese").val("");
    $("#txtItalian").val("");
    $("#txtTurkish").val("");
    $("#txtBengali").val("");
    $("#txtHebrew").val("");
}
var deleteCaption = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Slider/DeleteCaption",
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadSlideList();
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
var editCaption = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Slider/EditCaption",
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            $("#hidId").val(data.Id);
            $("#txtEnglish").val(data.CaptionEnglish);
            $("#txtUrdu").val(data.CaptionUrdu);
            $("#txtArabic").val(data.CaptionArabic);
            $("#txtHindi").val(data.CaptionHindi);
            $("#txtChinese").val(data.CaptionChinese);
            $("#txtItalian").val(data.CaptionItalian);
            $("#txtTurkish").val(data.CaptionTurkish);
            $("#txtBengali").val(data.CaptionBengali);
            $("#txtHebrew").val(data.CaptionHebrew);
            hideLoader();
        }
    });
}







// Delete Blog 
var deleteBlogListing = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidBlogListingDeleteLnk").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadBlogListing();
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

// Publish Blog
var blogPublish = function (id) {
    var link = $("#hidPublishBloglnk").val();
    $.ajax({

        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {

            if (res == "true") {
                loadBlogListing();
                showLoader("Published Successfully", "success");
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

var blogUnPublish = function (id) {
    var link = $("#hidUnPublishBloglnk").val();
    $.ajax({

        url: link,
        type: "post",
        data: { id: id },
        success: function (res) {

            if (res == "true") {
                loadBlogListing();
                showLoader("Un-Published Successfully", "success");
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

