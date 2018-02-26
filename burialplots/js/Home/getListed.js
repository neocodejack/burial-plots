$(document).ready(function () {
    $("#divProgress-bar").css("display", "block");
   // autoCompleteService();
    $("#txtBusinessClass").select2();
    $(".select2").css("width", "100%");
    $("#hlocationId").hide();
    $(".activePaymentMethods").select2();
});
var showLocation = function () {
     $("#hlocationId").show();
     $("#txtNumber").val("");
     $("#txtAddress1").val("");
     $("#txtTown").val("");
     $("#txtCounty").val("");
     $("#txtCountry").val("");
}
var continueFromLocationClick = function () {
    var number = $("#txtNumber").val();
    var Address1 = $("#txtAddress1").val();
    var Town = $("#txtTown").val();
    var County = $("#txtCounty").val();
    var Country = $("#txtCountry").val();
    var PostCode = $("#txtPostCode").val();

    $('html, body').animate({
        scrollTop: $("#divContactSection").offset().top
    }, 2000);
}
var changeProgress = function () {
    $("#txtBusinessName").css("border", "2px solid #B6BCC8");
    $("#txtPostCode").css("border", "2px solid #B6BCC8");
    $("#drpAddress").css("border", "2px solid #B6BCC8");
    $("#txtBusinessClass").css("border", "2px solid #B6BCC8");
    $("#txtPhoneNumber").css("border", "2px solid #B6BCC8");
    $("#txtWebsite").css("border", "2px solid #B6BCC8");
    var progress = 0;
    var businessName = $("#txtBusinessName").val();
    var postCode = $("#txtPostCode").val();
    var address = $("#drpAddress").val();
    var phNo = $("#txtPhoneNumber").val();
    var webSite = $("#txtWebsite").val();
    var businessClass = $("#txtBusinessClass").val();
    if (businessName == "" || postCode == "") {
        if (progress > 5) {
            progress = progress - 25;
        }
    }
    else {
        progress = progress + 25;
    }
    if (address == "") {
        if (progress > 25) {
            progress = progress - 25;
        }
    }
    else {
        progress = progress + 25;
    }

    if (phNo == "") {
        if (progress > 50) {
            progress = progress - 25;
        }
    }
    else {
        progress = progress + 25;
    }

    if (businessClass == "") {
        if (progress > 75) {
            progress = progress - 25;
        }
    }
    else {
        progress = progress + 25;
    }

    $(".progress-bar").css("width", progress + "%");
}

// Dro down change Event Fire
$("#drpAddress").change(function () {
    var postcode = $("#txtPostCode").val();
    var value = $('#drpAddress').val();
    var array = value.split(',');
    $("#txtNumber").val(array[0].split(' ')[0]);
    $("#txtAddress1").val(array[0]);
    $("#txtCounty").val(array[2].split(' ')[1]);
    $("#txtTown").val(array[1]); 
    //$("#txtPostCode1").val(array[2].split(' ')[1]);
    $("#txtPostCode1").val(array[2].split(' ')[2]);
    $("#txtCountry").val("UK");
    // Pure JS
    $("#showLocationForm").hide();
    $("#hlocationId").show();
});

var ContinueFromBusinessDetail = function () {
    var businessName = $("#txtBusinessName").val();
    var postCode = $("#txtPostCode").val();
    var link=$("#hidGetPostCodeServicesUrl").val();
    if (postCode != null) {

        $.ajax({
            type: "Post",
            url: link,
            data: { postCode: postCode },
            success: function (result) {
                var res = JSON.parse(result);
                var content= "<option value=''>"+res.Addresses.length+" possible matches</option>"
                for (var i = 0; i < res.Addresses.length; i++) {
                    var address = res.Addresses[i].replace(", , , , ,", ",");
                    content += "<option value='" + address + " " + postCode + "'>" + address + " " + postCode + "</option>";
                }
                $('#hIdLatitudeVal').val(res.Latitude);
                $('#hIdLongitudeVAl').val(res.Longitude);
              
                //alert(res.Latitude);
                $("#drpAddress").html(content);
                //var value=res.result.admin_district + " " + res.result.admin_county + " " + res.result.country + " " + postCode;
                //var x = document.getElementById("drpAddress");
                //var option = document.createElement("option");
                //option.text = option.value =value;
                //x.add(option);
          

                //$("#txtAddress1").val(res.result.admin_district + "," + res.result.admin_county + "," + postCode);
                //$("#txtTown").val(res.result.admin_district);
                //$("#txtCounty").val(res.result.admin_county);
                //$("#txtCountry").val(res.result.country);
                //$("#txtPostCode").val(postCode);
                
            },
            error: function () {
                AutoLoader("Error","error");
            }

        })



    }
    var postCode = $("#txtPostCode").val();
    if (businessName == "" && postCode == "") {
        $("#txtBusinessName").css("border", "2px solid red");
        $("#txtPostCode").css("border", "2px solid red");
        return;
    }
    else if (businessName == "") {
        $("#txtBusinessName").css("border", "2px solid red");
        return;
    }
    else if (postCode == "") {
        $("#txtPostCode").css("border", "2px solid red");
        return;
    }
    $("#divAllSections").slideDown();
    $('html, body').animate({
        scrollTop: $("#divAllSections").offset().top
    }, 2000);
}

