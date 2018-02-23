var Description;
$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active open");
    $("#lis-slider").addClass("start active");
    $("#previewImage").hide();
    var SliderId = $("#hidSliderId").val();
    
    if (SliderId != "") {
        
        loadSlidesList();
    }
    
    
    $('#SlideForm').submit(function () {
        
        var id = $("#hidId").val(); 
        var Name = $("#Name").val();
        var Caption = $("#Caption").val();
        var SliderName = $("#SLiderName").val();
        if (Name == "") {
            $("#Name").css("border", "2px solid red");
            return false;
        }
        if(Caption==""){
            $("#Caption").css("border", "2px solid red");
            return false;
        }
        if (SliderName == "") {
            $("#SLiderName").css("border", "2px solid red");
            return false;

        }
        var slideImages = false;
        if ($('#slideImages').is(':checked')) {
            slideImages = true;
        }
            
       
        if ($(this).valid()) {
            saveImage(Name, Caption, SliderName, id, SliderId, slideImages);
        }
        return false;
    });

});



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

$('#slideImages').change(function () {

    if ($(this).is(':checked')) {
        $("#slideImages").val(true);
    }
 
});
//image save
var saveImage = function (Name, Caption, SliderName, id, SliderId, slideImages) {
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
                url: "/Admin/Settings/AddSlider",
                type: "post",
                data: { Name: Name, Caption: Caption, SliderName: SliderName, Image: res, id: id, SliderId: SliderId, slideImages: slideImages },
                success: function (result) {
                    if (result == "true") {
                        AutoLoader("Saved Successfully", "success");
                        window.location.href = "/Admin/Settings/AddSlider";
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

};
var showsource = function () {
    $("#souruce").toggle();
}

//$(document).ready(function () {
//    $("#li-Dashboard").removeClass("start active");
//    $("#li-setting").addClass("start active open");
//    $("#lis-town").addClass("start active");

//});

var loadSlidesList = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadSlidesUrl").val();
    var sliderId=$("#hidSliderId").val();
    $.ajax({
        url: link,
        type: "post",
        data:{sliderId:sliderId},
        success: function (res) {
            $("#divLoadSlidesList").html(res);
            $("#tblLoadSlides").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}



//var editSlides = function (id, name, caption, image, sliderName) {
var editSlides = function (id, name, sliderName, caption, image) {

    document.getElementById("Caption").value = caption;
    $("#hidId").val(id);
    $("#Name").val(name);
    $("#SLiderName").val(sliderName);
    //$("#Caption").val("dsd");
    
    $("#thumbnil").attr("src", "/images/Blog/" + image);
    $("#previewImage").show();
}
var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtName").val("");
    $("#txtDescription").val("");
    $("#drpCountry").val("");
}

var deleteSlide = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteSlideUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadSlidesList();
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
