$(function () {
    searchByAlphabatic(null);
    searchByPostCode(null);
    searchByCounties(null);
    autoCompleteService();
    autoCompleteService1();
});

var searchByAlphabatic = function (town) {
   
    var townChar = town;
    var funeralId = $("#hidFuneralId").val();
    $.ajax({
        url: "/Search/SearchingByTown",
        type: "get",
        data: { town: townChar, funeralId: funeralId },
        success: function (result) {
            $('#ShowSearchingTowns').html(result);
        },
        error: function (error) {
            alert("error");
        }
    }
    )
}
var searchByPostCode = function (postCode) {

    var postCodeChar = postCode;
    var funeralId = $("#hidFuneralId").val();
    $.ajax({
        url: "/Search/SearchingByPostCode/",
        type: "get",
        data: { PostCodeChar: postCodeChar, funeralId: funeralId },
        success: function (result) {
            $('#ShowSearchingPostCode').html(result);
        },
        error: function (error) {
            alert("error");
        }
    }
    )
}
var searchByCounties = function (counties) {
    var countieschar = counties;
    var funeralId = $("#hidFuneralId").val();
    $.ajax({
        url: "/Search/SearchingByCounties/",
        type: "get",
        data: { Counties: countieschar, funeralId: funeralId },
        success: function (result) {
            $('#ShowSearchingCounties').html(result);
        },
        error: function (error) {
            alert("error");
        }
    }
    )

}

var autoCompleteService = function () {
    $("#txtServiceName").autocomplete({
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
var autoCompleteService1 = function () {
    $("#txtPostCodeTown").autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "/Search/GetAddressList",
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
//var SearchService = function () {

//    var serviceName = $("#txtServiceName").val();
//    var postCode = $("#txtPostCodeTown").val();

//    $.ajax({

//        url: "/Search/SearchService/",
//        type: "get",
//        data: { serviceName: serviceName, postCode: postCode },
//        success: function (result) {
//            window.location.href = "main.html";
//    },
//    error: function (error) {
//        AutoLoader("Error","error");
//    }
//    });

//}

       