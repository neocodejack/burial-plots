$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-page").addClass("start active");
    $("#lis-createPage").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    initAllEditors();
})
var GetDataRich = function () {

    var imagename = saveImage();

    var value = quill.container.firstChild.innerHTML;
    var bodyUrdu = quillUrdu.container.firstChild.innerHTML;
    var bodyArabic = quillArabic.container.firstChild.innerHTML;
    var bodyChinese = quillChinese.container.firstChild.innerHTML;
    var bodyHindi = quillHindi.container.firstChild.innerHTML;
    var bodyItalian = quillItalian.container.firstChild.innerHTML;
    var bodyTurkish = quillTurkish.container.firstChild.innerHTML;
    var bodyBengali = quillBengali.container.firstChild.innerHTML;
    var bodyHebrew = quillHebrew.container.firstChild.innerHTML;
    var tittle = $("#txttittle").val();
    var tittleUrdu = $("#txtUrdutittle").val();
    var tittleArabic = $("#txtArabictittle").val();
    var tittleChinese = $("#txtChinesetittle").val();
    var tittleItalian = $("#txtItaliantittle").val();
    var tittleHindi = $("#txtHinditittle").val();
    var tittleTurkish = $("#txtTurkishtittle").val();
    var tittleBengali = $("#txtBengalitittle").val();
    var tittleHebrew = $("#txtHebrewtittle").val();
    var multivlaue = $("#multivalue").val();
    if (tittle == "") {
        $("#txttittle").css("border", "2px solid red");
        return;
    }
    else {
        $("#txttittle").css("border", "");
    }

    if (imagename == "" || imagename == null) {
        AutoLoader("Please choose the featured image.", "warning");
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Page/PageAdded",
        type: "Post",
        data: {
            html: value, tittle: tittle, image: imagename, servicebox: multivlaue, bodyUrdu: bodyUrdu, bodyArabic: bodyArabic,
            bodyChinese: bodyChinese, bodyHindi: bodyHindi, bodyItalian: bodyItalian, bodyTurkish: bodyTurkish, bodyBengali: bodyBengali,
            bodyHebrew: bodyHebrew,
            tittleUrdu: tittleUrdu, tittleArabic: tittleArabic, tittleChinese: tittleChinese, tittleItalian: tittleItalian,
            tittleHindi: tittleHindi, tittleTurkish: tittleTurkish, tittleBengali: tittleBengali, tittleHebrew: tittleHebrew
        },
        success: function (res) {
            if (res == "true") {
                showLoader("Page is created successfully!", "success");
                window.location.href = "/Admin/Page/LoadPages";
            }

            else {
                AutoLoader("Error", "error");
            }
        }
    })
}
$("#txttittle").keyup(function () {
    var value = $("#txttittle").val();

    $("#value").val("/Admin/Page/PageView/" + value);


});
var showsource = function () {
    $("#souruce").toggle();
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

var quill;
var initEnglishEditor = function () {
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
        placeholder: 'Make Html Page in English Language...',
        theme: 'snow'  // or 'bubble'
    });
    quill.on('text-change', function () {

        var html = quill.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillUrdu;
var initUrduEditor = function () {
    quillUrdu = new Quill('#editorUrdu', {
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
        placeholder: 'Make Html Page in Urdu Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillUrdu.on('text-change', function () {

        var html = quillUrdu.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillArabic;
var initArabicEditor = function () {
    quillArabic = new Quill('#editorArabic', {
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
        placeholder: 'Make Html Page in Arabic Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillArabic.on('text-change', function () {

        var html = quillArabic.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillChinese;
var initChineseEditor = function () {
    quillChinese = new Quill('#editorChinese', {
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
        placeholder: 'Make Html Page in Chinese Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillChinese.on('text-change', function () {

        var html = quillChinese.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillItalian;
var initItalianEditor = function () {
    quillItalian = new Quill('#editorItalian', {
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
        placeholder: 'Make Html Page in Italian Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillItalian.on('text-change', function () {

        var html = quillItalian.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillTurkish;
var initTurkishEditor = function () {
    quillTurkish = new Quill('#editorTurkish', {
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
        placeholder: 'Make Html Page in Turkish Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillTurkish.on('text-change', function () {

        var html = quillTurkish.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var quillBengali;
var initBengaliEditor = function () {
    quillBengali = new Quill('#editorBengali', {
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
        placeholder: 'Make Html Page in Bengali Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillBengali.on('text-change', function () {

        var html = quillBengali.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}

var quillHebrew;
var initHebrewEditor = function () {
    quillHebrew = new Quill('#editorHebrew', {
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
        placeholder: 'Make Html Page in Hebrew Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillHebrew.on('text-change', function () {

        var html = quillHebrew.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}

var quillHindi;
var initHindiEditor = function () {
    quillHindi = new Quill('#editorHindi', {
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
        placeholder: 'Make Html Page in Hebrew Language...',
        theme: 'snow'  // or 'bubble'
    });
    quillHindi.on('text-change', function () {

        var html = quillHindi.container.firstChild.innerHTML;;
        show.value = html; // make this a <textarea>
    });
}
var initAllEditors = function () {
    initEnglishEditor();
    initUrduEditor();
    initArabicEditor();
    initChineseEditor();
    initItalianEditor();
    initTurkishEditor();
    initBengaliEditor();
    initHebrewEditor();
    initHindiEditor();
}

var appendHtml = function () {
    var html = $("#show").val();
    quill.container.firstChild.innerHTML = html;
}