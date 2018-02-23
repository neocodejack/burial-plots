$(document).ready(function () {

     //loadModal();
    //document.onkeyup = closeLoadingModalByESC;
    loadCemetery();
    filteration(1);
    datepicker();
});
document.addEventListener('keyup', function (e) {
    if (e.keyCode == 27) {
        var modal = document.getElementById('enquiry-form');
        modal.style.display = "none";
    }
    
});
var datepicker = function () {
    $(".datepicker").datepicker();
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
    else{
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
               
                $(".sweet-alert").css("width", "70%");
                $(".sweet-alert").css("margin-left", "-482px");
                swal('Submitted!', "Thank you! \n Your inquiry has been sent. Our representative will respond you within 24 Hours.", 'success');
            }

        },
        error: function () {
            AutoLoader("Error","error");
        }
    });
}
var loadModal = function () {
    var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

    $('a[data-modal-id]').click(function (e) {
        e.preventDefault();
        $("body").append(appendthis);
        $(".modal-overlay").fadeTo(500, 0.9);
        //$(".js-modalbox").fadeIn(500);
        var modalBox = $(this).attr('data-modal-id');
        $('#' + modalBox).fadeIn($(this).data());
    });


    $(".js-modal-close, .modal-overlay").click(function () {
        $(".modal-box, .modal-overlay, .modal").fadeOut(500, function () {
            $(".modal-overlay").remove();
        });

    });

    $(window).resize(function () {
        $(".modal-box").css({
            top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
            left: ($(window).width() - $(".modal-box").outerWidth()) / 2
        });
    });

    $(window).resize();
}


