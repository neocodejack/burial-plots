$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-contentManage").addClass("start active open");
    $("#li-NewsManage").addClass("start active");
    loadNewsManagement();
    datepicker();
});

var datepicker = function () {
    $(".datepicker").datepicker();
}

var loadNewsManagement = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadNewsUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadNews").html(res);
            $("#tblLoadNews").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        }
    });
}

var deleteNewsManagement = function (id) {
    var aa = confirm("Are you sure you want to delete this news?");
    if (aa) {
        var link = $("#hidDeleteNewsUrl").val();
        showLoader("Please wait..", "info");
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadNewsManagement();
                    showLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            }
        });
    }
}

var saveNews = function () {
    var link = $("#hidSaveNewsUrl").val();
    var id = $("#hidId").val();
    var title = $("#txtTitle").val();
    var titleUrdu = $("#txtUrduTitle").val();
    var titleArabic = $("#txtArabicTitle").val();
    var titleChinese = $("#txtChineseTitle").val();
    var titleItalian = $("#txtItalianTitle").val();
    var titleHindi = $("#txtHindiTitle").val();
    var titleTurkish = $("#txtTurkishTitle").val();
    var titleBengali = $("#txtBengaliTitle").val();
    var titleHebrew = $("#txtHebrewTitle").val();
    var desc = $("#txtDesc").val();
    var descUrdu = $("#txtUrduDesc").val();
    var descArabic = $("#txtArabicDesc").val();
    var descChinese = $("#txtChineseDesc").val();
    var descItalian = $("#txtItalianDesc").val();
    var descHindi = $("#txtHindiDesc").val();
    var descTurkish = $("#txtTurkishDesc").val();
    var descBengali = $("#txtBengaliDesc").val();
    var descHebrew = $("#txtHebrewDesc").val();
    var pubDate = $("#txtPubDate").val();
    var expiryDate = $("#txtExpiryDate").val();
    if (title == "" || desc == "" || pubDate == "") {
        showLoader("Please fill the required fields.", "info");
        setTimeout(function () {
            hideLoader();
        }, 3000);
    }
    else {
        var _data = {
            id: id, title: title, desc: desc, pubDate: pubDate, expiryDate: expiryDate, titleUrdu: titleUrdu, titleArabic: titleArabic,
            titleChinese: titleChinese, titleItalian: titleItalian, titleHindi: titleHindi, titleTurkish: titleTurkish, titleBengali: titleBengali,
            titleHebrew: titleHebrew, descUrdu: descUrdu, descArabic: descArabic, descChinese: descChinese, descItalian: descItalian,
            descHindi: descHindi, descTurkish: descTurkish, descBengali: descBengali, descHebrew: descHebrew
        }
        showLoader("Please wait..", "info");
        $.ajax({
            url: link,
            type: "post",
            data: _data,
            success: function (res) {
                if (res == "true") {
                    resetAllFields();
                    loadNewsManagement();
                    showLoader("Saved Successfully", "success");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
                else {
                    showLoader("Error", "error");
                    setTimeout(function () {
                        hideLoader();
                    }, 3000);
                }
            }
        });
    }
}

var editNews = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/NewsManagement/EditNews",
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            $("#hidId").val(data.Id);
            $("#txtTitle").val(data.Title);
            $("#txtUrduTitle").val(data.UrduTitle);
            $("#txtArabicTitle").val(data.ArabicTitle);
            $("#txtChineseTitle").val(data.ChineseTitle);
            $("#txtItalianTitle").val(data.ItalianTitle);
            $("#txtHindiTitle").val(data.HindiTitle);
            $("#txtTurkishTitle").val(data.TurkishTitle);
            $("#txtBengaliTitle").val(data.BengaliTitle);
            $("#txtHebrewTitle").val(data.HebrewTitle);
            $("#txtDesc").val(data.Description);
            $("#txtUrduDesc").val(data.UrduDescription);
            $("#txtArabicDesc").val(data.ArabicDescription);
            $("#txtChineseDesc").val(data.ChineseDescription);
            $("#txtItalianDesc").val(data.ItalianDescription);
            $("#txtHindiDesc").val(data.HindiDescription);
            $("#txtTurkishDesc").val(data.TurkishDescription);
            $("#txtBengaliDesc").val(data.BengaliDescription);
            $("#txtHebrewDesc").val(data.HebrewDescription);
            $("#txtPubDate").val(data.PubDate);
            $("#txtExpiryDate").val(data.ExpireDate);
            hideLoader();
        }
    });
}

var resetAllFields = function () {
    $("#hidId").val("");
    $("#txtTitle").val("");
    $("#txtUrduTitle").val("");
    $("#txtArabicTitle").val("");
    $("#txtChineseTitle").val("");
    $("#txtItalianTitle").val("");
    $("#txtHindiTitle").val("");
    $("#txtTurkishTitle").val("");
    $("#txtBengaliTitle").val("");
    $("#txtHebrewTitle").val("");
    $("#txtDesc").val("");
    $("#txtUrduDesc").val("");
    $("#txtArabicDesc").val("");
    $("#txtChineseDesc").val("");
    $("#txtItalianDesc").val("");
    $("#txtHindiDesc").val("");
    $("#txtTurkishDesc").val("");
    $("#txtBengaliDesc").val("");
    $("#txtHebrewDesc").val("");
    $("#txtPubDate").val("");
    $("#txtExpiryDate").val("");
}