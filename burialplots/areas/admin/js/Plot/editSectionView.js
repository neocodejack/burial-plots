$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-section").addClass("active start");
    loadsubrelgion();
    changePlots();
    loadMap();
});
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
function loadMap() {
    var map = new google.maps.Map(document.getElementById('dvMap'), {
        center: centerCoordinate,
        zoom: zoom,
        mapTypeId: 'roadmap'
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
    var triangleCoords = [
          { lat: 25.774, lng: -80.190 },
          { lat: 18.466, lng: -66.118 },
          { lat: 32.321, lng: -64.757 },
          { lat: 25.774, lng: -80.190 }
    ];
    // Construct the polygon.
    if (Drawbounds.length == 0) {
        var bermudaTriangle = new google.maps.Polygon({
            paths: tempDrawBounds,
            strokeColor: '#FF0000',
            strokeOpacity: 0.8,
           // strokeWeight: 1,
            fillColor: '#CDCDCD',
            fillOpacity: 0.35
        });
        bermudaTriangle.setMap(map);
    }
    else {
        $.each(Drawbounds, function (i, item) {
            var bermudaTriangle = new google.maps.Polygon({
                paths: item.list,
                strokeColor: '#FF0000',
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: '#FF0000',
                fillOpacity: 0.35
            });
            bermudaTriangle.setMap(map);
            ///////////sections title//////////
            var infoWin1 = new google.maps.InfoWindow();
            infoWin1.setPosition(item.list[0]);
            infoWin1.setContent("<b>" + item.Name + "</b>");
            google.maps.event.addListener(bermudaTriangle, 'mouseover', function () {
                infoWin1.open(map);
            });
            google.maps.event.addListener(bermudaTriangle, 'mouseout', function () {
                infoWin1.close(map);
            });
            ///////////////////////////////////
        });
    }
    var marker = new google.maps.Marker({
        map: map,
        // animation: google.maps.Animation.DROP,
        position: centerCoordinate
    });
    google.maps.event.addListener(drawingManager, 'polygoncomplete', function (event) {
        var bounds = [];
        var paths = event.getPaths();
        var path;
        for (var i = 0; i < paths.getLength() ; i++) {
            path = paths.getAt(i);
            for (var ii = 0; ii < path.getLength() ; ii++) {
                bounds.push(path.getAt(ii));
            }
        }
        tempDrawBounds = [];
        for (var i = 0; i < bounds.length; i++) {
            var g = JSON.stringify(bounds[i]);
            tempDrawBounds.push(JSON.parse(g));
        }
    });

    drawingManager.setMap(map);
}
var centerCoordinate = { lat: 55.378051, lng: -3.435973 };
var Drawbounds = [];
var tempDrawBounds = [{ lat: 0, lng: 0 }];
var cemeteryImage = null;
var zoom = 8;
var changePlots = function () {
    var id = $("#hidPlotId").val();
    var getUrl = $("#hidLoadPlotUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            centerCoordinate.lat = parseFloat(data.Lat);
            centerCoordinate.lng = parseFloat(data.Longi);
            cemeteryImage = data.Image;
            zoom = data.Zoom;
            LoadSections(id);
        }
    });
}

var LoadSections = function (id) {
    var getUrl = $("#hidLoadSectionsUrl").val();
    showLoader("Please wait..", "info");
    $.ajax({
        url: getUrl,
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            Drawbounds = data;
            loadMapWithImage();
            hideLoader();
        }
    });
}

var editSection = function () {
    var id = $("#hidId").val();
    var category = $("#drpCategory").val();

    var Relgion = $("#drprelgion").val();
    var subrelgion = $("#subrelgion").val();
    var name = $("#txtName").val();
    var link = $("#hidEditSectionUrl").val();
    if (name == "") {
        AutoLoader("Please fill the required fields", "info");
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, category: category, name: name, Religion: Relgion, subreligion: subrelgion },
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Saved Successfully", "success");
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var checkAddresses = function () {
    function getAddress(location) {
        var googleApi = "AIzaSyDXNqQl7QofEYjGGJHknVJG8ZN9NZM9b-c";
        $.getJSON("http://maps.google.com/maps/geo?q=" + location + "key=" + googleApi + "&sensor=false&output=json&callback=?&#8221;", function (data, textStatus) {
            $.each(data.Placemark, function (key, val) {
                alert(val.address);
            });
        });
    }
}
var loadsubrelgion = function () {
    var id = $("#drprelgion").val();
    var message = "";
    var getUrl = $("#hidLoadsubrelgion").val();
    $.ajax({
        url: getUrl,
        type: "POST",
        data: { id: id },
        success: function (msg) {
            if (msg.res === "true") {
                $("#subrelgion").html(msg.drpDoctor);
                $("#subrelgion").val($("#hidSubReligion").val());
            }

        },
        error: function (res) {

        }
    });
};

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
        //img.style.opacity = '0.5'
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