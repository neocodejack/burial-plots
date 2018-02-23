$(document).ready(function () {
    $("#li-Dashboard").removeClass("active start open");
    $("#li-CemeteryManagement").addClass("active start open");
    $("#li-grave").addClass("active start");
    rowID = parseInt($("#hidRowId").val());
    loadGraves();

});
var loadCemetery = function () {
    var id = $("#drpCemetery").val();
    var getUrl = $("#hidLoadCemeteryUrl").val();
    var returnLink = $("#hidReturnLink").val();
    var getSectionUrl = $("#hidGetSectionUrl").val();
    $.ajax({
        url: getUrl,
        data: { id: id },
        type: "post",
        async: false,
        success: function (res) {
            if (res != "false") {
                $("#divCancelCemeteryBtn").show();
                var data = JSON.parse(res);
                var code = data.Code.replace(/\\/g, '').slice(1, -1);
                var obj = JSON.parse(code);
                $('#image-map-pro-container').imageMapPro(obj);
                setTimeout(function () {
                    $.each(obj.spots, function (index, val) {
                        var idd = val.id;
                        $("#" + idd).on("click", function () {
                            showLoader("Please wait..", "info");
                            $.ajax({
                                url: getSectionUrl,
                                data: { spotId: idd, cemeteryId: id },
                                type: "post",
                                async: false,
                                success: function (responce) {
                                    hideLoader();
                                    var data2 = JSON.parse(responce);
                                    var obj2 = JSON.parse(data2.Code.replace(/\\/g, '').slice(1, -1));
                                    $("#hdSection").text(data2.Name);
                                    $("#divCemetery").hide();
                                    $('#divLoadSection').imageMapPro(obj2);
                                    $("#divSection").fadeIn(2000);
                                    setTimeout(function () {
                                        $.each(obj2.spots, function (index, val) {
                                            var sectionSpot = val.id;
                                            $("#" + sectionSpot).on("click", function () {
                                                var getGraveUrl = $("#hidLoadGraveDetailsUrl").val();
                                                showLoader("Please wait..", "info");
                                                $("#divLoadGraveDetails").empty();
                                                $.ajax({
                                                    url: getGraveUrl,
                                                    data: { spotId: sectionSpot, sectionId: data2.Id },
                                                    type: "post",
                                                    success: function (res) {
                                                        hideLoader();
                                                        $("#divLoadGraveDetails").html(res);
                                                        loadSect();
                                                        var modal = document.getElementById('modalGraveDetails');

                                                        // Get the button that opens the modal
                                                        var btn = document.getElementById("myBtn");

                                                        // Get the <span> element that closes the modal
                                                        var span = document.getElementsByClassName("close")[0];

                                                        // When the user clicks the button, open the modal 
                                                        modal.style.display = "block";
                                                        document.addEventListener('keyup', function (e) {
                                                            if (e.keyCode == 27) {
                                                                var modal = document.getElementById('modalGraveDetails');
                                                                modal.style.display = "none";
                                                            }
                                                        });
                                                        // When the user clicks on <span> (x), close the modal
                                                        span.onclick = function () {
                                                            modal.style.display = "none";
                                                        }
                                                    }
                                                });
                                            });
                                        });
                                    }, 2000);
                                }
                            });
                        });
                    });
                }, 2000);
            }
            else {
                $('#image-map-pro-container').empty();
            }

        }
    });
}
var saveGraveDetails = function () {
    var id = $("#Id").val();
    var sku = $("#SKU").val();
    var plotName = $("#PlotName").val();
    var plotNo = $("#PlotNo").val();
    var plotType = $("#PlotType").val();
    var size = $("#Size").val();
    var sDesc = $("#ShortDescription").val();
    var longDesc = $("#FullDescription").val();
    var internment = $("#Internement").val();
    var internmentFee = $("#InternementFee").val();
    var lease = $("#Lease").val();
    var maintenance = $("#Maintenance").val();
    var sectionId = $("#SectionId").val();
    var spotId = $("#SpotId").val();
    var religionId = $("#drpReligion").val();
    var isEnable = $("#drpEnableDisable").val();
    var sectId = $("#drpSect").val();
    var layers = [];
    $(".divLayers").each(function (index, elem) {
        var Id = $(elem).find(".txtLayerId").val();
        var Name = $(elem).find(".txtLayer").val();
        var Price = $(elem).find(".txtPrice").val();
        var obj = { Id: Id, Name: Name, Price: Price };
        layers.push(obj);
    });
    var tierId = $("#drpTier").val();
    var f = true;
    $(".require-field").each(function () {
        if ($(this).val() == "") {
            $(this).css("border", "1px solid red");
            setTimeout(function () {
                $(this).css("border", "");
            }, 3000);
            f = false;
        }
    });
    if (f == false) {
        return;
    }
    var Newcode = getCode(sectionId, religionId, spotId, plotName);
    var _data = {
        id: id, sku: sku, plotName: plotName, plotNo: plotNo, plotType: plotType, size: size,
        sDesc: sDesc, longDesc: longDesc, internment: internment, internmentFee: internmentFee, lease: lease,
        maintenance: maintenance, sectionId: sectionId, spotId: spotId, tierId: tierId,
        layers: JSON.stringify(layers), religionId: religionId, sectId: sectId, code: JSON.stringify(Newcode),
        isEnable: isEnable, Image: ""
    }
    showLoader("Please wait..", "info");
        savePurchaseBoxImage(_data);
}
var savePurchaseBoxImage = function (_data) {
    var formData = new FormData();
    var totalFiles = document.getElementById("ImgUpload").files.length;
    for (var i = 0; i < totalFiles; i++) {
        var file = document.getElementById("ImgUpload").files[i];
        formData.append("ImgUpload", file);
    }
    if (totalFiles > 0) {
        $.ajax({
            url: "/Admin/Plots/SaveGraveImage",
            type: "POST",
            async: false,
            dataType: 'json',
            contentType: false,
            processData: false,
            data: formData,
            success: function (res) {
                if (res.msg == "true") {
                    var getUrl = $("#hidSaveGraveDetailUrl").val();
                    _data.Image = res.Image;
                    $.ajax({
                        url: getUrl,
                        data: _data,
                        type: "post",
                        success: function (res) {
                            if (res == "true") {
                                closeDetailModal();
                                setTimeout(function () {
                                    AutoLoader("Saved Successfully", "success");
                                    setTimeout(function () {
                                        table.destroy();
                                        loadGraves();
                                    }, 2000);
                                }, 600);
                            }
                            else {
                                AutoLoader("Error", "error");
                            }
                        }
                    });
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
    else {
        var getUrl = $("#hidSaveGraveDetailUrl").val();
        $.ajax({
            url: getUrl,
            data: _data,
            type: "post",
            success: function (res) {
                if (res == "true") {
                    closeDetailModal();
                    setTimeout(function () {
                        AutoLoader("Saved Successfully", "success");
                        setTimeout(function () {
                            table.destroy();
                            loadGraves();
                        }, 2000);
                    }, 600);
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}
var closeDetailModal = function () {
    var modal = document.getElementById('modalGraveDetails');
    modal.style.display = "none";
}

var rowID = 0;
var addLayerRow = function () {
    var html = $("#tmplLayers").html();
    var tmpl = _.template(html);
    var value = { Id: rowID };
    var tpl = tmpl(value);
    $("#divLoadLayers").append(tpl);
    rowID++;
}

var removeLayerRow = function (id) {
    $("#divLayers_" + id).remove();
}

var hideSection = function () {
    $("#divSection").hide();
    $('#divLoadSection').empty();
    $("#divCemetery").fadeIn(2000);
}

var loadGraves_UnAvail = function () {
    var cemeteryId = $("#").val();
    showLoader("Please wait", "info");
    $.ajax({
        url: $("#hidLoadGraveUrl").val(),
        type: "post",
        data: { cemeteryId: cemeteryId },
        success: function (res) {
            $("#divLoadGraves").html(res);
            $("#tblLoadGraves").DataTable({
                "iDisplayLength": 100,
                order: [[0, "desc"]],
                "columnDefs": [
    { "width": "30%", "targets": 11 }
                ]
            });
            hideLoader();
        }
    });
}

var editGrave = function (spot, sectionId) {
    showLoader("Please wait..", "info");
    var getGraveUrl = $("#hidLoadGraveDetailsUrl").val();
    $("#divLoadGraveDetails").empty();
    $.ajax({
        url: getGraveUrl,
        data: { spotId: spot, sectionId: sectionId },
        type: "post",
        success: function (res) {
            hideLoader();
            $("#divLoadGraveDetails").html(res);
            var modal = document.getElementById('modalGraveDetails');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            modal.style.display = "block";
            document.addEventListener('keyup', function (e) {
                if (e.keyCode == 27) {
                    var modal = document.getElementById('modalGraveDetails');
                    modal.style.display = "none";
                }
            });
            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }
        }
    });
}

var cancelCemetery = function () {
    $("#divCancelCemeteryBtn").hide();
    $("#image-map-pro-container").empty();
}

var deleteGrave = function (id) {
    if (confirm("Are you sure you want to delete this grave?")) {
        showLoader("Please wait..", "info");
        var getUrl = $("#hidDeleteGraveUrl").val();
        $.ajax({
            url: getUrl,
            data: { id: id },
            type: "post",
            success: function (res) {
                if (res == "true") {
                    hideLoader();
                    setTimeout(function () {
                        AutoLoader("Deleted Successfully", "success");
                        setTimeout(function () {
                            table.destroy();
                            loadGraves();
                        }, 2000);
                    }, 600); 
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var loadSect = function () {
    showLoader("Please wait..", "info");
    var getUrl = $("#hidLoadSectUrl").val();
    var religionId = $("#drpReligion").val();
    $.ajax({
        url: getUrl,
        type: "post",
        data: { religionId: religionId },
        success: function (res) {
            $("#drpSect").html(res);
            $("#drpSect").val($("#SectId").val());
            hideLoader();
        }
    });
}

var getCode = function (section, religion, spot, plotName) {
    var Newcode = "";
    $.ajax({
        url: "/Admin/Cemeteries/GetSectionCode",
        type: "post",
        async: false,
        data: { section: section, religion, religion },
        success: function (res) {
            var code = res.code.replace(/\\/g, '').slice(1, -1);
            var codearr = JSON.parse(code);
            for (var i = 0; i < codearr.spots.length; i++) {
                if (codearr.spots[i].id == spot) {
                    codearr.spots[i].tooltip_content["plain_text"] = plotName;
                    break;
                }
            }
            if (res.pic == "") {
                for (var i = 0; i < codearr.spots.length; i++) {
                    if (codearr.spots[i].id == spot) {
                        codearr.spots[i].default_style = { };
                    }
                }
                Newcode = JSON.stringify(codearr);
            }
            else {
                //var code = res.code.replace(/\\/g, '').slice(1, -1);
                //var codearr = JSON.parse(code);
                for (var i = 0; i < codearr.spots.length; i++) {
                    if (codearr.spots[i].id == spot) {
                        codearr.spots[i].default_style = { "icon_type": "custom", "icon_url": $("#hidRequestUrl").val() + "Images/pins/" + res.pic };
                    }
                }
                Newcode = JSON.stringify(codearr);
            }
        }
    });
    return Newcode;
}

var checkAllClick = function () {
    if ($("#chkAll").is(":checked")) {
        $(".chkDel").prop("checked", true);
    }
    else {
        $(".chkDel").prop("checked", false);
    }
}

var checkOneClick = function () {
    var f = true;
    $(".chkDel").each(function () {
        if (!$(this).is(":checked")) {
            f = false;
        }
    });
    $("#chkAll").prop("checked", f);
}

var deleteSelected = function () {
    var ids = [];
    $(".chkDel").each(function () {
        if ($(this).is(":checked")) {
            ids.push($(this).val());
        }
    });
    if (ids.length == 0) {
        AutoLoader("Please select atleast one row for delete", "info");
        return;
    }
    if (confirm("Are you sure you want delete "+ids.length+" Plots?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Plots/DeleteSelectedGraves",
            type: "post",
            data: { ids: JSON.stringify(ids) },
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        table.destroy();
                        loadGraves();
                    }, 2000);
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var enableDisable = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Plots/EnableDisable",
        type: "post",
        data: { id: id },
        success: function (res) {
            if (res == "true") {
                AutoLoader("Status Changed Successfully", "success");
                setTimeout(function () {
                    table.destroy();
                    loadGraves();
                }, 2000);
            }
            else {
                AutoLoader("Error", "error");
            }
        }
    });
}

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

var table;
var loadGraves = function () {
    showLoader("Please wait..", "info");
    var getUrl = $("#hidLoadGraveUrl").val();
    var cemeteryId = $("#drpCemetery").val();
    _.templateSettings = {
        interpolate: /\{%=(.+?)%\}/g,
        escape: /\{%-(.+?)%\}/g,
        evaluate: /\{%(.+?)%\}/g
    };
    var tmpl = _.template($('#tmplLoadGraves').html());
    table = $('#tblLoadGraves').DataTable({
        fixedHeader: {
            headerOffset: 50,
            footer: true
        },
        "paging": true,
        "info": true,
        //"order": [[8, "desc"]],
        "ajax": {
            "url": getUrl,
            data: { cemeteryId: cemeteryId }
        },
        "columns": [
			{ "data": "CheckBoxes", "title": "<input style='margin-left:12px' type='checkbox' id='chkAll' onclick='checkAllClick()' />", "className": "trheadcolor text-center", "orderable": false },
            { "data": "PlotNo", "title": "Plot No.", "className": "trheadcolor text-center", "orderable": false },
            { "data": "PlotName", "title": "Plot Name", "className": "trheadcolor text-center", "orderable": false },
            { "data": "SectionName", "title": "Section Name", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Size", "title": "Size", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Address", "title": "Address", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Location", "title": "Location", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Internements", "title": "No. of Burials", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Tiers", "title": "Tiers", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Status", "title": "Status", "className": "trheadcolor text-center", "orderable": false },
            { "data": "Action", "title": "", "className": "trheadcolor text-center", "orderable": false },
        ],
        //"order": [[0, "asc"]],
        "rowCallback": function (row, data) {
            $(row).html(tmpl(data));
        },
        "drawCallback": function (settings) {
            hideLoader();
        }
    });
}

var filterLoadGraves = function () {
    table.destroy();
    loadGraves();
}