var continueFromAddressClick = function () {
    var address = $("#drpAddress").val();
    if (address == "") {
        $("#drpAddress").css("border", "2px solid red");
        return;
    }
    $('html, body').animate({
        scrollTop: $("#divContactSection").offset().top
    }, 2000);
}

var continueFromCustomerContact = function () {
    var phNo = $("#txtPhoneNumber").val();
    var webSite = $("#txtWebsite").val();
    if (phNo == "" && webSite == "") {
        $("#txtPhoneNumber").css("border", "2px solid red");
        $("#txtWebsite").css("border", "2px solid red");
        return;
    }
    else if (phNo == "") {
        $("#txtPhoneNumber").css("border", "2px solid red");
        return;
    }
    $("#divYourBusinessSection").show();
    $('html, body').animate({
        scrollTop: $("#divYourBusinessSection").offset().top
    }, 2000);
}

var saveServiceListing = function () {
    $("#divErrorMessage").slideUp();
    var err = 0;
    $(".mytext-field").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "2px solid red");
            err = err + 1;
        }
    });
    if (err == 0) {
        var businessName = $("#txtBusinessName").val();
        var postCode = $("#txtPostCode").val();
        var address = $("#drpAddress").val();
        var phNo = $("#txtPhoneNumber").val();
        var website = $("#txtWebsite").val();
        var businessClass = $("#txtBusinessClass").val();
        var link = $("#hidSaveServiceListUrl").val();

        var number = $("#txtNumber").val();
        var Address1 = $("#txtAddress1").val();
        var Town = $("#txtTown").val();
        var County = $("#txtCounty").val();
        var Country = $("#txtCountry").val();
        var adress2 = $("#txtAddess2").val();
        var Latitude = $("#hIdLatitudeVal").val();
        var Longitude = $("#hIdLongitudeVAl").val();
        var description = $("#txtDescription").val();
        var productServices = $("#txtProductServices").val();
        var facebook = $("#txtFacebook").val();
        var twitter = $("#txtTwitter").val();
        var google = $("#txtGoogle").val();
        var PaymentGateways = $("#paymentGateways").val();
        if (PaymentGateways !== null) {
            PaymentGateways = PaymentGateways.toString();
        }
        else {
            PaymentGateways = "";
        }
        var planIds = [];
        $(".divPlanRow").each(function (index, elem) {
            var county = $(elem).find(".drpCounties").val();
            var business = $(elem).find(".txtBusinessClass").val();
            var plan = $(elem).find(".txtPlans").val();
            var planArr = plan.split("|");
            if (plan != "" && business != "" && plan != "") {
                planIds.push({ county: county, business: business, plan: planArr[0] });
            }
        });
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Users/GetTotalPlansAmount",
            type: "post",
            data: { planIds: JSON.stringify(planIds) },
            success: function (res) {
                if (res == "false") {
                    AutoLoader("This combination is already purchased, Please select another plan", "info");
                    return;
                }
                else {
                    $("#spnTotal").text("Total Amount: £" + res);
                    hideLoader();
                    if (planIds.length == 0) {
                        AutoLoader("Please select Plans first", "info");
                        return;
                    }
                    showLoader("Please wait..", "info");
                    $.ajax({
                        url: link,
                        type: "post",
                        data: {
                            businessName: businessName, postCode: postCode, address: address, phNo: phNo, website: website,
                            businessClass: businessClass, number: number, Address1: Address1, Town: Town, County: County, Country: Country,
                            adress2: adress2, Latitude: Latitude, Longitude: Longitude, planIds: JSON.stringify(planIds), TwitterLink: twitter,
                            GooglePlusLink: google, FacebookLink: facebook, BusinessDescription: description, ServicesAndProducts: productServices,
                            PaymentGateways: PaymentGateways
                        },
                        success: function (res) {
                            if (res == "true") {
                                AutoLoader("Proceeding for payment", "success");
                                setTimeout(function () {
                                    window.location.href = "/Admin/Checkouts/Index";
                                }, 1000);
                                //hideLoader();
                                //$(".sweet-alert").css("width", "70%");
                                //$(".sweet-alert").css("margin-left", "-482px");
                                //swal('Submitted!', "Thank you for listing your business. Our representative will contact you within 24 hours.", 'success');
                                //$(".mytext-field").each(function () {
                                //    $(this).val("");

                                //});
                                //$("#txtWebsite").val("");
                                //$("#divAllSections").slideUp();
                                //$("#divAllSections").css("display", "none");
                                //$('html, body').animate({
                                //    scrollTop: $("#businessDiv").offset().top
                                //}, 2000);
                                //$(".progress-bar").css("width", "2%");
                            }
                            else if(res == "add") {
                                AutoLoader("Service List added Successfully", "success");
                                setTimeout(function () {
                                    window.location.href = "/Admin/Users/MyListings";
                                }, 1000);
                            }
                            else {
                                showLoader("Error", "error");
                                setTimeout(function () {
                                    hideLoader();
                                }, 3000);
                            }
                        },
                        error: function () {
                            showLoader("Error", "error");
                            setTimeout(function () {
                                hideLoader();
                            }, 3000);
                        }
                    });
                }
            }
        });
    }
    else {
        $("#divErrorMessage").slideDown();
    }
}

