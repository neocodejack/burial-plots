$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-grave").addClass("active start");
    if ($("#hidAlert").val() == "true") {
        showLoader("Saved Successfully", "success");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else if ($("#hidAlert").val() == "false") {
        showLoader("Error", "error");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    if ($("#txtLatitude").val() != "" && $("#txtLongitude").val() != "") {
        markers[0].lat = $("#txtLatitude").val();
        markers[0].lng = $("#txtLongitude").val();
    }
    addLayer();
    //loadMap();
    $("#drpPlot").val($("#hidPlotId").val());
    changeCemeteryPlot();
});

var uploadImage = function () {
    showLoader("Please wait...", "info");
    var message = "";
    var getUrl = $("#hidUploadImageUrl").val();
    var file = $("#file").val();
    if (file !== "") {
        var ex = getExt(file);
        if (ex === "png" || ex === "jpg" || ex === "gif" || ex === "doc" || ex === "docx" || ex === "pdf" || ex === "xls" || ex === "xlsx" || ex === "ppt" || ex === "pptx" || ex === "txt") {
            var fileUpload = $("#file").get(0);
            var files = fileUpload.files;
            var data = new FormData();
            for (var i = 0; i < files.length; i++) {
                data.append(files[i].name, files[i]);
            }
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    hideLoader();
                    var msg = xhr.responseText;
                    //if (msg.res === "true") {
                    $("#hidImage").val(msg);
                    $("#divShowImg").html("<img src='/images/Cemetery/" + msg + "' class='img-responsive' />");
                    //var lastImageName = $("#imgCommunity").attr("src").split('/').pop();
                    //var src = $("#imgCommunity").attr("src");
                    //src = src.replace(lastImageName, "");
                    //var src = "../../Images/Community/" + msg;
                    //$("#imgCommunity").attr("src", src);
                }
            };
            xhr.open("POST", getUrl);
            //$("#divPassbookProgress").parent().show();
            xhr.send(data);

        } else {
            message = "Please select image or document file...";
            AutoLoader(message, "error");
        }
    }
}
function getExt(filename) {
    var ext = filename.split('.').pop();
    if (ext === filename) return "";
    return ext.toLowerCase();
}

