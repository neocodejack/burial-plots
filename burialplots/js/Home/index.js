$(document).ready(function () {
$("#myCarousel").carousel({ interval: 6000 });
    $('.owl-carousel.latest-news').owlCarousel({
        loop: true,
        margin: 10,
        dots: true,
        items: 1,
    });
});

var searchByPostCodeApi = function () {
    var postCode = $("#txtPostCode").val();
    //var miles = $("#drpDistance").val();
    var religion = $("#drpReligion").val();
    window.location.href = "/Home/SearchbyPostCodeApi?postcode=" + postCode + "&religion=" + religion;
}