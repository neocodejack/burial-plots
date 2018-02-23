$(function () {
    $("#li-profile").addClass("start active open");
    $("#li-Dashboard").removeClass("start active open");
    $('form').submit(function () {
        var FName = $('#FName').val();
        var paswword = $('#password').val();
        var link = $('#hProfileId').val();
        var hId = $("#hId").val();
        if (FName == "" || paswword == "") {

            $('#FName').css("border", "2px solid red");
            $('#password').css("border", "2px solid red");
            return;
        }
        $.ajax({
            url: link,
            type: "post",
            data: { Username: FName, Password: paswword, Id: hId },
            success: function (res) {
                if (res == "true") {
                    AutoLoader("Profile is updated");
                   }
            },
            error: function () {
                AutoLoader("Error", "error");
            }

        });
    });

});

var SaveProfileChanges = function () {
    var email = $('#email').val();
    var paswword = $('#password').val();
    if (email == "" && paswword == "") {

        $('#email').css("border", "2px solid red");
        $('#password').css("border", "2px solid red");
        return;
    }


}
