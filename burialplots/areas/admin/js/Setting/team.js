$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-contentManage").addClass("active start open");
    $("#lis-Team").addClass("active start");
    loadTeam();
});
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

var saveTeam = function () {
    var id = $("#hidId").val();
    var name = $("#txtName").val();
    var description = $("#txtDescription").val();
    var post = $("#txtPost").val();
    if (name == "" || description == "" || post == "") {
        AutoLoader("Please fill the required fields", "info");
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
                url: "/Admin/Settings/UploadTeamImage",
                type: "POST",
                async: false,
                dataType: 'json',
                contentType: false,
                processData: false,
                data: formData,
                success: function (res) {
                    showLoader("Please wait..", "info");
                    $.ajax({
                        url: "/Admin/Settings/SaveTeam",
                        type: "post",
                        data: { id: id, name: name, image: res, description: description, post: post },
                        success: function (res) {
                            if (res == "true") {
                                clearAllFields();
                                showLoader("Saved Successfully", "success");
                                setTimeout(function () {
                                    hideLoader();
                                    loadTeam();
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
                url: "/Admin/Settings/SaveTeam",
                type: "post",
                data: { id: id, name: name, image: "", description: description, post: post },
                success: function (res) {
                    if (res == "true") {
                        clearAllFields();
                        showLoader("Saved Successfully", "success");
                        setTimeout(function () {
                            hideLoader();
                            loadTeam();
                        }, 3000);
                    }
                    else {
                        AutoLoader("Error", "error");
                    }
                }
            });
        }
    }
}

var clearAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#ImgUpload").val("");
    $("#txtDescription").val("");
    $("#txtPost").val("");
    $("#thumbnil").attr("src", "");
}

var loadTeam = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/LoadTeam",
        type: "post",
        success: function (res) {
            $("#divLoadTeam").html(res);
            $("#tblLoadTeam").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var deleteTeam = function (id) {
    if (confirm("Are you sure you want to delete this team member?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Settings/DeleteTeam",
            type: "post",
            data: {id: id},
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        loadTeam();
                    }, 3000);
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var editTeam = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Settings/EditTeam",
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            $("#hidId").val(data.Id);
            $("#txtName").val(data.Name);
            $("#txtDescription").val(data.Description);
            $("#txtPost").val(data.Post);
            $("#thumbnil").attr("src", "../../Images/Users/" + data.Image);
            hideLoader();
        }
    });
}