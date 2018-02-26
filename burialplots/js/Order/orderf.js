$(document).ready(function () {
  

    $("#bioinfo").css('display', 'block');

    $("#billlnginformaion").css('display', 'none');
});
var nextdiv=function ()
{
    $("#billlnginformaion").css('display', 'block');
    $("#bioinfo").css('display', 'none');
}
var previous = function () {
    $("#bioinfo").css('display', 'block');

    $("#billlnginformaion").css('display', 'none'); 
}
var nextnext=function()
{
    $("#shippingid").css('display', 'block');

    $("#bioinfo").css('display', 'none');

    $("#billlnginformaion").css('display', 'none');
}
var previouslast = function () {
    $("#billlnginformaion").css('display', 'block');
    

    $("#shippingid").css('display', 'none');
}
var nextnextlast = function () {
    $("#shippingid").css('display', 'none'); 
    $("#payment").css('display', 'block');
}
var previouslastof=function()
{
    $("#shippingid").css('display', 'block');
    $("#payment").css('display', 'none');
}
var order=function()
{
    window.location = "/Product/Payment";
    var shipName = $("#shipName").val();
    var shipLastName = $("#shipLastName").val();
    var shipAddresone = $("#shipAddresone").val();
    var shipAddresstwo = $("#shipAddrestwo").val();
    var shipCity = $("#shipCity").val();
    var shipState = $("#shipstate").val();
    var shipZip = $("#shipzip").val();
    var billName = $("#billName").val();
    var billLastName = $("#billLastname").val();
    var billAddresone = $("#billAddressone").val();
    var billAddrestwo = $("#billAddresstwo").val();
    var billCity = $("#billCity").val();
    var billState = $("#billState").val();
    var billZip = $("#billZip").val();
    var cardNumber = $("#cardNumber").val();
    var cardName = $("#cardName").val();
    var cardMonth = $("#cardmonth").val();
    var cardYear = $("#cardyear").val();
    var cardCvc = $("#cardCvc").val();
    var geturl = $("#placeorder").val();

    $.ajax({
        url: geturl,
        type: "Post",
        data: {
            shipName: shipName, shipLastName: shipLastName, shipAddresone: shipAddresone, shipAddresstwo: shipAddresstwo, shipCity: shipCity,
            shipState: shipState, shipZip: shipZip, billName: billName, billLastName: billLastName, billAddresone: billAddresone,
            billAddrestwo: billAddrestwo, billCity: billCity, billState: billState, billZip: billZip, cardNumber: cardNumber, cardName: cardName,
            cardMonth:cardMonth,cardYear:cardYear,cardCvc:cardCvc
        },
        success: function (msg) {

            //$('#divLoadCategoriesLayout').html(msg);

        },
        error: function () {
        }
    });
}