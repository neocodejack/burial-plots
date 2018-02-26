$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-cemetery").addClass("active start");
    localStorage.clear();
    setTimeout(function () {
        $("#wcp-editor-button-new").click();
        $("#wcp-editor-input-create-new").val("unknown");
        $("#wcp-editor-button-create-new-instance").click();
        setMapping();
    }, 1000);
    loadDropZoneUploader();
    loadEditors();
});
var setMapping = function () {
    // $(window).bind("load", function () {
    showLoader("Please wait..", "info");
    setTimeout(function () {
        //$(".wcp-editor-extra-main-button").hide();
        $("#wcp-editor-left").hide();
        var newBtn = '<div id="divMenuBtn" class="wcp-editor-extra-main-button"><div class="wcp-editor-extra-main-button-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><div class="wcp-editor-extra-main-button-title">Menu</div></div>';
        $("#wcp-editor-extra-main-buttons").append(newBtn);
        $("#divMenuBtn").on("click", function () {
            if ($("#wcp-editor-left").is(':visible')) {
                $("#wcp-editor-left").hide();
            }
            else {
                $("#wcp-editor-left").show();
            }
        });
        hideLoader();
    }, 1000);
    // });
}
var uploadCemteryImage = function () {
    var getUrl = $("#hidUploadCemeteryImageUrl").val();
    var message = "";
    var file = $("#imageFile").val();
    if (file !== "") {
        var ex = getExt(file);
        if (ex === "png") {
        var fileUpload = $("#imageFile").get(0);
        var files = fileUpload.files;
        var size = files[0].size;
        if (size > 1000000) {
            AutoLoader("Please select file of size less than 1MB", "info");
            return;
}
        showLoader("Please wait..", "info");
            
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var msg = xhr.responseText;
                    $("#hidImage").val(msg);
                    $("#txtImg").val($("#hidRequestUrl").val() + "Images/CemeteryPlots/" + msg);
                    $('[data-wcp-main-tab-button-name="Image Map"]').click();
                    $('[data-wcp-form-tab-button-name="image"]').click();
                    hideLoader();
                    //$("#txtImagePath").val("http://localhost:6465/Images/CemeteryPlots/" + msg);
                    //setTimeout(function () {

                    //    $('#btn-img-choose').trigger("click");
                    //},1000);
                }
            };
            xhr.open("POST", getUrl);
            xhr.send(data);

        } else {
            message = "Please select PNG file...";
            AutoLoader(message, "info");
        }
    }
};

function getExt(filename) {
    var ext = filename.split('.').pop();
    if (ext === filename) return "";
    return ext.toLowerCase();
}

var saveCemetery = function () {
  
    $('[data-wcp-editor-extra-main-button-name="export"]').click();
    var code = $("#wcp-editor-textarea-export").val();
    $("#wcp-editor-modal").css("display", "none");
    var name = $("#txtName").val();
    var IsFeatured = false;
    if ($('#IsFeatured').is(':checked')) {
        IsFeatured = true;
    }
 
    var originalCode = code;
    //var arr = code.split("imageMapPro");
    var image = $("#hidImage").val();
    var getUrl = $("#hidSaveCemetery").val();
    var regionId = $("#drpRegion").val();
    var description = quill.container.firstChild.innerHTML;
    var keyInfo = quillKeyInfo.container.firstChild.innerHTML;
    var whyChoose = quillWhyChoose.container.firstChild.innerHTML;
    var locationDescription = $("#txtLocationDescription").val();
    var searchLocation = $("#pac-input").val();
    if (regionId == "" || name == "") {
        AutoLoader("Please fill the required fields", "info");
        return;
    }
    //code = arr[1];
    //code = code.replace("(", "").replace(")", "");
    $.ajax({
        url: getUrl,
        type: "post",
        data: {
            name: name, code: JSON.stringify(code), image: image, originalCode: originalCode, regionId: regionId,
            IsFeatured: IsFeatured, description: description, keyInfo: keyInfo, whyChoose: whyChoose, CemeteryImages: JSON.stringify(CemeteryImages),
            locationDescription: locationDescription, searchLocation: searchLocation
        },
        success: function (res) {
            if (res === "true") {
                window.location.href = "/Admin/Cemeteries/ViewCemeteries";
            }
        }
    });
}

