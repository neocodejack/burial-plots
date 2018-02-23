$(document).ready(function () {


});

var SectionFilter = function () {
    var SectionName = $("#drpSection").val();
    
    $.ajax({
        url: "/Market/SectionFilter",
        type: "post",
        data: { SectionName: SectionName },
        success: function (res) {
            $("#divLoadCemeteries").html(res);
        },
        error: function (error) {

            AutoLoader("Error", error);
        }
    });
}
var loadSubReligion = function () {
    var religionId = $("#drpReligion").val();
    $.ajax({
        url: "/Market/ReligionFilter",
        type: "post",
        data: { religionId: religionId },
        success: function (res) {
            
            var data = JSON.parse(res);
            var option = "<option value=''>-- Select Sub-Religion -- </option>";
            for (var i = 0; i < data.length; i++) {
                option += "<option value='" + data[i].id + "'>" + data[i].Name + "</option>";
            }
            option += '</select>';
            $("#drpSubReligion").html(option);
          
        },
      
    });
}
var FilterSubReligion = function () {
    var id = $("#drpSubReligion").val();

    $.ajax({
        url: "/Market/FilterSubReligion",
        type: "post",
        data: { SubRelgionId: id },
        success: function (res) {
            $("#divLoadCemeteries").html(res);
        },
        error: function (error) {

            AutoLoader("Error", error);
        }
    });
}