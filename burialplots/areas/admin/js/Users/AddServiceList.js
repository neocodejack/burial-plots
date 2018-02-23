$(document).ready(function () {

    $("#li-listing").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
    $(".activePaymentMethods").select2();
    var textAreas = document.getElementsByTagName('textarea');
    Array.prototype.forEach.call(textAreas, function (elem) {
        elem.placeholder = elem.placeholder.replace(/\\n/g, '\n');
    });
})
var showLocation = function () {
    $("#hlocationId").show();
    $("#txtNumber").val("");
    $("#txtAddress1").val("");
    $("#txtTown").val("");
    $("#txtCounty").val("");
    $("#txtCountry").val("");
}

var loadTownsList = function () {
    var cId = $("#drpCounties").val();
    $.ajax({
        url: "/Users/GetTownsList",
        type: "post",
        data: { CountyId: JSON.stringify(cId) },
        success: function (res) {
            var data = JSON.parse(res);
            $("#divTownDrp").empty();
            var option = '<select name="multicheckbox[]" multiple="multiple" class="4colactive" id="drpTowns">';
            for (var i = 0; i < data.length; i++) {
                option += "<option value='" + data[i].Name + "'>" + data[i].Name + "</option>";

            }
            option += '</select>';
            $("#divTownDrp").html(option);
            $("#drpTowns").multiselect({
                columns: 2,
                placeholder: 'Select Towns',
                search: true
            });
        },
        error: function (error) {

            AutoLoader("Error", error);
        }
    });
}
$('#IsNationwide').change(function () {
    if (this.checked) {
        $("#hideCounty").hide();
    }
    else {
        $("#hideCounty").show();
    }
});
var ContinueFromBusinessDetail = function () {
    var businessName = $("#txtBusinessName").val();
    var postCode = $("#txtPostCode").val();
    var link = $("#hidGetPostCodeServicesUrl").val();
    if (postCode != null) {

        $.ajax({
            type: "Post",
            url: link,
            data: { postCode: postCode },
            success: function (result) {

                var res = JSON.parse(result);
                if (res.Addresses == "" || res.Addresses == null) {
                    AutoLoader("No address is found.");
                }
                var content = "<option value=''>" + res.Addresses.length + " possible matches</option>"

                for (var i = 0; i < res.Addresses.length; i++) {
                    var address = res.Addresses[i];    //.replace(", , , , ,", ",");
                    //address = address.replace(", , , ,", ",");
                    //address = address.replace(", , ,", ",");
                    //address = address.replace(", ,", ",");
                    //address = address.replace(", , , , , ,", ",");
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
                AutoLoader("Error", "error");
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
    //$('html, body').animate({
    //    scrollTop: $("#divAllSections").offset().top
    //}, 2000);
}
$("#drpAddress").change(function () {
    var postcode = $("#txtPostCode").val();
    var value = $('#drpAddress').val();
    var array = value.split(',');
    // $("#txtNumber").val(array[0].split(' ')[0]);
    $("#txtAddress1").val(array[0]);
    $("#txtAddress2").val(array[1]);
    if (array[6].split(' ').length > 3) {
        $("#txtCounty").val(array[6].split(' ')[1] + " " + array[6].split(' ')[2]);
    }
    else {
        $("#txtCounty").val(array[6].split(' ')[1]);
    }
    $("#txtTown").val(array[5]);
    //$("#txtPostCode1").val(array[2].split(' ')[1]);
    $("#txtPostCode1").val($("#txtPostCode").val());
    // Pure JS
    //$("#ManualButton").hide();
    $("#hlocationId").show();
});
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
    //$('html, body').animate({
    //    scrollTop: $("#divYourBusinessSection").offset().top
    //}, 2000);
}
var continueFromLocationClick = function () {
    var number = $("#txtNumber").val();
    var Address1 = $("#txtAddress1").val();
    var Town = $("#txtTown").val();
    var County = $("#txtCounty").val();
    var Country = $("#txtCountry").val();
    var PostCode = $("#txtPostCode").val();

    //$('html, body').animate({
    //    scrollTop: $("#divContactSection").offset().top
    //}, 2000);
}
var saveServiceListing = function () {

    var err = 0;
    $(".mytext-field").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "2px solid red");
            err = err + 1;
            AutoLoader("Please fill the required fields.", "warning");
            $(window).scrollTop(0);
        }
        else {
            $(this).css("border", "");
        }


    });

    if (err == 0) {

        var id = $("#hidId").val();
        var hidImg = $("#hidImage").val();
        var businessName = $("#txtBusinessName").val();
        var postCode = $("#txtPostCode").val();
        var address = $("#drpAddress").val();
        var phNo = $("#txtPhoneNumber").val();
        var website = $("#txtWebsite").val();
        var link = $("#hidSaveServiceLnk").val();
        var number = $("#txtNumber").val();
        var Address1 = $("#txtAddress1").val();
        var Town = $("#txtTown").val();
        var County = $("#txtCounty").val();
        var Country = $("#txtCountry").val();
        var adress2 = $("#txtAddess2").val();
        var Latitude = $("#hIdLatitudeVal").val();
        var Longitude = $("#hIdLongitudeVAl").val();

        var productsAndServices = $("#productsAndServices").val();
        var BusinessDescription = $("#BusinessDescription").val();
        var PaymentGateways = $("#paymentGateways").val();
        if (PaymentGateways !== null) {
            PaymentGateways = PaymentGateways.toString();
        }
        else {
            PaymentGateways = "";
        }
        var TwitterLink = $("#twitterLink").val();
        var GooglePlusLink = $("#googleLink").val();
        var FacebookLink = $("#facebookLink").val();
        var linkedin = $("#txtLinkedIn").val();
        var TName = $("#drpTowns").val();
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
                    saveImage(id, hidImg, businessName, postCode, address, phNo, website, number, productsAndServices, BusinessDescription, TwitterLink, GooglePlusLink, FacebookLink, Address1, Town, County, Country, adress2, Latitude, Longitude, link, planIds, PaymentGateways, linkedin);
                }
            }
        });
    }
}
var saveImage = function (id, hidImg, businessName, postCode, address, phNo, website, number, productsAndServices, BusinessDescription, TwitterLink, GooglePlusLink, FacebookLink, Address1, Town, County, Country, adress2, Latitude, Longitude, link, planIds, PaymentGateways, linkedin) {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];
        formData.append("ImgUpload", file);
    }
    if (totalFiles > 0) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: url,
            type: "POST",
            async: false,
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: function (res) {
                $.ajax({
                    url: link,
                    type: "post",
                    data: { id: id, businessName: businessName, postCode: postCode, address: address, phNo: phNo, website: website, number: number, Picture: res, ServicesAndProducts: productsAndServices, BusinessDescription: BusinessDescription, FacebookLink: FacebookLink, GooglePlusLink: GooglePlusLink, TwitterLink: TwitterLink, Address1: Address1, Town: Town, County: County, Country: Country, adress2: adress2, Latitude: Latitude, Longitude: Longitude, planIds: JSON.stringify(planIds), PaymentGateways: PaymentGateways, linkedin: linkedin },
                    success: function (result) {
                        if (result == "true") {
                            AutoLoader("Proceeding for payment", "success");
                            setTimeout(function () {
                                window.location.href = "/Admin/Checkouts/Index";
                            }, 1000);
                        }
                        else if (result == "add") {
                            AutoLoader("Service List added Successfully", "success");
                            setTimeout(function () {
                                window.location.href = "/Admin/Users/MyListings";
                            }, 2000);
                        }
                        else {
                            AutoLoader("Error", "error");
                        }

                    },
                    error: function () {
                        AutoLoader("Error", "error");
                    }
                });
            }
        });
    }
    else {
        $.ajax({
            url: link,
            type: "post",
            data: { id: id, hidImg: hidImg, businessName: businessName, postCode: postCode, address: address, phNo: phNo, website: website, number: number, Picture: "", ServicesAndProducts: productsAndServices, BusinessDescription: BusinessDescription, FacebookLink: FacebookLink, GooglePlusLink: GooglePlusLink, TwitterLink: TwitterLink, Address1: Address1, Town: Town, County: County, Country: Country, adress2: adress2, Latitude: Latitude, Longitude: Longitude, planIds: JSON.stringify(planIds), PaymentGateways: PaymentGateways, linkedin: linkedin },
            success: function (result) {
                if (result == "true") {
                    AutoLoader("Proceeding for payment", "success");
                    setTimeout(function () {
                        window.location.href = "/Admin/Checkouts/Index";
                    }, 1000);
                }
                else if (result == "add") {
                    AutoLoader("Service List added Successfully", "success");
                    setTimeout(function () {
                        window.location.href = "/Admin/Users/MyListings";
                    }, 1000);
                }
                else if (result == "update") {
                    AutoLoader("Updated Successfully", "success");
                    setTimeout(function () {
                        window.location.href = "/Admin/Users/MyListings";
                    }, 2000);
                }
                else {
                    AutoLoader("Error", "error");
                }

            },
            error: function () {
                AutoLoader("Error", "error");
            }
        });
    }
};
//image js
function showMyImage(fileInput) {
    var files = fileInput.files;
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var imageType = /image.*/;
        if (!file.type.match(imageType)) {
            continue;
        }
        var img = document.getElementById("thumbnil");

        img.file = file;
        var reader = new FileReader();
        reader.onload = (function (aImg) {
            return function (e) {
                aImg.src = e.target.result;
            };
        })(img);
        reader.readAsDataURL(file);
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