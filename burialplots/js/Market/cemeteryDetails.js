jQuery(document).ready(function ($) {
    var sync1 = $("#sync1");
    var sync2 = $("#sync2");
    var slidesPerPage = 3; //globaly define number of elements per page
    var syncedSecondary = false;

    sync1.owlCarousel({
        items: 1,
        slideSpeed: 2000,
        nav: false,
        autoplay: false,
        dots: false,
        loop: true,
        responsiveRefreshRate: 200,
        navText: ['<svg width="100%" height="100%" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>', '<svg width="100%" height="100%" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>'],
    }).on('changed.owl.carousel', syncPosition);

    sync2
      .on('initialized.owl.carousel', function () {
          sync2.find(".owl-item").eq(0).addClass("current");
      })
      .owlCarousel({
          items: slidesPerPage,
          dots: false,
          nav: false,
          margin: 10,
          smartSpeed: 200,
          slideSpeed: 500,
          slideBy: slidesPerPage, //alternatively you can slide by 1, this way the active slide will stick to the first item in the second carousel
          responsiveRefreshRate: 100
      }).on('changed.owl.carousel', syncPosition2);

    function syncPosition(el) {
        //if you set loop to false, you have to restore this next line
        //var current = el.item.index;

        //if you disable loop you have to comment this block
        var count = el.item.count - 1;
        var current = Math.round(el.item.index - (el.item.count / 2) - .5);

        if (current < 0) {
            current = count;
        }
        if (current > count) {
            current = 0;
        }

        //end block

        sync2
          .find(".owl-item")
          .removeClass("current")
          .eq(current)
          .addClass("current");
        var onscreen = sync2.find('.owl-item.active').length - 1;
        var start = sync2.find('.owl-item.active').first().index();
        var end = sync2.find('.owl-item.active').last().index();

        if (current > end) {
            sync2.data('owl.carousel').to(current, 100, true);
        }
        if (current < start) {
            sync2.data('owl.carousel').to(current - onscreen, 100, true);
        }
    }

    function syncPosition2(el) {
        if (syncedSecondary) {
            var number = el.item.index;
            sync1.data('owl.carousel').to(number, 100, true);
        }
    }

    sync2.on("click", ".owl-item", function (e) {
        e.preventDefault();
        var number = $(this).index();
        sync1.data('owl.carousel').to(number, 300, true);
    });
});
var geocoder;
var map;
function initialize() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(51.509865, -0.118092);
    var mapOptions = {
        zoom: 14,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    if ($("#hidLocation").val() != "") {
        codeAddress($("#hidLocation").val());
    }
}

