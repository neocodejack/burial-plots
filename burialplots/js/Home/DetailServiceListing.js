$(document).ready(function () {
    
    //initMap();
   

});

function initMap() {

    var latitude = $("#hIdLatitudeLnk").val();
    var longitude = $("#hIdLongitudeLnk").val();
    var latt = parseFloat(latitude);
    var long = parseFloat(longitude);
    var myLatLng = { lat: latt, lng: long };

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 10,
        center: myLatLng
    });

    var marker = new google.maps.Marker({
        position: myLatLng,
        map: map,
        title: 'Hello World!'
    });
}
var Review = function (id, MemberId) {

    var Description = $("#ReviewDescription").val();
    if (Description == "" || Description==null ) {
        $("#ReviewDescription").css("border", "2px solid red");
        return false;
    }
    $.ajax({

        url: "/Home/SubmitReview",
        type: "post",
        data: { MemberId: MemberId, Description: Description, Id: id },
        success: function (res) {
            if (res=="true") {
                AutoLoader("Your review has been successfully submitted, Thank you!", "success");
                window.location.reload();
            }
        },
        error: function () {
            AutoLoader("Error","error");
        }
    });
}
