$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-contentManage").addClass("start active open");
    $("#li-FuneralService").addClass("start active open");
    loadFuneralServices();
});

var loadFuneralServices = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadFuneralServices").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadFuneralServices").html(res);
            $("#tblLoadFuneralServices").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        }
    });
}

//image js
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





//image save
var saveImage = function (link, id, name, description) {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];

        formData.append("ImgUpload", file);
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: url,
        type: "POST",
        async: false,
        dataType: 'json',
        contentType: false,
        processData: false,
        data: formData,
        success: function (res) {
            $.ajax({
                url: link,
                type: "post",
                data: { id: id, name: name, description: description, picture: res },
                success: function (res) {
                    if (res == "true") {
                        loadFuneralServices();
                        resetAllFields();
                        showLoader("Saved successfully", "success");
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
    });

};
















var saveFuneralServices = function () {
    var link = $("#hidSaveFuneralServicesUrl").val();
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var description = $("#txtDescription").val();

    if (name == "" || name==null) {
        $("#txtName").css("border","2px solid red");
        return;
    }
    else {
        $("#txtName").css("border", "");
    }
    if (description == ""|| description==null) {
        $("#txtDescription").css("border", "2px solid red");
        return;
    }
    else {
        $("#txtDescription").css("border", "");
    }
    saveImage(link, id, name, description);
}

var editFuneralServices = function (id, name, desc,picture) {
    $("#hidId").val(id);
    $("#txtName").val(name);
    $("#txtDescription").val(desc);

}

var deleteFuneralService = function (id) {
    var aa = confirm("Are you sure you want to delete this service?");
    if (aa) {
        var link = $("#hidDeleteService").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadFuneralServices();
                    resetAllFields();
                    showLoader("Deleted successfully", "success");
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

var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
}