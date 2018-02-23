$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-ServiceBox").addClass("start active");
    $("#lis-CreateServiceBox").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
});

var showDescrition = function () {
    $("#boxdescription").toggle();
}
var customurl = function () {
    $("#customeurl").toggle();
    $("#serviceuurl").toggle();
}
var servicebox=function()
{
    
    
    if (document.getElementById('chk').checked) {
        chek = "ok";
    }
    else {
        chek = "no";
    }
 
 
    if (document.getElementById('urlchk').checked)
    {
        
        cutom = "ok";
        urlink = $("#customeurldata").val();
    }
    else {
        cutom = "no";
        urlink = $("#drdpagelinkurl").val();
    
    }
    var id = $("#hidId").val();
    var name = $("#txt_name").val();
    var description = $("#txt_descirption").val();
    var url = $("#drdpageurl").val(); 
    var geturl = $("#serviceurl").val();
    
    var pic = saveImage();
    showLoader("Please wait..", "info");
    $.ajax({
        url: geturl,
        type: "Post",
        data: { id: id, name: name, des: description, pic: pic, status: chek, url: url, link: urlink, urlstat: cutom },
        success: function (res) {
            if (res == "true")
            {
                AutoLoader("Service Box created successfully", "success");
                window.location.href = "/Admin/Page/ViewServiceBox";
            }
            else {
                AutoLoader("Service Box Not created", "error");
            }
        }

    })
    
}
//image save
var saveImage = function () {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];

        formData.append("ImgUpload", file);
    }
    if (totalFiles > 0) {
        $.ajax({
            url: url,
            type: "POST",
            async: false,
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: function (res) {
                imageName = res;
            }
        });
    }
    return imageName;
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

