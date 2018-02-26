var Description;
$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-Blogs").addClass("start active");
    $("#lis-BlogList").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    loadDescriptionEditor();
    $('form').submit(function () {
        showLoader("Please wait..", "info");
        var Title = $("#Title").val();
        var id = $("#hidId").val();
        var Category = $("#Category").val();
        var IsFeatured = "false";
        if ($("#IsFeatured").is(":checked")) {
            IsFeatured = "true";
        }
        var Date = $("#Date").val();
        Description = quill.container.firstChild.innerHTML;
        if ($(this).valid()) {
            saveImage(id,Title, Category, IsFeatured, Date, $("#drpPublish").val());
        }
        return false;
    });
    datepicker();
});

var quill;
var loadDescriptionEditor = function () {
    quill = new Quill('#editornew', {
        modules: {
            toolbar: [
              [{ header: [1, 2, false] }],
              ['bold', 'italic', 'underline'],
              ['image', 'code-block'],

                ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
['blockquote', 'code-block'],

         // custom button values
[{ 'list': 'ordered' }, { 'list': 'bullet' }],
[{ 'script': 'sub' }, { 'script': 'super' }],      // superscript/subscript
[{ 'indent': '-1' }, { 'indent': '+1' }],          // outdent/indent
[{ 'direction': 'rtl' }],                         // text direction

[{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
[{ 'header': [1, 2, 3, 4, 5, 6, false] }],

[{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
[{ 'font': [] }],
[{ 'align': [] }],

['clean']
            ]
        },
        placeholder: 'Description...',
        theme: 'snow'  // or 'bubble'
    });
    quill.on('text-change', function () {

        var html = quill.container.firstChild.innerHTML;
        //show.value = html; // make this a <textarea>
    });
}
var datepicker = function () {
    $(".datepicker").datepicker();
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
var saveImage = function (id, Title, Category, IsFeatured, Date, IsApproved) {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    if (totalFiles > 0) {
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
                    url: "/Admin/Blog/CreateBlog",
                    type: "post",
                    //data: $(this).serialize(), Image: image,
                    data: {
                        Id: id, Title: Title, Description: Description, CategoryId: Category, FeaturedImage: res, IsFeatured: IsFeatured,
                        PublishedDate: Date, IsApproved: IsApproved
                    },
                    success: function (result) {
                        if (result == "true") {
                            AutoLoader("Saved Successfully", "success");
                            window.location.href = "/Admin/Blog/Index";
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
        $.ajax({
            url: "/Admin/Blog/CreateBlog",
            type: "post",
            //data: $(this).serialize(), Image: image,
            data: {
                Id: id, Title: Title, Description: Description, CategoryId: Category, FeaturedImage: "", IsFeatured: IsFeatured,
                PublishedDate: Date, IsApproved: IsApproved
            },
            success: function (result) {
                if (result == "true") {
                    AutoLoader("Saved Successfully", "success");
                    window.location.href = "/Admin/Blog/Index";
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
var showsource = function () {
    $("#souruce").toggle();
}
