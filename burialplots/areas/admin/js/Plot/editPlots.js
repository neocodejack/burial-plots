$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-cemetery").addClass("active start");
    //loadMap();
    showLoader("Please wait..", "info")
    setTimeout(function () {
        setDefaultLocation();
        hideLoader();
    }, 3000);
});

var overlay;
var USGSOverlay = function (bounds, image, map) {
    this.bounds_ = bounds;
    this.image_ = image;
    this.map_ = map;
    this.div_ = null;
    this.setMap(map);
}

var centerCoordinate = { lat: 55.378051, lng: -3.435973 }
var zoom = 0;
function loadMap() {
    var map = new google.maps.Map(document.getElementById('dvMap'), {
        center: centerCoordinate,
        zoom: zoom,
        mapTypeId: 'roadmap'
    });
    var cemeteryImage = $("#hidImage").val();
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
    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function () {
        searchBox.setBounds(map.getBounds());
    });
    zoom = map.getZoom();
    map.addListener('zoom_changed', function () {
        zoom = map.getZoom();
    });
    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function () {
        var places = searchBox.getPlaces();
        //var latitude = places[0].geometry.location.latitude;
        //var longitude = places[0].geometry.location.longitude;
        $("#txtLatitude").val(places[0].geometry.location.lat());
        $("#txtLongitude").val(places[0].geometry.location.lng());
        $("#txtAddress").val(places[0].formatted_address);
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
            var geocoder = geocoder = new google.maps.Geocoder();
            // Create a marker for each place.
            //var marker = new google.maps.Marker({
            //    map: map,
            //    //icon: icon,
            //    title: place.name,
            //    draggable: true,
            //    // animation: google.maps.Animation.DROP,
            //    position: place.geometry.location
            //});
            //markers.push(marker);
            //google.maps.event.addListener(marker, "dragend", function (e) {
            //    var lat, lng, address;
            //    geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
            //        if (status == google.maps.GeocoderStatus.OK) {
            //            lat = marker.getPosition().lat();
            //            lng = marker.getPosition().lng();
            //            $("#txtLatitude").val(lat);
            //            $("#txtLongitude").val(lng);
            //            //address = results[0].formatted_address;
            //            //$("#txtLatitude").val(lat);
            //            //$("#txtLongitude").val(lng);
            //            //$("#txtMapAddress").val(address);
            //            //$("#divWholeForm").slideDown();
            //            //alert("Latitude: " + lat + "\nLongitude: " + lng + "\nAddress: " + address);
            //        }
            //    });
            //});




            if (place.geometry.viewport) {
                // Only geocodes have viewport.
                bounds.union(place.geometry.viewport);
            } else {
                bounds.extend(place.geometry.location);
            }
        });
        map.fitBounds(bounds);
    });
    var marker = new google.maps.Marker({
        map: map,
        // animation: google.maps.Animation.DROP,
        draggable: true,
        position: centerCoordinate,
        icon: '/images/icon/re-position.png'
    });
    google.maps.event.addListener(marker, 'dragend', function (event) {
        var latt = this.getPosition().lat();
        var lngg = this.getPosition().lng();
        $("#txtLatitude").val(latt);
        $("#txtLongitude").val(lngg);
        if (cemeteryImage != null) {
            overlay.setMap(null);
            var bounds = new google.maps.LatLngBounds(
               new google.maps.LatLng(latt, lngg),
               new google.maps.LatLng(latt + 0.118652, lngg + 0.281524));
            var srcImage = '/images/CemeteryPlots/' + cemeteryImage;
            overlay = new USGSOverlay(bounds, srcImage, map);
            //var offsetX = 0.40;
            //var offsetY = 0.40;
            //var span = map.getBounds().toSpan();
            //var newCenter = {
            //    lat: centerCoordinate.lat + span.lat() * offsetY,
            //    lng: centerCoordinate.lng + span.lng() * offsetX
            //};
            //map.panTo(newCenter);
        }
    });
}

var saveCemeteryPlot = function () {
    var id = $("#hidId").val();
    var lat = $("#txtLatitude").val();
    var longi = $("#txtLongitude").val();
    var address = $("#txtAddress").val();
    var name = $("#txtTitle").val();
    var originId = $("#drpOrigin").val();
    var image = new FormData();
    var file = $("#imgFile").get(0);
    if (file != null) {
        var img = file.files[0];
        image.append("img", img);
    }
    image.append("id", id);
    image.append("lat", lat);
    image.append("longi", longi);
    image.append("address", address);
    image.append("name", name);
    image.append("drpTown", originId);
    image.append("zoom", zoom);
    var getUrl = $("#hidSaveCemeteryPlotUrl").val();
    if (lat == "" || longi == "" || address == "" || name == "" || originId == "") {
        AutoLoader("Please fill the required fields", "info");
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: getUrl,
            type: "post",
            processData: false,
            contentType: false,
            data: image,
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Save Successfully", "success");
                    var link = $("#hidReturnViewPlotsUrl").val();
                    window.location.href = link;
                }
                else if (res == "cemeteryExist") {
                    AutoLoader("Please first delete plots of this cemetery", "error");
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var resetAllFields = function () {
    $("#txtLatitude").val("");
    $("#txtLongitude").val("");
    $("#txtAddress").val("");
    $("#txtTitle").val("");
    loadMap();
}

var setDefaultLocation = function () {
    centerCoordinate = {
        lat: parseFloat($("#txtLatitude").val()),
        lng: parseFloat($("#txtLongitude").val())
    }
    zoom = parseInt($("#hidZoom").val());
    loadMapWithImage();
}


var loadMapWithImage = function () {
    USGSOverlay.prototype = new google.maps.OverlayView();
    USGSOverlay.prototype.onAdd = function () {
        var div = document.createElement('div');
        div.style.borderStyle = 'none';
        div.style.borderWidth = '0px';
        div.style.position = 'absolute';
        var img = document.createElement('img');
        img.src = this.image_;
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.position = 'absolute';
        div.appendChild(img);
        this.div_ = div;
        var panes = this.getPanes();
        panes.overlayLayer.appendChild(div);
    };

    USGSOverlay.prototype.draw = function () {
        var overlayProjection = this.getProjection();
        var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
        var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());
        var div = this.div_;
        div.style.left = sw.x + 'px';
        div.style.top = ne.y + 'px';
        div.style.width = (ne.x - sw.x) + 'px';
        div.style.height = (sw.y - ne.y) + 'px';
    };
    USGSOverlay.prototype.onRemove = function () {
        this.div_.parentNode.removeChild(this.div_);
        this.div_ = null;
    };
    loadMap();
}