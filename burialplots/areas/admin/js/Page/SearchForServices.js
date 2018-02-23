$(function () {
    autoCompleteService();
    autoCompleteService1();
});
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