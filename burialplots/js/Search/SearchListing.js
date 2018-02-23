$(document).ready(function () {
    $("#loadMore").hide();
    autoCompleteService();
    autoCompleteService1();
    CheckCount();
    //var id = $('hidId').val();
    $('#showId').html();
    //loadServiceListing();
    //GetLangLong();
});
var autoCompleteService = function () {
    $("#txtServiceName").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/Home/GetServicesList",
                type: "POST",
                dataType: "json",
                data: { Prefix: request.term },
                success: function (data) {
                    response($.map(data, function (item) {
                        return { label: item.Name, value: item.Name };
                    }))
                }
            })
        },
        messages: {
            noResults: "", results: ""
        }
    });
}
var autoCompleteService1 = function () {
    $("#txtPostCodeTown").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/Search/GetAddressList",
                type: "POST",
                dataType: "json",
                data: { Prefix: request.term },
                success: function (data) {
                    response($.map(data, function (item) {
                        return { label: item.Name, value: item.Name };
                    }))
                }
            })
        },
        messages: {
            noResults: "", results: ""
        }
    });
}
var CheckCount = function () {
    var totalCount = $("#hIdTotalServiceCount").val();
    var serviceCount = $("#hIdServiceCount").val();
    var totalCount = parseInt(totalCount);
    var serviceCount = parseInt(serviceCount);
    //alert(totalCount + ' ' + serviceCount);
    if (serviceCount < totalCount) {
        $("#loadMore").show();

    }

}
$("#loadMore").click(function () {
    var FId = $("#hIdFuneralId").val();
    var TownName = $("#hIdTownName").val();
    var PostCode = $("#hIdPostCode").val();
    var CountyName = $("#hIdCountyName").val();
    var CountryName = $("#hIdCountryName").val();
    var serviceCount = $("#hIdServiceCount").val();
    var totalCount = parseInt($("#hIdTotalServiceCount").val());
    //var checkServiceCount = parseInt($("#hIdCheckServiceCount").val());

    $.ajax({
        url: "/Home/LoadService",
        type: "post",
        data: { serviceCount: serviceCount, FId: FId, TownName: TownName, PostCode: PostCode, CountyName: CountyName, CountryName: CountryName },
        success: function (res) {
            $("#LoadServiceList").show();
            $("#LoadServiceList").html(res);
            $("#showLess").show();
            var checkServiceCount = parseInt($("#hIdCheckServiceCount").val());
            //alert(totalCount + ' ' + checkServiceCount);
            if (checkServiceCount >= totalCount) {
                //alert("hide");
                $("#loadMore").hide();
                var checkServiceCount = $("#hIdCheckServiceCount").val("");
                return;
            }
        },
        error: function () {
            AutoLoader("Error", "error");
        }
    })

});
$("#showLess").click(function () {

    $("#LoadServiceList").hide();
    $("#loadMore").show();
    $('html, body').animate({
        scrollTop: $("#customMap").offset().top
    }, 2000);
    $("#showLess").hide();
});
var loadServiceListing = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Home/LoadServiceListing",
        type: "post",
        success: function (res) {
            $("#divLoadServiceListing").html(res);
            hideLoader();
        }
    });
}

var GetLangLong = function () {
    var FId = $("#hIdFuneralId").val();
    var TownName = $("#hIdTownName").val();
    var PostCode = $("#hIdPostCode").val();
    var CountyName = $("#hIdCountyName").val();
    var CountryName = $("#hIdCountryName").val();
    $.ajax({
        url: "/Home/GetLangLongitude",
        type: "get",
        data: { FId: FId, TownName: TownName, PostCode: PostCode, CountyName: CountyName, CountryName: CountryName },
        success: function (res) {

            var data = JSON.parse(res);
            initMap(data);
        },
        error: function () {
            AutoLoader("Error", "error");
        }

    });

}
function initMap(coordinates) {
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };
    // Get Coordinates
    // Display a map on the web page
    map = new google.maps.Map(document.getElementById("customMap"), mapOptions);
    map.setTilt(50);
    var markers = []
    for (var i = 0; i < coordinates.length; i++) {
        var obj = [coordinates[i].BusinessName, coordinates[i].Latitude, coordinates[i].Longitude];
        markers.push(obj);
    }

    // Place each marker on the map  
    for (i = 0; i < markers.length; i++) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });

        // Center the map to fit all markers on the screen
        map.fitBounds(bounds);
    }

    // Set zoom level
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function (event) {
        this.setZoom(2);
        google.maps.event.removeListener(boundsListener);
    });

}