function codeAddress(location) {
    geocoder.geocode({ 'address': location }, function (results, status) {
        if (status == 'OK') {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            // map.setCenter(marker.getPosition());
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}


var FormEnquiry = function () {

    var fName = $("#fName").val();
    var lName = $("#lName").val();
    var date = $("#DOB").val();
    var Email = $("#Email").val();
    var Telephone = $("#Telephone").val();
    if (fName == "" || fName == null) {
        $("#fName").css("border", "2px solid red");
        return;
    }
    else {
        $("#fName").css("border", "");
    }
    if (lName == "" || lName == null) {
        $("#lName").css("border", "2px solid red");
        return;
    }
    else {
        $("#lName").css("border", "");
    }
    if (date == "" || date == null) {
        $("#DOB").css("border", "2px solid red");
        return;
    }
    else {
        $("#DOB").css("border", "");
    }
    if (Email == "" || Email == null) {
        $("#Email").css("border", "2px solid red");
        return;
    }

    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test(Email)) {
        $("#Email").css("border", "2px solid red");
        return;
    } else {

        $("#Email").css("border", "");

    }




    if (Telephone == "" || Telephone == null) {
        $("#Telephone").css("border", "2px solid red");
        return;
    }
    else {
        $("#Telephone").css("border", "");
    }

    var Catholic = $("#Catholic").val();
    var Christian = $("#Christian").val();
    var Jewish = $("#Jewish").val();
    var Buddhism = $("#Buddhism").val();
    var Hinduism = $("#Hinduism").val();
    var Gnosticism = $("#Gnosticism").val();
    var Other = $("#Other").val();

    var Email = $("#Email").val();
    var Telephone = $("#Telephone").val();

    var Address = $("#Address").val();
    var Avalon = $("#Avalon").val();
    var Dignity = $("#Dignity").val();
    var Golden = $("#Golden").val();
    var from = $("#from").val();
    var gLeaves = $("#gLeaves").val();
    var CoOperative = $("#CoOperative").val();
    var None = $("#None").val();

    var cemeteryInterested = $("#cemeteryInterested").val();


    var plot2 = $("#plot2").val();
    var plot4 = $("#plot4").val();
    var plot6 = $("#plot6").val();
    var plotMore = $("#plotMore").val();

    if ($("#Muslim").is(':checked')) {
        var Muslim = $("#Muslim").val();
    }
    else {
        Muslim = "";
    }
    if ($("#Catholic").is(':checked')) {
        var Catholic = $("#Catholic").val();
    }
    else {
        Catholic = "";
    }
    if ($("#Christian").is(':checked')) {
        var Christian = $("#Christian").val();
    }
    else {
        Christian = "";
    }
    if ($("#Jewish").is(':checked')) {
        var Jewish = $("#Jewish").val();
    }
    else {
        Jewish = "";
    }
    if ($("#Buddhism").is(':checked')) {
        var Buddhism = $("#Buddhism").val();
    }
    else {
        Buddhism = "";
    }
    if ($("#Hinduism").is(':checked')) {
        var Hinduism = $("#Hinduism").val();
    }
    else {
        Hinduism = "";
    }
    if ($("#Gnosticism").is(':checked')) {
        var Gnosticism = $("#Gnosticism").val();
    }
    else {
        Gnosticism = "";
    }
    if ($("#Other").is(':checked')) {
        var Other = $("#Other").val();
    }
    else {
        Other = "";
    }

    if ($("#Avalon").is(':checked')) {
        var Avalon = $("#Avalon").val();
    }
    else {
        Avalon = "";
    }

    if ($("#Dignity").is(':checked')) {
        var Dignity = $("#Dignity").val();
    }
    else {
        Dignity = "";
    }

    if ($("#Golden").is(':checked')) {
        var Golden = $("#Golden").val();
    }
    else {
        Golden = "";
    }

    if ($("#from").is(':checked')) {
        var from = $("#from").val();
    }
    else {
        from = "";
    }

    if ($("#gLeaves").is(':checked')) {
        var gLeaves = $("#gLeaves").val();
    }
    else {
        gLeaves = "";
    }
    if ($("#CoOperative").is(':checked')) {
        var CoOperative = $("#CoOperative").val();
    }
    else {
        CoOperative = "";
    }
    if ($("#None").is(':checked')) {
        var None = $("#None").val();
    }
    else {
        None = "";
    }
    if ($("#plot2").is(':checked')) {
        var plot2 = $("#plot2").val();
    }
    else {
        plot2 = "";
    }
    if ($("#plot4").is(':checked')) {
        var plot4 = $("#plot4").val();
    }
    else {
        plot4 = "";
    }

    if ($("#plot6").is(':checked')) {
        var plot6 = $("#plot6").val();
    }
    else {
        plot6 = "";
    }

    if ($("#plotMore").is(':checked')) {
        var plotMore = $("#plotMore").val();
    }
    else {
        plotMore = "";
    }

    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Market/EnquiryForm",
        data: { fName: fName, lName: lName, date: date, Muslim: Muslim, Catholic: Catholic, Christian: Christian, Jewish: Jewish, Buddhism: Buddhism, Hinduism: Hinduism, Gnosticism: Gnosticism, Other: Other, Email: Email, Telephone: Telephone, Avalon: Avalon, Dignity: Dignity, Golden: Golden, from: from, gLeaves: gLeaves, CoOperative: CoOperative, None: None, cemeteryInterested: cemeteryInterested, plot2: plot2, plot4: plot4, plot6: plot6, plotMore: plotMore, Address: Address },
        type: "post",
        success: function (res) {
            if (res == "true") {
                hideLoader();
                $(".radio1").each(function () {
                    $(this).val("");
                    $('.radio').attr('checked', false);

                });
                $("#enquiry-form").hide();

                setTimeout(function () {
                    $(".sweet-alert").css("width", "70%");
                    $(".sweet-alert").css("margin-left", "-482px");
                    swal('Submitted!', "Thank you! \n Your inquiry has been sent. Our representative will respond you within 24 Hours.", 'success');
                }, 1000);
            }

        },
        error: function () {
            AutoLoader("Error", "error");
        }
    });
}