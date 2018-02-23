$(document).ready(function () {
    $("#li-Dashboard").removeClass("start active");
    $("#li-setting").addClass("start active");
    $("#lis-Emails").addClass("start active open");

    loadEmails();
});
var counter = 2;

$("#addButton").click(function () {

    //if(counter>10){
    //    alert("Only 10 textboxes allow");
    //    return false;
    //}

    var newTextBoxDiv = $(document.createElement('div'))
	     .attr("id", 'TextBoxDiv' + counter);
    newTextBoxDiv.after().html('<input type="text" name="text' + counter +
	      '" id="textbox' + counter + '" value=""  placeholder="Enter Email" class="form-control">');

    newTextBoxDiv.appendTo("#TextBoxesGroup");


    counter++;
});

$("#removeButton").click(function () {

    if (counter == 1) {
        AutoLoader("No more textbox to remove", "warning");
        return false;
    }

    counter--;

    $("#TextBoxDiv" + counter).remove();

});

//$("#saveEmails").click(function () {

//    var email = '';
//    var value = '';
//    for(i=1; i<counter; i++){
//        email += $('#textbox' + i).val();
//        if (email == "" || email == null) {
//            $('#textbox' + i).css("border", "2px solid red");
//            return;
//        }

//    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
//    if (!emailReg.test(email)) {
//        $('#textbox' + i).css("border", "2px solid red");
//        return;
//    }
//    else {

//        $('#textbox' + i).css("border", "");
//    }
//    value+= email + "\n";
//    email = '';

//    }
//    alert(value);
//});

var loadEmails = function () {
    showLoader("Please wait..", "info");
    var link = $("#hidLoadEmailUrl").val();
    $.ajax({
        url: link,
        type: "post",
        success: function (res) {
            $("#divLoadEmail").html(res);
            $("#tblLoadEmails").DataTable({
                "iDisplayLength": 100,
                "order": [[0, "desc"]]
            });
            hideLoader();
        }
    });
}

$("#updateEmail").click(function () {

    var email = $("#textbox").val();
    var id = $("#hidId").val();
    var link = $("#hidEditEmailUrl").val();
    if (email == "" || email == null) {
        $('#textbox').css("border", "2px solid red");
        return;
    }

    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test(email)) {
        $('#textbox').css("border", "2px solid red");
        return;
    }
    else {

        $('#textbox').css("border", "");
    }

    $.ajax({
        url: link,
        type: "post",
        data: { id: id, email: email },
        success: function (res) {
            if (res == "true") {
                loadEmails();
                $("#textbox").val("");
                showLoader("Updated Successfully", "success");
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

});

$("#saveEmails").click(function () {

    var email = '';
    var value = '';
    for (i = 1; i < counter; i++) {
        email += $('#textbox' + i).val();
        if (email == "" || email == null) {
            $('#textbox' + i).css("border", "2px solid red");
            return;
        }

        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        if (!emailReg.test(email)) {
            $('#textbox' + i).css("border", "2px solid red");
            return;
        }
        else {

            $('#textbox' + i).css("border", "");
        }
        value += email + "\n";
        email = '';

    }

    var link = $("#hidSaveEmailUrl").val();
    var id = $("#hidId").val();

    $.ajax({
        url: link,
        type: "post",
        data: { id: id, Email: value },
        success: function (res) {
            if (res == "true") {
                loadEmails();
                resetAllFields();
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

});



var resetAllFields = function () {
    var c = counter;
    for (i = 1; i < counter; i++) {
        $('#textbox' + i).val("");
        $("#TextBoxDiv" + c).remove();
        c--;
    }
    $("#hidId").val("");
    counter = 2;

}

var deleteEmail = function (id) {
    var aa = confirm("Are you sure you want to delete this town?");
    if (aa) {
        var link = $("#hidDeleteEmailUrl").val();
        $.ajax({
            url: link,
            type: "post",
            data: { id: id },
            success: function (res) {
                if (res == "true") {
                    loadEmails();
                    resetAllFields();
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