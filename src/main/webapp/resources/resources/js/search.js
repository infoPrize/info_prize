/*Created by liujing on 2018/3/10.*/
//跨域地址
// var website = "http://125.222.219.220/";

//本地地址
var website = "http://infoprize.nenu.edu.cn/";

var max = 5;
var pagelistc = 6;

var options;

$(document).ready(function(e) {
    //页面加载数据
    initdataAcm();
    initdataMath();
})

function initdataAcm() {
    var matchLevel = document.getElementById("matchLevel").value;
    var matchName = document.getElementById("matchName").value;
    var beginTime = document.getElementById("beginTime").value;
    var endTime = document.getElementById("endTime").value;
    var prizeLevel = document.getElementById("prizeLevel").value;
    var major = document.getElementById("major").value;
    var stuName = document.getElementById("stuName").value;
    var stuNumber = document.getElementById("stuNumber").value;
    var hostUnit = document.getElementById("hostUnit").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "acm/listByCondition",
        data: {
            matchLevel: matchLevel,
            matchName: matchName,
            beginTime: beginTime,
            endTime: endTime,
            prizeLevel: prizeLevel,
            major: major,
            stuName: stuName,
            stuNumber: stuNumber,
            hostUnit: hostUnit,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            console.log(data);
            var datas = data.acmPrizeDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    console.log(result);
                    var cHtml = "";
                    for(var i in result) {
                        var acm = website + "acm/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].hostUnit + "</td><td>" + result[i].prizeTimeStr + "</td><td>" + result[i].prizeLevel +
                            "</td><td>" + result[i].teamName + "</td><td class='td_table hidecol'><table class='sub'><tr><td>"
                            + result[i].teammateName1 + "</td></tr><tr><td>" + result[i].teammateName2 + "</td></tr><tr><td>"
                            + result[i].teammateName3 + "</td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td>"
                            + result[i].teammateStuNumber1 + "</td></tr><tr><td>" + result[i].teammateStuNumber2 + "</td></tr><tr><td>"
                            + result[i].teammateStuNumber3 + "</td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td>"
                            + result[i].teammateMajor1 + "</td></tr><tr><td>" + result[i].teammateMajor2 + "</td></tr><tr><td>"
                            + result[i].teammateMajor3 + "</td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='" + acm + "' >去往详情页</a></td><td></td><tr>";
                    }
                    $(".grid-body").html(cHtml);
                }
            };
            page.init(datas.length, 1, options);


        },
        complete: function(XMLHttpRequest, textStatus) {
        },
        error: function() {
            alert("请求网络失败！。。。。。。");
        }
    });
}
//
// function initdataMath() {
//     var matchLevel = document.getElementById("matchLevel").value;
//     var matchName = document.getElementById("matchName").value;
//     var beginTime = document.getElementById("beginTime").value;
//     var endTime = document.getElementById("endTime").value;
//     var prizeLevel = document.getElementById("prizeLevel").value;
//     var major = document.getElementById("major").value;
//     var stuName = document.getElementById("stuName").value;
//     var stuNumber = document.getElementById("stuNumber").value;
//     var hostUnit = document.getElementById("hostUnit").value;
//     var teacherName = document.getElementById("teacherName").value;
//     $('.grid-item').remove();
//     $.ajax({
//         type: "get",
//         url: website + "acm/listByCondition",
//         data: {
//             matchLevel: matchLevel,
//             matchName: matchName,
//             beginTime: beginTime,
//             endTime: endTime,
//             prizeLevel: prizeLevel,
//             major: major,
//             stuName: stuName,
//             stuNumber: stuNumber,
//             hostUnit: hostUnit,
//             teacherName: teacherName
//         },
//         dataType:"json",
//         success: function(data, textStatus) {
//             console.log(data);
//             var datas = data.acmPrizeDtoList;
//             options = {
//                 "id": "page", //显示页码的元素
//                 "data": datas, //显示数据
//                 "maxshowpageitem": max, //最多显示的页码个数
//                 "pagelistcount": pagelistc, //每页显示数据个数
//                 "callBack": function(result) {
//                     console.log(result);
//                     var cHtml = "";
//                     for(var i in result) {
//                         cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
//                             + result[i].hostUnit + "</td><td>" + result[i].prizeTimeStr + "</td><td>" + result[i].prizeLevel +
//                             "</td><td>" + result[i].teamName + "</td><td class='td_table hidecol'><table class='sub'><tr><td>"
//                             + result[i].teammateName1 + "</td></tr><tr><td>" + result[i].teammateName2 + "</td></tr><tr><td>"
//                             + result[i].teammateName3 + "</td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td>"
//                             + result[i].teammateStuNumber1 + "</td></tr><tr><td>" + result[i].teammateStuNumber2 + "</td></tr><tr><td>"
//                             + result[i].teammateStuNumber3 + "</td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td>"
//                             + result[i].teammateMajor1 + "</td></tr><tr><td>" + result[i].teammateMajor2 + "</td></tr><tr><td>"
//                             + result[i].teammateMajor3 + "</td></tr></table></td><td>" + result[i].teacherName + "</td><td></td><td></td><tr>";
//                     }
//                     $(".grid-body").html(cHtml);
//                 }
//             };
//             page.init(datas.length, 1, options);
//
//
//         },
//         complete: function(XMLHttpRequest, textStatus) {
//         },
//         error: function() {
//             alert("请求网络失败！。。。。。。");
//         }
//     });
// }