var sectionId = "";
var cemeteryName = "";
var loadCemetery = function () {
    showSpinner();
    var id = $("#hidId").val();
    $.ajax({
        url: "/Market/LoadCemetery",
        data: { id: id },
        type: "post",
        async: false,
        success: function (res) {
            //hideLoader();
            var data = JSON.parse(res);
            obj = JSON.parse(data.Code.replace(/\\/g, '').slice(1, -1));
            cemeteryName = data.Name;
            $('#image-map-pro-container').imageMapPro(obj);
            $(window).bind("load", function () {
                setTimeout(function () {
                    hideSpinner();
                    $.each(obj.spots, function (index, val) {
                        var spotid = val.id;
                        var cemeteryId = $("#hidId").val();
                        ////////////
                        $("#" + spotid).on("click", function () {
                            ////////////////
                            showSpinner();
                            $.ajax({
                                url: "/Market/GetSectionId",
                                data: { spotId: spotid, cemeteryId: cemeteryId },
                                type: "post",
                                async: false,
                                success: function (res) {
                                    $("#drpSection").val(res);
                                    $("#drpReligion").val("");
                                    $("#drpSubReligion").val("");
                                },
                                error: function () {

                                }
                            });
                            filteration(1);
                            //showLoader("Please wait..", "info");
                            $.ajax({
                                url: "/Market/loadSection",
                                data: { spotId: spotid, cemeteryId: cemeteryId },
                                type: "post",
                                async: false,
                                success: function (responce) {

                                    hideLoader();
                                    var scale = parseInt($('#divCemetery').css('font-size'), 10);
                                    var nScale = scale + 5;
                                    $('#divCemetery').stop(true, true).animate({ fontSize: nScale }, {
                                        step: function (now, fx) {
                                            $(this).css('transform', 'scale(' + parseFloat(now / 10) + ')');
                                        },
                                        duration: 500
                                    }, 'linear');
                                    if (responce == "false") {
                                        hideSpinner();
                                        AutoLoader("Something went wrong", "error");
                                        return;
                                    }
                                    var data2 = JSON.parse(responce.sections);
                                    var graveIds = JSON.parse(responce.graveSpots);
                                    sectionId = data2.SectionId;
                                    filteration(1);
                                    obj = JSON.parse(data2.Code.replace(/\\/g, '').slice(1, -1));
                                    var tempSpots = obj.spots;
                                    for (var i = 0; i < graveIds.length; i++) {
                                        for (var j = 0; j < obj.spots.length; j++) {
                                            if (obj.spots[j].id == graveIds[i]) {
                                                tempSpots.splice(j, 1);
                                               // break;
                                            }
                                        }
                                    }
                                    obj.spots = tempSpots;
                                    setTimeout(function () {
                                        $("#hdSection").html("<a href='#' onclick='cancelLoadSection()'>" + cemeteryName + "</a> / " + data2.Name);
                                        $('#divLoadSection').imageMapPro(obj);
                                        $("#divCemetery").fadeOut(300);
                                        $("#divSection").fadeIn(1000);
                                        setTimeout(function () {
                                            hideSpinner();
                                            $.each(obj.spots, function (index, val) {
                                                var sectionSpot = val.id;
                                                $("#" + sectionSpot).on("click", function () {
                                                    tempSectionId = data2.Id;
                                                    tempSectionSpotId = sectionSpot;
                                                    //showLoader("Please wait..", "info");
                                                    showSpinner();
                                                    $.ajax({
                                                        url: "/Market/GetGraveDetails",
                                                        data: { spotId: sectionSpot, sectionId: data2.Id },
                                                        type: "post",
                                                        success: function (res) {
                                                            hideLoader();
                                                            hideSpinner();
                                                            $("#divLoadGravesDetails").html(res);
                                                            $("#graveDetailModal").modal();
                                                            loadModal();
                                                            $.ajax({
                                                                url: "/Market/BillingInfoCheck",
                                                                type: "post",
                                                                success: function (res) {
                                                                    if (res == "empty") {
                                                                        $("#proceed").css("background-color", "lightgray");
                                                                    }

                                                                }

                                                            });
                                                            document.addEventListener('keyup', function (e) {
                                                                if (e.keyCode == 27) {
                                                                    var modal = document.getElementById('graveDetailModal');
                                                                    modal.style.display = "none";
                                                                }
                                                                window.location.reload();
                                                            });
                                                        },
                                                        error: function () {
                                                            hideSpinner();
                                                            AutoLoader("No information is available", "info");
                                                        }
                                                    });
                                                });
                                            });
                                        }, 6000);
                                    }, 300);

                                },
                                error: function () {
                                    hideSpinner();
                                    AutoLoader("No information is available", "info");
                                }
                            });
                        });

                    });
                }, 1000);
            });

        }
    });
}
var cancelLoadSection = function () {
    sectionId = "";
    filteration(1);
    $("#hdSection").html(cemeteryName);
    $("#divSection").hide();
    $("#divCemetery").fadeIn(1000);
    var scale = parseInt($('#divCemetery').css('font-size'), 10);
    var nScale = scale - 5;
    $('#divCemetery').stop(true, true).animate({ fontSize: nScale }, {
        step: function (now, fx) {
            $(this).css('transform', 'scale(' + parseFloat(now / 10) + ')');
        },
        duration: 300
    }, 'linear');
}
var loadSect = function () {
    showLoader("Please wait..", "info");
    var religionId = $("#drpReligion").val();
    $.ajax({
        url: "/Market/LoadSubReligions",
        type: "post",
        data: { religionId: religionId },
        success: function (res) {
            $("#drpSubReligion").html(res);
            hideLoader();
        }
    });
}
var filteration = function (pageSize) {
    var cemeteryId = $("#hidId").val();
    var religionId = $("#drpReligion").val();
    var sectId = $("#drpSubReligion").val();
    $.ajax({
        url: "/Market/Filteration",
        data: {
            cemeteryId: cemeteryId, sectionId: $("#drpSection").val(), pageSize: pageSize,
            religionId: religionId, sectSubId: sectId
        },
        type: "post",
        success: function (res) {
            $("#divLoadCemeteries").html(res);
            loadModal();
        }
    });
}