var copyImageUrl = function () {
    if ($("#txtImg").val() != "") {
        var copyTextarea = document.querySelector('#txtImg');
        copyTextarea.select();
        var successful = document.execCommand('copy');
        if (successful) {
            AutoLoader("Url copied successfully", "info");
        }
        else {
            AutoLoader("Not copied", "error");
        }
    }
}
var CemeteryImages = [];
var loadDropZoneUploader = function () {
    var dz = $("#dropzoneJsForm").dropzone()[0];
    dz.dropzone.on("success", function (file, response) {
        CemeteryImages.push(response);
        var htmlContent = "";
        for (var i = 0; i < CemeteryImages.length; i++) {
            htmlContent += "<span onclick='removeUploadedImage(\"" + CemeteryImages[i].Id + "\")' class='ico fa fa-times-circle img-close-ico'></span><img id='postImg_" + CemeteryImages[i].Id + "' src='../../Images/CemeteryPlots/CemeteryImages/" + CemeteryImages[i].fileName + "' style='width:100px;height100px;margin:5px'/>";
        }
        $("#divCemeteryImages").html(htmlContent);
    });
}

var removeUploadedImage = function (id) {
    if (confirm("Are you sure you want to remove this image?")) {
        var tempImages = CemeteryImages;
        CemeteryImages = [];
        var removeName = "";
        for (var i = 0; i < tempImages.length; i++) {
            if (tempImages[i].Id != id) {
                CemeteryImages.push(tempImages[i]);
            }
            else {
                removeName = tempImages[i].fileName;
            }
        }
        var htmlContent = "";
        for (var i = 0; i < CemeteryImages.length; i++) {
            htmlContent += "<span onclick='removeUploadedImage(\"" + CemeteryImages[i].Id + "\")' class='ico fa fa-times-circle img-close-ico'></span><img id='postImg_" + CemeteryImages[i].Id + "' src='../../Images/Posts/" + CemeteryImages[i].fileName + "' style='width:50px;height:50px;margin:5px'/>";
        }
        $("#divCemeteryImages").html(htmlContent);
        if (removeName != "") {
            $.ajax({
                url: "/Admin/Cemeteries/DeleteCemeteryImage",
                type: "post",
                data: { removeName: removeName, id: id },
                success: function (res) {

                }
            });
        }
    }
}

var loadEditors = function () {
    loadKeyInfoEditor();
    loadDescriptionEditor();
    loadWhyChooseEditor();
}
var quill;
var loadDescriptionEditor = function () {
    quill = new Quill('#editorDescription', {
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
        placeholder: 'Make Html Page...',
        theme: 'snow'  // or 'bubble'
    });
    quill.on('text-change', function () {

        var html = quill.container.firstChild.innerHTML;
        //show.value = html; // make this a <textarea>
    });
}
var quillKeyInfo;
var loadKeyInfoEditor = function () {
    quillKeyInfo = new Quill('#editorKeyInfo', {
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
        placeholder: 'Make Html Page...',
        theme: 'snow'  // or 'bubble'
    });
    quillKeyInfo.on('text-change', function () {

        var html = quillKeyInfo.container.firstChild.innerHTML;;
        //show.value = html; // make this a <textarea>
    });
}
var quillWhyChoose;
var loadWhyChooseEditor = function () {
    quillWhyChoose = new Quill('#editorWhyChoose', {
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
        placeholder: 'Make Html Page...',
        theme: 'snow'  // or 'bubble'
    });
    quillWhyChoose.on('text-change', function () {

        var html = quillWhyChoose.container.firstChild.innerHTML;;
        //show.value = html; // make this a <textarea>
    });
}

function initAutocomplete() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 51.509865, lng: -0.118092 },
        zoom: 13,
        mapTypeId: 'roadmap'
    });

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });

    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function () {
        var places = searchBox.getPlaces();

        if (places.length == 0) {
            return;
        }

        // Clear out the old markers.
        markers.forEach(function (marker) {
            marker.setMap(null);
        });
        markers = [];

        // For each place, get the icon, name and location.
        var bounds = new google.maps.LatLngBounds();
        places.forEach(function (place) {
            if (!place.geometry) {
                console.log("Returned place contains no geometry");
                return;
            }
            var icon = {
                url: place.icon,
                size: new google.maps.Size(71, 71),
                origin: new google.maps.Point(0, 0),
                anchor: new google.maps.Point(17, 34),
                scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
                map: map,
                icon: icon,
                title: place.name,
                position: place.geometry.location
            }));

            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
}