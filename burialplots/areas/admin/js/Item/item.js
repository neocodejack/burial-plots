$(document).ready(function () {
    $("#li-store").addClass("start active open");
    $("#li-Dashboard").removeClass("start active");
    $("#li-item").addClass("start active open");
    Load();
})
var additem = function () {
   
    var icode = $("#itemno").val();
    var iname = $("#itemname").val();
    var iqty = $("#itemqty").val();
    var irprice = $("#itemrprice").val();
    var icprice = $("#itemprice").val();
    var cateid = $("#cateid").val();
    var description = $("#itemdescription").val();
    var image = saveImage();
    var status = document.querySelector('input[name="active"]:checked').value;
    var feature = document.querySelector('input[name="feature"]:checked').value;
     $.ajax({
         url: "/Admin/Item/ItemAdd",
        type: "Post",
        data: { code: icode, name: iname, qty: iqty, rprict: irprice, cprice: icprice, cateid: cateid, image: image, status: status, feature: feature, description: description },
        success: function (res) {
            if (res == "true") {
                alert("Item Create");
            }
            else {
                alert("Item Not Create");
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
    var url = $("#delitem").val();
    $.ajax({
        url: url,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "True") {
                alert("successfully deleted");
            }
        }
    })
}
var edit = function (id, qty, name, no, cprice, rprice, img) {

    $("#updateid").val(id);
    $("#itemqty").val(qty);
    $("#itemname").val(name);
    $("#itemno").val(no);
    $("#itemprice").val(cprice);
    $("#itemrprice").val(rprice);
    $("#Imghiden1").val(img);
    $("#thumbnil").attr("src", img);
}
var update = function () {
    var pic = $("#Imghiden1").val();
    //var ipic = $("#ImgUpload").val();
    var url = $("#updateidurl").val();
    var id = $("#updateid").val();
    var qty = $("#itemqty").val();
    var iname = $("#itemname").val();
    var ino = $("#itemno").val();
    var icprice = $("#itemprice").val();
    var irprice = $("#itemrprice").val();
    var img = saveImage();
    var c;
    if (img != null) {


        c = img;
    }
    else
        c = pic;


    $.ajax({
        url: url,
        type: "post",
        data: { id: id, iqty: qty, iname: iname, ino: ino, icprice, icprice, irprice: irprice, img: c },
        success: function (res) {
            if (res == "True") {
                alert("successfully updated");
            }
        }
    })





}
var Load = function () {
    var url = $("#Loadurl").val();
    $.ajax({
        url: url,
        type: "post",
        success: function (res) {
            $("#LoadItem").html(res);
            $("#tblLoadItem").DataTable();
        }
    })
}