var saveCemetery = function () {
    var getUrl = $("#hidSaveCemeteryUrl").val();
    var id = $("#hidId").val();
    var sku = $("#txtSku").val();
    var image = $("#hidImage").val();
    var cemeteryName = $("#txtCemeteryName").val();
    var plotNo = $("#txtPlotNo").val();
    var plotType = $("#txtPlotType").val();
    var size = $("#txtSize").val();
    var location = $("#txtLocation").val();
    var religious = $("#drpReligious").val();
    var subreligious = $("#drpReligioussub").val();
    var shortDiscription = $("#txtSDescription").val();
    var fullDescription = $("#txtFDescription").val();
    var internment = $("#txtInternment").val();
    var internmentFee = $("#txtInternmentFee").val();
    var lease = $("#txtLease").val();
    //var price = $("#txtPrice").val();
    var maintenance = $("#txtMaintenance").val();
    //var lat = $("#txtLatitude").val();
    //var longi = $("#txtLongitude").val();
    var north = $("#txtNorth").val();
    var east = $("#txtEast").val();
    var south = $("#txtSouth").val();
    var west = $("#txtWest").val();
    var plotId = $("#drpPlot").val();
    var address = $("#txtMapAddress").val();
    var tierId = $("#drpTier").val();
    var layers = [];
    $(".divLayer").each(function (index, elem) {
        var LayerName = $(elem).find(".txtLayer").val();
        var layerId = $(elem).find(".txtLayerId").val();
        var price = $(elem).find(".txtLayerPrice").val();
        var objj = {Id: layerId,Name: LayerName,Price:price}
        layers.push(objj);
    });
    var _data = {
        id: id, sku: sku, image: image, cemeteryName: cemeteryName, plotNo: plotNo, plotType: plotType, size: size, location: location,
        religious: religious, subreligious: subreligious, shortDiscription: shortDiscription, fullDescription: fullDescription,
        internment: internment, internmentFee: internmentFee, lease: lease, maintenance: maintenance,
        graveBounds: JSON.stringify(tempDrawBounds), plotId: plotId, address: address, layers: JSON.stringify(layers),
        tierId: tierId
    }
    if (cemeteryName == "" || plotNo == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else if (tempDrawBounds.length < 2) {
        AutoLoader("Please draw the grave first", "info");
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            data: _data,
            success: function (res) {
                if (res == "true") {
                    window.location.reload();
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

var editCemetery = function () {
    var getUrl = $("#hidSaveCemeteryUrl").val();
    var id = $("#hidId").val();
    var sku = $("#txtSku").val();
    var image = $("#hidImage").val();
    var cemeteryName = $("#txtCemeteryName").val();
    var plotNo = $("#txtPlotNo").val();
    var plotType = $("#txtPlotType").val();
    var size = $("#txtSize").val();
    var location = $("#txtLocation").val();
    var religious = $("#drpReligious").val();
    var quantity = $("#txtQuantity").val();
    var shortDiscription = $("#txtSDescription").val();
    var fullDescription = $("#txtFDescription").val();
    var internment = $("#txtInternment").val();
    var internmentFee = $("#txtInternmentFee").val();
    var lease = $("#txtLease").val();
    var price = $("#txtPrice").val();
    var maintenance = $("#txtMaintenance").val();
    //var lat = $("#txtLatitude").val();
    //var longi = $("#txtLongitude").val();
    var north = $("#txtNorth").val();
    var east = $("#txtEast").val();
    var south = $("#txtSouth").val();
    var west = $("#txtWest").val();

    var address = $("#txtMapAddress").val();
    var _data = {
        id: id, sku: sku, image: image, cemeteryName: cemeteryName, plotNo: plotNo, plotType: plotType, size: size, location: location,
        religious: religious, quantity: quantity, shortDiscription: shortDiscription, fullDescription: fullDescription,
        internment: internment, internmentFee: internmentFee, lease: lease, price: price, maintenance: maintenance,
        north:north, south:south, west:west, east: east, address: address
    }
    if (cemeteryName == "" || plotNo == "" || price == ""|| north == "" || east == "" || west == "") {
        showLoader("Please fill the required fields", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            data: _data,
            success: function (res) {
                if (res == "true") {
                    var returnUrl = $("#hidEditReturnUrl").val();
                    window.location.href = returnUrl;
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


///////import excel//////////
var btnImportExcel = function () {
    $("#btnExcelFile").click();
}

var changeExcelFileField = function () {
    $("#btnExcelSubmit").click();
}

///////////map////////////////
var markers = [
        {
            "title": 'London',
            "lat": '51.5073509',
            "lng": '-0.12775829999998223',
            "description": 'London'
        }
];

var Drawbounds = [{
    north: 0,
    south: 0,
    east: 0,
    west: 0
}];
var drawGraveCoordinates = [{"Id":"", "Name": "", "GraveCoordinates": [{ "lat": 0, "lng": 0 }] }]
var tempDrawBounds = [{ lat: 0, lng: 0 }];

var overlay;
var USGSOverlay = function (bounds, image, map) {

    // Initialize all properties.
    this.bounds_ = bounds;
    this.image_ = image;
    this.map_ = map;

    // Define a property to hold the image's div. We'll
    // actually create this div upon receipt of the onAdd()
    // method so we'll leave it null for now.
    this.div_ = null;

    // Explicitly call setMap on this overlay.
    this.setMap(map);
}
var zoom = 7;
function loadMap() {
    var map = new google.maps.Map(document.getElementById('dvMap'), {
        center: centerCoordinate,
        zoom: zoom,
        mapTypeId: 'roadmap'
    });

    var bermudaTriangle = new google.maps.Polygon({
        paths: SectionDrawbounds.list,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
            strokeWeight: 1,
            fillColor: SectionDrawbounds.Color,
            //fillOpacity: 0.35
    });
 
    if (cemeteryImage != null) {
        var bounds = new google.maps.LatLngBounds(
           new google.maps.LatLng(centerCoordinate.lat, centerCoordinate.lng),
           new google.maps.LatLng(centerCoordinate.lat + 0.118652, centerCoordinate.lng + 0.281524));
        var srcImage = '/images/CemeteryPlots/' + cemeteryImage;
        overlay = new USGSOverlay(bounds, srcImage, map);
        var offsetX = 0.40;
        var offsetY = 0.40;
        var span = map.getBounds().toSpan();
        var newCenter = {
            lat: centerCoordinate.lat + span.lat() * offsetY,
            lng: centerCoordinate.lng + span.lng() * offsetX
        };
        map.panTo(newCenter);
    }
    if (SectionDrawbounds.list.length > 1) {
        var offsetX = 0.10;
        var offsetY = 0.10;
        var span = map.getBounds().toSpan();
        var newCenter = {
            lat: SectionDrawbounds.list[0].lat + span.lat() * offsetY,
            lng: SectionDrawbounds.list[0].lng + span.lng() * offsetX
        };
        map.panTo(newCenter);
    }

    bermudaTriangle.setMap(map);
    var infoWin1 = new google.maps.InfoWindow();
    infoWin1.setPosition(SectionDrawbounds.list[0]);
    infoWin1.setContent("<b>"+SectionDrawbounds.Name+"</b>");
    google.maps.event.addListener(bermudaTriangle, 'mouseover', function () {
        infoWin1.open(map);
    });
    google.maps.event.addListener(bermudaTriangle, 'mouseout', function () {
        infoWin1.close(map);
    });

    var drawingManager = new google.maps.drawing.DrawingManager({
        drawingMode: google.maps.drawing.OverlayType.MARKER,
        drawingControl: true,
        drawingControlOptions: {
            position: google.maps.ControlPosition.TOP_CENTER,
            drawingModes: ['marker', 'circle', 'polygon', 'polyline', 'rectangle']
        },
        markerOptions: { icon: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png' },
        circleOptions: {
            fillColor: '#ffff00',
            fillOpacity: 1,
            strokeWeight: 5,
            clickable: false,
            editable: true,
            zIndex: 1
        },
    });
    $.each(drawGraveCoordinates, function (index, item) {
        var grave = new google.maps.Polygon({
            paths: item.GraveCoordinates,
            strokeColor: 'black',
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: 'white',
            fillOpacity: 0.35
        });
        grave.setMap(map);
    });
    var marker = new google.maps.Marker({
        map: map,
        position: centerCoordinate
    });


    google.maps.event.addListener(drawingManager, 'polygoncomplete', function (event) {
        var GraveDrawbounds = [];
        var paths = event.getPaths();
        var path;
        for (var i = 0; i < paths.getLength() ; i++) {
            path = paths.getAt(i);
            for (var ii = 0; ii < path.getLength() ; ii++) {
                GraveDrawbounds.push(path.getAt(ii));
            }
        }
        tempDrawBounds = [];
        for (var i = 0; i < GraveDrawbounds.length; i++) {
            var g = JSON.stringify(GraveDrawbounds[i]);
            tempDrawBounds.push(JSON.parse(g));
        }
        $('html, body').animate({
            scrollTop: $("#divWholeForm").offset().top
        }, 2000);
    });

    drawingManager.setMap(map);
}
var centerCoordinate = { lat: 55.378051, lng: -3.435973 }
var cemeteryImage = null;
var changeCemeteryPlot = function () {
    var id = $("#drpPlot").val();
    if (id != "") {
        var getUrl = $("#hidLoadPlotUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res != "false") {
                var data = JSON.parse(res);
                centerCoordinate.lat = parseFloat(data.Lat);
                centerCoordinate.lng = parseFloat(data.Longi);
                cemeteryImage = data.Image;
                zoom = data.Zoom;
                $("#txtMapAddress").val(data.Address);
                if (data.list.length > 0) {
                    drawGraveCoordinates = data.list;
                }
                $("#drpReligious").html(data.drpSections);
                $("#txtLocation").val(data.Address);
                
                //loadMap();
                loadMapWithImage();
                hideLoader();
            }
        }
    });
    }
}
var rowId = 0;
var addLayer = function () {
    var html = $("#tmpLayers").html();
    var tmpl = _.template(html);
    var value = {
        Id: rowId
    };
    var tpl = tmpl(value);
    $("#divLoadLayers").append(tpl);
    if (rowId == 0) {
        $("#divBtnRemove_0").css("display", "none");
    }
    rowId++;
}

var removeLayer = function (id) {
    $("#divLayer_"+id).remove();
}
var SectionDrawbounds = { "CatName": "", "list": [{lat:0, lng:0}]};
var loadSection = function () {
    var plotId = $("#drpPlot").val();
    var sectionId = $("#drpReligious").val();
    if (plotId == "") {
        AutoLoader("Please select plot first", "info");
    }
    else {
        var link = $("#hidLoadSectionUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { plotId: plotId, sectionId: sectionId },
            success: function (res) {
                if (res != "false") {
                    var data = JSON.parse(res);
                    SectionDrawbounds = data;
                    loadMap();
                    changeCemeteryPlotSub();
                }
            }
        });
    }
}

var changeCemeteryPlotSub = function changeCemeteryPlot() {
    var id = $("#drpReligious").val();
    var getUrl = $("#hidLoadsubPlotUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res != "false") {
                var data = JSON.parse(res);
                centerCoordinate.lat = parseFloat(data.Lat);
                centerCoordinate.lng = parseFloat(data.Longi);
                $("#txtMapAddress").val(data.Address);
                if (data.list.length > 0) {
                    drawGraveCoordinates = data.list;
                }
               
                $("#drpReligioussub").html(data.drpSections);
                loadMap();
                hideLoader();
            }
        }
    });
}
var loadsubSection = function () {
    var plotId = $("#drpPlot").val();
    var sectionId = $("#drpReligious").val();
    var subsectionId = $("#drpReligioussub").val();
    if (plotId == "") {
        AutoLoader("Please select plot first", "info");
    }
    else {
        var link = $("#hidLoadSubSectionUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { plotId: plotId, sectionId: sectionId,subsectionId:subsectionId },
            success: function (res) {
                if (res != "false") {
                    var data = JSON.parse(res);
                    SectionDrawbounds = data;
                    loadMap();
                
                }
            }
        });
    }
}


var loadMapWithImage = function () {
    USGSOverlay.prototype = new google.maps.OverlayView();
    USGSOverlay.prototype.onAdd = function () {

        var div = document.createElement('div');
        div.style.borderStyle = 'none';
        div.style.borderWidth = '0px';
        div.style.position = 'absolute';
        // Create the img element and attach it to the div.
        var img = document.createElement('img');
        img.src = this.image_;
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.position = 'absolute';
        div.appendChild(img);

        this.div_ = div;

        // Add the element to the "overlayLayer" pane.
        var panes = this.getPanes();
        panes.overlayLayer.appendChild(div);
    };

    USGSOverlay.prototype.draw = function () {

        // We use the south-west and north-east
        // coordinates of the overlay to peg it to the correct position and size.
        // To do this, we need to retrieve the projection from the overlay.
        var overlayProjection = this.getProjection();

        // Retrieve the south-west and north-east coordinates of this overlay
        // in LatLngs and convert them to pixel coordinates.
        // We'll use these coordinates to resize the div.
        var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
        var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());

        // Resize the image's div to fit the indicated dimensions.
        var div = this.div_;
        div.style.left = sw.x + 'px';
        div.style.top = ne.y + 'px';
        div.style.width = (ne.x - sw.x) + 'px';
        div.style.height = (sw.y - ne.y) + 'px';
    };

    // The onRemove() method will be called automatically from the API if
    // we ever set the overlay's map property to 'null'.
    USGSOverlay.prototype.onRemove = function () {
        this.div_.parentNode.removeChild(this.div_);
        this.div_ = null;
    };
    loadMap();
}