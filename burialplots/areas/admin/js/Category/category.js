$(document).ready(function () {
    $("#li-Cemetery").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-category").addClass("start active");
    $("#lis-addCategory").addClass("start active");
    LoadCat();

});
var insertCate = function () {
   
    var code = $("#catecode").val();
    var name = $("#catename").val();
    var image = saveImage();
    var status = document.querySelector('input[name="active"]:checked').value;
   

    $.ajax({
        url: "/Admin/Categories/CategoryAdd",
        type: "Post",
        data: { code: code, name: name, status: status, image: image },
        success: function (res) {
            if (res == "true") {
                alert("Category Create");
            }
            else {
                alert("Category Not Create");
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
var Delete = function (id) {
    alert(id)
    var url = $("#del").val();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {
                alert("deleted");
                LoadCat();
            }

        }
    })
}
var edit = function (id, code, catname, catpic) {
  
    $("#catid").val(id);
    $("#catecode").val(code);
    $("#catename").val(catname);
    $("#thumbnil").attr('src', "/Areas/Admin/Image/" + catpic);
    $("#hideimgname").val(catpic);
  
    $("#category").css('display', 'block');

}
var updateCate = function () {
    alert();
    var catpic = $("#hideimgname").val();
    var url = $("#hidediturl").val();
    var code = $("#catecode").val();
    var catnam = $("#catename").val();
    var catpix = saveImage();
    if (catpix == null) {
        catpix = catpic;
    }
    var id = $("#catid").val();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id, code: code, catname: catnam, catpic: catpix },
        success: function (res) {
            if (res == "True") {
                alert("successfully updated")
                hidediv();
                LoadCat();
            }
        }
    })
}
var LoadCat = function () {
    var url = $("#LoadCatPartial").val();
    $.ajax({
        url: url,
        type: "post",
        success: function (res) {
            $("#LoadCat").html(res);
            $("#tblcategory").DataTable();
        }
    })
}
var hidediv=function()
{
    $("#category").css("display", "none");
}