var zoomIn = function () {

}
var PreviousPage = function () {
    var pageSize = $("#hIdPageSize").val();
    if (pageSize == null || pageSize == "" || pageSize == 1) {
        filteration(1);
    }
    else {
        filteration(pageSize - 1);
    }
}
var NextPage = function () {

    var pageSize = $("#hIdPageSize").val();
    var pageNumber = parseInt(pageSize);
    pageNumber = pageNumber + 1;
    var pageCount = $("#hIdNextPage").val();
    filteration(pageNumber);
}



var addtoCartModal = function (id) {
    
    var layerId = $("#drpLayerModal").val();
    if (layerId == "") {
        AutoLoader("Please select Internement", "info");
        return;
    }
    else {

    $("#proceed").removeClass("background-color");
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/AddtoCart",
            type: "post",
            data: { id: id, layerId: layerId },
            success: function (res) {
                $("#cartCount").text(res);
                showLoader("<p>Added to cart successfully", "success");
                setTimeout(function () {
                    hideLoader();
                }, 4000);
                ExternallyLoadGraveDetails();
                filteration(1);
            }
        });
    }
}
var tempSectionId;
var tempSectionSpotId;
var ExternallyLoadGraveDetails = function () {
    $.ajax({
        url: "/Market/GetGraveDetails",
        data: { spotId: tempSectionSpotId, sectionId: tempSectionId },
        type: "post",
        success: function (res) {
            $("#divLoadGravesDetails").html(res);
        }
    });
}

var addToCartFiltration = function (id) {
    var layerId = $("#drpLayerr_" + id).val();
    if (layerId == "") {
        AutoLoader("Please Select Internement", "info");
        return;
    }
    else {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/AddtoCart",
            type: "post",
            data: { id: id, layerId: layerId },
            success: function (res) {
                $("#cartCount").text(res);
                showLoader("<p>Added to cart Successfully </p><a href='#' onclick='gotoCheckout()' class='btn btn-primary'>Checkout</a>", "success");
                setTimeout(function () {
                    hideLoader();
                }, 4000);
                filteration(1);
            }
        });
    }
}

var removeFromCart = function (id) {

    if (confirm("Are you sure you want to remove this item from cart")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Market/RemoveFromCart",
            type: "post",
            data: { id: id },
            success: function (res) {

                $("#cartCount").text(res);
                showLoader("<p>Remove from cart successfully</p>", "success");
                setTimeout(function () {
                    hideLoader();
                }, 4000);
                filteration(1);
                ExternallyLoadGraveDetails();
                $.ajax({
                    url: "/Market/BillingInfoCheck",
                    type: "post",
                    success: function (res) {
                        if (res == "empty") {

                            $("#proceed").css("background-color", "lightgray");
                        }

                    }

                });
            }
        });
    }
}

var showSpinner = function () {
    $.loadingBlockShow({
        imgPath: '/css/icon.gif',
        imgStyle: {
            width: 'auto',
            textAlign: 'center',
            marginTop: '20%'
        },
        text: "Loading Map..."
    });
}
var hideSpinner = function () {
    $.loadingBlockHide();
}

var gotoCheckout = function () {
    showLoader("Checking Out..", "info");
    $.ajax({
        url: "/Market/BillingInfoCheck",
        type: "post",
        success: function (res) {
            if (res == "true") {
                //window.location.href = "/Market/Checkout";
                window.location.href = "/Checkout/Index";
            }
            else {

                AutoLoader("Your cart is empty,  First choose Internement", "error");
            }

        }

    });
}

var closeLoadingModalByESC = function (e) {
    if (e.keyCode == 27) {
        hideSpinner();
    }
}

var closeGraveDetailModal = function () {
    $("#graveDetailModal").modal('hide');
}

var getGraveDetails = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Market/GetGraveDetailsById",
        type: "post",
        data: {id: id},
        success: function (res) {
            $("#divLoadGravesDetails").html(res);
            $("#graveDetailModal").modal();
            hideLoader();
        }
    });
}