$(function () {
    $(".activePaymentMethods").select2();
    var textAreas = document.getElementsByTagName('textarea');
    Array.prototype.forEach.call($("#productsAndServices"), function (elem) {
        elem.placeholder = elem.placeholder.replace(/\\n/g, '\n');

        if ($("#IsNationwide").is(":checked")) {

            $("#controllCountyTown").css("display", "none");
        }
    });
    $("#drpCounties").multiselect({
        columns: 2,
        placeholder: 'Select County',
        search: true
    });
    $('form').submit(function () {

        var BName = $("#BName").val();
        var PCode = $("#PCode").val();
        var SAddress = $("#SAddress").val();
        var PNumber = $("#PNumber").val();
        var WSite = $("#WSite").val();
        var BClass = $("#BClass").val();
        var hId = $("#hId").val();
        var productsAndServices = $("#productsAndServices").val();
        var BusinessDescription = $("#BusinessDescription").val();
        var PaymentGateways = $("#paymentGateways").val();
        var TwitterLink = $("#twitterLink").val();
        var GooglePlusLink = $("#googleLink").val();
        var FacebookLink = $("#facebookLink").val();
        var countyId = $("#drpCounties").val();
        var TName = $("#drpTowns").val();
        var NationWide = false;

        if ($("#IsNationwide").is(":checked")) {
            NationWide = true;
        }
        else {

            if (countyId == "" || countyId == null) {
                AutoLoader("Select the county.", "warning");
                return false;
            }
            if (TName == "" || TName == null) {
                AutoLoader("Select the town.", "warning");
                return false;
            }
        }



        //if (countyId == "" || countyId == null) {
        //    AutoLoader("Select the County.", "warning");

        //}
        //if (TName == "" || TName == null) {
        //    AutoLoader("Select the Town.", "warning");

        //}
        var TownsName = "";
        if (TName != null || TName != undefined) {
            TownsName = TName.toString();
        }
        var countyIds = "";
        if (countyId != null || countyId != undefined) {
            countyIds = countyId.toString();
        }
        var paymentGW = "";
        if (PaymentGateways != null || PaymentGateways != undefined) {
            paymentGW = PaymentGateways.toString();
        }

        saveImage(BName, PCode, SAddress, PNumber, WSite, BClass, hId, productsAndServices, BusinessDescription, paymentGW, TwitterLink, GooglePlusLink, FacebookLink, TownsName, countyIds, NationWide);


    });


});

$('#IsNationwide').change(function () {
    if (this.checked) {
        $("#controllCountyTown").hide();
    }
    else {
        $("#controllCountyTown").show();
    }
});

var LoadTowns = function () {

    var counties = $("#drpCounties").val();
    var sId = $("#hId").val();
    $.ajax({
        url: "/Users/GetTowns",
        type: "post",
        data: { counties: JSON.stringify(counties), serviceId: sId },
        success: function (res) {
            var data = JSON.parse(res);
            alert(data[0].Name + data[1].Name + data[2].Name + data[3].Name);
            $("#divTownDrp").empty();
            var option = '<select name="multicheckbox[]" multiple="multiple" class="4colactive form-control" id="drpTowns">';
            for (var i = 0; i < data.length; i++) {
                option += "<option Selected value='" + data[i].Name + "'>" + data[i].Name + "</option>";

            }
            option += '</select>';
            $("#divTownDrp").html(option);
            $("#drpTowns").multiselect({
                columns: 2,
                placeholder: 'Select Towns'
            });
        },
        error: function (error) {

            AutoLoader("Error", error);
        }
    });
}
var loadTownsList = function () {
    var cId = $("#drpCounties").val();
    var sId = $("#hId").val();
    $.ajax({
        url: "/Users/GetTowns",
        type: "post",
        data: { counties: JSON.stringify(cId), servicesId: sId },
        success: function (res) {
            var selectedTowns = JSON.parse(res.list1);
            var existingTowns = JSON.parse(res.list);
            $("#divTownDrp").empty();
            var option = '<select name="multicheckbox[]" multiple="multiple" class="form-control 4colactive" id="drpTowns">';
            for (var i = 0; i < selectedTowns.length; i++) {

                if (existingTowns.length > 0) {
                    for (var j = 0; j < existingTowns.length; j++) {

                        if (selectedTowns[i].Name != existingTowns[j].Name) {
                            option += "<option value='" + selectedTowns[i].Name + "'>" + selectedTowns[i].Name + "</option>";
                            break;
                        }
                        else {
                            option += "<option Selected value='" + existingTowns[j].Name + "'>" + existingTowns[j].Name + "</option>";
                            break;
                        }
                    }
                }
                else {
                    option += "<option value='" + selectedTowns[i].Name + "'>" + selectedTowns[i].Name + "</option>";
                }
               

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

//image save
var saveImage = function (BName, PCode, SAddress, PNumber, WSite, BClass, hId, productsAndServices, BusinessDescription, values, TwitterLink, GooglePlusLink, FacebookLink, TownsName, countyIds, NationWide) {
    var url = $("#Imghiden").val();
    var imageName;
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];

        formData.append("ImgUpload", file);
    }

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
                url: "/Users/EditServiceListing",
                type: "post",
                //data: $(this).serialize(), Image: image,
                data: { BusinessName: BName, PostCode: PCode, Address: SAddress, PhoneNo: PNumber, Website: WSite, BusinessClassification: BClass, Picture: res, Id: hId, ServicesAndProducts: productsAndServices, BusinessDescription: BusinessDescription, PaymentGateways: values, FacebookLink: FacebookLink, GooglePlusLink: GooglePlusLink, TwitterLink: TwitterLink, CountiesName: TownsName, CountiesId: countyIds, NationWide: NationWide },
                success: function (result) {
                    if (result == "true") {
                        AutoLoader("Saved Successfully", "success");
                        window.location.href = "/Admin/Users/MyListings";
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

};