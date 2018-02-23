$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-setting").addClass("active start open");
    $("#lis-PurchaseBox").addClass("active start");
});

var savePurchaseBoxImage = function () {
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];
        formData.append("ImgUpload", file);
    }
    if (totalFiles > 0) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Settings/SavePurchaseBox",
            type: "POST",
            async: false,
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Saved Successfully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
    else {
        AutoLoader("Please select Image file", "info");
    }
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