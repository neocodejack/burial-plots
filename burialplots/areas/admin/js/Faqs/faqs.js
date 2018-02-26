$(document).ready(function () {
    $("#li-contentManage").addClass("start active open");
    $("#li-Faqs").addClass("start active");
    $("#li-Dashboard").removeClass("start active");
    loadFAQs();
});

var loadFAQs = function () {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Faqs/LoadFAQS",
        type: "post",
        success: function (res) {
            $("#divLoadFaqs").html(res);
            $("#tblLoadFaqs").DataTable({
                "iDisplayLength": 100
            });
            hideLoader();
        }
    });
}

var saveFaqs = function () {
    var id = $("#hidId").val();
    var question = $("#txtQuestion").val();
    var answer = $("#txtAnswer").val();
    if (question == "" || answer == "") {
        AutoLoader("Please fill the required fields", "info");
        return;
    }
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Faqs/SaveFAQS",
        type: "post",
        data: {id: id, question: question, answer: answer},
        success: function (res) {
            if (res == "true") {
                clearAllFields();
                AutoLoader("Saved Successfully", "success");
                setTimeout(function () {
                    loadFAQs();
                }, 2000);
            }
            else {
                AutoLoader("Error", "error");
            }
        }
    });
}

var clearAllFields = function () {
    $("#hidId").val("");
    $("#txtQuestion").val("");
    $("#txtAnswer").val("");
}

var deleteFaqs = function (id) {
    if (confirm("Are you sure you want to delete this FAQs?")) {
        showLoader("Please wait..", "info");
        $.ajax({
            url: "/Admin/Faqs/DeleteFAQS",
            type: "post",
            data: { id: id},
            success: function (res) {
                if (res == "true") {
                    clearAllFields();
                    AutoLoader("Deleted Successfully", "success");
                    setTimeout(function () {
                        loadFAQs();
                    }, 2000);
                }
                else {
                    AutoLoader("Error", "error");
                }
            }
        });
    }
}

var editFaqs = function (id) {
    showLoader("Please wait..", "info");
    $.ajax({
        url: "/Admin/Faqs/EditFAQS",
        type: "post",
        data: { id: id },
        success: function (res) {
            var data = JSON.parse(res);
            $("#hidId").val(data.Id);
            $("#txtQuestion").val(data.Question);
            $("#txtAnswer").val(data.Answer);
            hideLoader();
        }
    });
}