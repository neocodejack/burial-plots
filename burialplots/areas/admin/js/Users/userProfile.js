$(function () {
    $("#li-profile").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
    $('form').submit(function () {
        var FName = $('#FName').val();
        var LName = $('#LName').val();
        var email = $('#email').val();
        var paswword = $('#password').val();
        var UserName = $('#UserName').val();
        var PNumber = $('#PNumber').val();
        var link = $('#hProfileId').val();
        var hId = $("#hId").val();
        if (email == "" && paswword == "") {

            $('#email').css("border", "2px solid red");
            $('#password').css("border", "2px solid red");
            return;
        }
        if (paswword.length < 4 || paswword.length > 8) {
            AutoLoader("Password length must be minimum 4 and maximum 8 characters", "info");
            $('#password').css("border", "2px solid red");
            return;
        }
        if ($(this).valid()) {
            saveImage(email, paswword, link, PNumber, FName, LName, UserName, hId);
        }



    });



});

//image save
var saveImage = function (email, paswword, link, PNumber, FName, LName, UserName, hId) {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];
        formData.append("ImgUpload", file);
    }

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

                type: "post",
                url: link,
                data: { Email: email, Password: paswword, CellNo: PNumber, Fname: FName, Lname: LName, Username: UserName, Picture: res, Id: hId },
                success: function (result) {
                    if (result == "true") {

                        AutoLoader("Saved Successfully", "success");
                        window.location.reload(true);
                    }
                    else {
                        AutoLoader("Error", "error");
                    }
                }
            });
        }
    });

};
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

var SaveProfileChanges = function () {
    var email = $('#email').val();
    var paswword = $('#password').val();
    if (email == "" && paswword == "") {

        $('#email').css("border", "2px solid red");
        $('#password').css("border", "2px solid red");
        return;
    }


}