var autoCompleteService = function () {
    $("#txtBusinessClass").autocomplete({
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

var showProductServiceDiv = function () {
    if ($("#divProductServices").is(":hidden")) {
        $("#divProductServices").slideDown();
    }
    else {
        
        $("#divProductServices").slideUp();
    }
}

var showSocialMediaDiv = function () {
    if ($("#divSocialMedia").is(":hidden")) {
        $("#divSocialMedia").slideDown();
    }
    else {
        
        $("#divSocialMedia").slideUp();
    }
}

var rowID = 1;
var addBusinessPlanRow = function () {
    var f = false;
    $(".divPlanRow").each(function (index, elem) {
        var county = $(elem).find(".drpCounties").val();
        var business = $(elem).find(".txtBusinessClass").val();
        var plan = $(elem).find(".txtPlans").val();
        if (county == "" || business == "" || plan == "") {
            AutoLoader("First complete last row", "info");
            f = true;
        }
    });
    if (f) {
        return;
    }
    var html = $("#tmplBusinessClassification").html();
    var tmpl = _.template(html);
    var value = { Id: rowID };
    var tpl = tmpl(value);
    $("#divBusinessPlans").append(tpl);
    rowID++;
}

var removeBusinessPlanRow = function (id) {
    $("#divPlanRow_" + id).remove();
    getTotalAmount();
}

var checkConflictPlan = function () {
    var plans = [{ county: "0", business: "0", plan: "0" }];
    $(".divPlanRow").each(function (index, elem) {
        var county = $(elem).find(".drpCounties").val();
        var business = $(elem).find(".txtBusinessClass").val();
        var plan = $(elem).find(".txtPlans").val();
        var planArr = plan.split("|");
        var f = false;
        for (var i = 0; i < plans.length; i++) {
            if (planArr[1] != "") {
                if (county == plans[i].county && business == plans[i].business && planArr[0] == plans[i].plan) {
                    f = true;
                    $(elem).find(".spnPlanError").text("You have already selected this plan");
                    $(elem).find(".txtPlans").val("");
                    setTimeout(function () {
                        $(elem).find(".spnPlanError").text("");
                    }, 3000);
                    break;
                }
            }
        }
        if (f == false) {
            plans.push({ county: county, business: business, plan: planArr[0] });
        }
    });
    getTotalAmount();
}

var getTotalAmount = function () {
    var planIds = [];
    $(".divPlanRow").each(function (index, elem) {
        var county = $(elem).find(".drpCounties").val();
        var business = $(elem).find(".txtBusinessClass").val();
        var plan = $(elem).find(".txtPlans").val();
        var planArr = plan.split("|");
        if (plan != "" && business != "" && plan != "") {
            planIds.push({ county: county, business: business, plan: planArr[0] });
        }
    });
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Users/GetTotalPlansAmount",
        type: "post",
        data: { planIds: JSON.stringify(planIds) },
        success: function (res) {
            if (res == "false") {
                AutoLoader("This combination is already purchased", "info");
                $(".txtPlans").val("");
            }
            else {
                $("#spnTotal").text("Total Amount: £" + res);
                hideLoader();
            }
        }
    });
}