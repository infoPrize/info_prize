/*Created by liujing on 2018/3/10.*/

//本地地址
var website = "http://infoprize.nenu.edu.cn/";
//服务器地址
// var website = "http://120.78.154.246/";
//服务器地址(带项目名)
// var website = "http://120.78.154.246/info_prize/";

var max = 5;
var pagelistc = 6;

var options;

//论文
function initdataThesis() {
    var journalLevel = document.getElementById("journalLevel").value;
    var journalName = document.getElementById("journalName").value;
    var authorName = document.getElementById("authorName").value;
    var authorStuNumber = document.getElementById("authorStuNumber").value;
    var authorMajor = document.getElementById("authorMajor").value;
    var authorGrade = document.getElementById("authorGrade").value;
    var beginTime = document.getElementById("beginTime").value;
    var endTime = document.getElementById("endTime").value;
    var teacherName = document.getElementById("teacherName").value;
    var thesisTitle = document.getElementById("thesisTitle").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "thesis/listByCondition",
        data: {
            journalLevel: journalLevel,
            journalName: journalName,
            authorName: authorName,
            authorStuNumber: authorStuNumber,
            authorMajor: authorMajor,
            authorGrade: authorGrade,
            beginTime: beginTime,
            endTime: endTime,
            teacherName: teacherName,
            thesisTitle: thesisTitle
        },
        dataType:"json",
        success: function(data, textStatus) {
            var datas = data.thesisDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数authorMajor
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "thesis/toDetail/" + result[i].id;
                    //     cHtml += "<tr><td>" + result[i].journalLevel + "</td><td>" + result[i].journalName + "</td><td>"
                    //         + result[i].thesisTitle + "</td><td>" + result[i].publishTimeStr + "</td><td class='td_table'><table class='sub'><tr><td><span>"
                    //         + result[i].authorName1 + "</span></td></tr><tr><td><span>" + result[i].authorName2 + "</span></td></tr><tr><td><span>" + result[i].authorName3 + "</span></td></tr><tr><td><span>"
                    //         + result[i].authorName4 + "</span></td></tr><tr><td><span>" + result[i].authorName5 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                    //         + result[i].authorLevel1 + "</span></td></tr><tr><td><span>" + result[i].authorLevel2 + "</span></td></tr><tr><td><span>" + result[i].authorLevel3 + "</span></td></tr><tr><td><span>"
                    //         + result[i].authorLevel4 + "</span></td></tr><tr><td><span>" + result[i].authorLevel5 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                    //         + result[i].authorStuNumber1 + "</span></td></tr><tr><td><span>" + result[i].authorStuNumber2 + "</span></td></tr><tr><td><span>" + result[i].authorStuNumber3 + "</span></td></tr><tr><td><span>"
                    //         + result[i].authorStuNumber4 + "</span></td></tr><tr><td><span>" + result[i].authorStuNumber5 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                    //         + result[i].authorMajor1 + "</span></td></tr><tr><td><span>" + result[i].authorMajor2 + "</span></td></tr><tr><td><span>" + result[i].authorMajor3 + "</span></td></tr><tr><td><span>"
                    //         + result[i].authorMajor4 + "</span></td></tr><tr><td>" + result[i].authorMajor5 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                    //         + acmt + "' >去往详情页</a></td><td><a class='delete_thesis' id='" + result[i].id + "'>删除</a></td><tr>";
                    // }
                        cHtml += "<tr><td>" + result[i].journalLevel + "</td><td>" + result[i].journalName + "</td><td>"
                            + result[i].thesisTitle + "</td><td>" + result[i].publishTimeStr + "</td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].authorName1 + "</td></tr><tr><td>" + result[i].authorName2 + "</td></tr><tr><td>" + result[i].authorName3 + "</td></tr><tr><td>"
                            + result[i].authorName4 + "</td></tr><tr><td>" + result[i].authorName5 + "</td></tr></table></td><td class='td_table'><table class='sub'>";
                        if(result[i].authorLevel1 !== 0) {
                            cHtml += "<tr><td>第" + result[i].authorLevel1 + "作者</td></tr>";
                        }
                        if(result[i].authorLevel2 !== 0) {
                            cHtml += "<tr><td>第" + result[i].authorLevel2 + "作者</td></tr>";
                        }
                        if(result[i].authorLevel3 !== 0) {
                            cHtml += "<tr><td>第" + result[i].authorLevel3 + "作者</td></tr>";
                        }
                        if(result[i].authorLevel4 !== 0) {
                            cHtml += "<tr><td>第" + result[i].authorLevel4 + "作者</td></tr>";
                        }
                        if(result[i].authorLevel5 !== 0) {
                            cHtml += "<tr><td>第" + result[i].authorLevel5 + "作者</td></tr>";
                        }
                        cHtml += "</table></td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].authorStuNumber1 + "</td></tr><tr><td>" + result[i].authorStuNumber2 + "</td></tr><tr><td>" + result[i].authorStuNumber3 + "</td></tr><tr><td>"
                            + result[i].authorStuNumber4 + "</td></tr><tr><td>" + result[i].authorStuNumber5 + "</td></tr></table></td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].authorMajor1 + "</td></tr><tr><td>" + result[i].authorMajor2 + "</td></tr><tr><td>" + result[i].authorMajor3 + "</td></tr><tr><td>"
                            + result[i].authorMajor4 + "</td></tr><tr><td>" + result[i].authorMajor5 + "</td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete_thesis' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_thesis").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "thesis/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//专利
function initdataPatent() {
    var patentType = document.getElementById("patentType").value;
    var patentName = document.getElementById("patentName").value;
    var stuNumber = document.getElementById("stuNumber").value;
    var stuName = document.getElementById("stuName").value;
    var majorCode = document.getElementById("majorCode").value;
    var grade = document.getElementById("grade").value;
    var beginTime = document.getElementById("beginTime").value;
    var endTime = document.getElementById("endTime").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "patent/listByCondition",
        data: {
            patentType: patentType,
            patentName: patentName,
            stuNumber: stuNumber,
            stuName: stuName,
            majorCode: majorCode,
            grade: grade,
            beginTime: beginTime,
            endTime: endTime,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            var datas = data.patentDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数authorMajor
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "patent/toDetail/" + result[i].id;
                        // cHtml += "<tr><td>" + result[i].patentType + "</td><td>" + result[i].patentName + "</td><td>"
                        //     + result[i].applyTimeStr + "</td><td class='td_table'><table class='sub'><tr><td><span>"
                        //     + result[i].applierName1 + "</span></td></tr><tr><td><span>" + result[i].applierName2 + "</span></td></tr><tr><td><span>" + result[i].applierName3 + "</span></td></tr><tr><td><span>"
                        //     + result[i].applierName4 + "</span></td></tr><tr><td><span>" + result[i].applierName5 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                        //     + result[i].applierMajor1 + "</span></td></tr><tr><td><span>" + result[i].applierMajor2 + "</span></td></tr><tr><td><span>" + result[i].applierMajor3 + "</span></td></tr><tr><td><span>"
                        //     + result[i].applierMajor4 + "</span></td></tr><tr><td><span>" + result[i].applierMajor5 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                        //     + result[i].applierStuNumber1 + "</span></td></tr><tr><td><span>" + result[i].applierStuNumber2 + "</span></td></tr><tr><td><span>" + result[i].applierStuNumber3 + "</span></td></tr><tr><td><span>"
                        //     + result[i].applierStuNumber4 + "</span></td></tr><tr><td><span>" + result[i].applierStuNumber5 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                        //     + acmt + "' >去往详情页</a></td><td><a class='delete_patent' id='" + result[i].id + "'>删除</a></td><tr>";
                        cHtml += "<tr><td>" + result[i].patentType + "</td><td>" + result[i].patentName + "</td><td>"
                            + result[i].applyTimeStr + "</td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].applierName1 + "</td></tr><tr><td>" + result[i].applierName2 + "</td></tr><tr><td>" + result[i].applierName3 + "</td></tr><tr><td>"
                            + result[i].applierName4 + "</td></tr><tr><td>" + result[i].applierName5 + "</td></tr></table></td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].applierMajor1 + "</td></tr><tr><td>" + result[i].applierMajor2 + "</td></tr><tr><td>" + result[i].applierMajor3 + "</td></tr><tr><td>"
                            + result[i].applierMajor4 + "</td></tr><tr><td>" + result[i].applierMajor5 + "</td></tr></table></td><td class='td_table'><table class='sub'><tr><td>"
                            + result[i].applierStuNumber1 + "</td></tr><tr><td>" + result[i].applierStuNumber2 + "</td></tr><tr><td>" + result[i].applierStuNumber3 + "</td></tr><tr><td>"
                            + result[i].applierStuNumber4 + "</td></tr><tr><td>" + result[i].applierStuNumber5 + "</td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete_patent' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_patent").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "patent/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//国创科研
function initdataScience() {
    var projectType = document.getElementById("projectType").value;
    var setYear = document.getElementById("setYear").value;
    var projectName = document.getElementById("projectName").value;
    var stuName = document.getElementById("stuName").value;
    var stuNumber = document.getElementById("stuNumber").value;
    var majorCode = document.getElementById("majorCode").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "scientificProject/listByCondition",
        data: {
            projectType: projectType,
            setYear: setYear,
            projectName: projectName,
            stuName: stuName,
            stuNumber: stuNumber,
            majorCode: majorCode,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            var datas = data.scientificProjectDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "scientificProject/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].projectType + "</td><td>" + result[i].projectName + "</td><td>"
                            + result[i].setYear + "</td><td>" + result[i].projectManName + "</td><td>" + result[i].projectManSex +
                            "</td><td>" + result[i].projectManStuNumber + "</td><td>" + result[i].projectManPhone + "</td><td>"
                            + result[i].projectManMajor + "</td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].projectMemberName1 + "</span></td></tr><tr><td><span>" + result[i].projectMemberName2 + "</span></td></tr><tr><td>"
                            + result[i].projectMemberName3 + "</span></td></tr><tr><td><span>" + result[i].projectMemberName4 + "</span></td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].projectMemberStuNumber1 + "</span></td></tr><tr><td><span>" + result[i].projectMemberStuNumber2 + "</span></td></tr><tr><td><span>" + result[i].projectMemberStuNumber3 + "</span></td></tr><tr><td><span>"
                            + result[i].projectMemberStuNumber4 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td>" + result[i].fundsLimit + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete delete_science' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_science").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "scientificProject/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//ACM
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
            var datas = data.acmPrizeDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "acm/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].hostUnit + "</td><td>" + result[i].prizeTimeStr + "</td><td>" + result[i].prizeLevel +
                            "</td><td>" + result[i].teamName + "</td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateName1 + "</span></td></tr><tr><td><span>" + result[i].teammateName2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateName3 + "</span></td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateStuNumber1 + "</span></td></tr><tr><td><span>" + result[i].teammateStuNumber2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateStuNumber3 + "</span></td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateMajor1 + "</span></td></tr><tr><td><span>" + result[i].teammateMajor2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateMajor3 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete delete_acm' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_acm").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "acm/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//数学建模
function initdataMath() {
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
        url: website + "mathModel/listByCondition",
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
            var datas = data.mathModelPrizeDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    console.log(result);
                    var cHtml = "";
                    for(var i in result) {
                        var mathd = website + "mathModel/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].hostUnit + "</td><td>" + result[i].prizeTimeStr + "</td><td>" + result[i].prizeLevel +
                            "</td><td>" + result[i].teamName + "</td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateName1 + "</span></td></tr><tr><td><span>" + result[i].teammateName2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateName3 + "</span></td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateStuNumber1 + "</span></td></tr><tr><td><span>" + result[i].teammateStuNumber2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateStuNumber3 + "</span></td></tr></table></td><td class='td_table hidecol'><table class='sub'><tr><td><span>"
                            + result[i].teammateMajor1 + "</span></td></tr><tr><td><span>" + result[i].teammateMajor2 + "</span></td></tr><tr><td><span>"
                            + result[i].teammateMajor3 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                            + mathd + "' >去往详情页</a></td><td><a class='delete_math' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_math").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "mathModel/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//挑战杯
function initdataCup() {
    var matchLevel = document.getElementById("matchLevel").value;
    var matchName = document.getElementById("matchName").value;
    var startTime = document.getElementById("startTime").value;
    var endTime = document.getElementById("endTime").value;
    var prizeLevel = document.getElementById("prizeLevel").value;
    var teamName = document.getElementById("teamName").value;
    var majorCode = document.getElementById("majorCode").value;
    var stuName = document.getElementById("stuName").value;
    var projectName = document.getElementById("projectName").value;
    var hostUnit = document.getElementById("hostUnit").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "ChallengeCup/listByCondition",
        data: {
            matchLevel: matchLevel,
            matchName: matchName,
            startTime: startTime,
            endTime: endTime,
            prizeLevel: prizeLevel,
            teamName: teamName,
            majorCode: majorCode,
            stuName: stuName,
            projectName: projectName,
            hostUnit: hostUnit,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            var datas = data.challengeCupDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数authorMajor
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "ChallengeCup/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].projectName + "</td><td>" + result[i].teamName + "</td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuName1 + "</span></td></tr><tr><td><span>" + result[i].stuName2 + "</span></td></tr><tr><td><span>" + result[i].stuName3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName4 + "</span></td></tr><tr><td><span>" + result[i].stuName5 + "</span></td></tr><tr><td><span>" + result[i].stuName6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName7 + "</span></td></tr><tr><td><span>" + result[i].stuName8 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuNumber1 + "</span></td></tr><tr><td><span>" + result[i].stuNumber2 + "</span></td></tr><tr><td><span>" + result[i].stuNumber3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber4 + "</span></td></tr><tr><td><span>" + result[i].stuNumber5 + "</span></td></tr><tr><td><span>" + result[i].stuNumber6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber7 + "</span></td></tr><tr><td><span>" + result[i].stuNumber8 + "</span></td></tr></table></td><td>" + result[i].prizeLevel + "</td><td>"
                            + result[i].prizeTimeStr + "</td><td>" + result[i].hostUnit + "</td><td>" + result[i].teacherName + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete_cup' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_cup").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "ChallengeCup/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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
//互联网+
function initdataInternet() {
    var matchLevel = document.getElementById("matchLevel").value;
    var matchName = document.getElementById("matchName").value;
    var startTime = document.getElementById("startTime").value;
    var endTime = document.getElementById("endTime").value;
    var prizeLevel = document.getElementById("prizeLevel").value;
    var teamName = document.getElementById("teamName").value;
    var majorCode = document.getElementById("majorCode").value;
    var stuName = document.getElementById("stuName").value;
    var projectName = document.getElementById("projectName").value;
    var hostUnit = document.getElementById("hostUnit").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "InternetPlus/listByCondition/",
        data: {
            matchLevel: matchLevel,
            matchName: matchName,
            startTime: startTime,
            endTime: endTime,
            prizeLevel: prizeLevel,
            teamName: teamName,
            majorCode: majorCode,
            stuName: stuName,
            projectName: projectName,
            hostUnit: hostUnit,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            var datas = data.internetPlusDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数authorMajor
                "callBack": function(result) {
                    var cHtml = "";
                    for(var i in result) {
                        var acmt = website + "InternetPlus/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].projectName + "</td><td>" + result[i].teamName + "</td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuName1 + "</span></td></tr><tr><td><span>" + result[i].stuName2 + "</span></td></tr><tr><td><span>" + result[i].stuName3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName4 + "</span></td></tr><tr><td><span>" + result[i].stuName5 + "</span></td></tr><tr><td><span>" + result[i].stuName6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName7 + "</span></td></tr><tr><td><span>" + result[i].stuName8 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuNumber1 + "</span></td></tr><tr><td><span>" + result[i].stuNumber2 + "</span></td></tr><tr><td><span>" + result[i].stuNumber3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber4 + "</span></td></tr><tr><td><span>" + result[i].stuNumber5 + "</span></td></tr><tr><td><span>" + result[i].stuNumber6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber7 + "</span></td></tr><tr><td><span>" + result[i].stuNumber8 + "</span></td></tr></table></td><td>" + result[i].prizeLevel + "</td><td>"
                            + result[i].prizeTimeStr + "</td><td>" + result[i].hostUnit + "</td><td>" + result[i].teacherName + "</td><td><a href='"
                            + acmt + "' >去往详情页</a></td><td><a class='delete_Internet' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_Internet").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "InternetPlus/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//其他比赛
function initdataOther() {
    var matchLevel = document.getElementById("matchLevel").value;
    var matchName = document.getElementById("matchName").value;
    var prizeLevel = document.getElementById("prizeLevel").value;
    var startTime = document.getElementById("startTime").value;
    var endTime = document.getElementById("endTime").value;
    var projectName = document.getElementById("projectName").value;
    var majorCode = document.getElementById("majorCode").value;
    var stuName = document.getElementById("stuName").value;
    var hostUnit = document.getElementById("hostUnit").value;
    var teacherName = document.getElementById("teacherName").value;
    $('.grid-item').remove();
    $.ajax({
        type: "get",
        url: website + "otherMatch/listByCondition",
        data: {
            matchLevel: matchLevel,
            matchName: matchName,
            startTime: startTime,
            endTime: endTime,
            projectName:projectName,
            prizeLevel: prizeLevel,
            majorCode: majorCode,
            stuName: stuName,
            hostUnit: hostUnit,
            teacherName: teacherName
        },
        dataType:"json",
        success: function(data, textStatus) {
            console.log(data);
            var datas = data.otherMatchDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    console.log(result);
                    var cHtml = "";
                    for(var i in result) {
                        var mathd = website + "otherMatch/toDetail/" + result[i].id;
                        cHtml += "<tr><td>" + result[i].matchLevel + "</td><td>" + result[i].matchName + "</td><td>"
                            + result[i].hostUnit + "</td><td>" + result[i].prizeTimeStr + "</td><td>" + result[i].prizeLevel +
                            "</td><td>" + result[i].projectName + "</td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuName1 + "</span></td></tr><tr><td><span>" + result[i].stuName2 + "</span></td></tr><tr><td><span>" + result[i].stuName3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName4 + "</span></td></tr><tr><td><span>" + result[i].stuName5 + "</span></td></tr><tr><td><span>" + result[i].stuName6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuName7 + "</span></td></tr><tr><td><span>" + result[i].stuName8 + "</span></td></tr></table></td><td class='td_table'><table class='sub'><tr><td><span>"
                            + result[i].stuNumber1 + "</span></td></tr><tr><td><span>" + result[i].stuNumber2 + "</span></td></tr><tr><td><span>" + result[i].stuNumber3 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber4 + "</span></td></tr><tr><td><span>" + result[i].stuNumber5 + "</span></td></tr><tr><td><span>" + result[i].stuNumber6 + "</span></td></tr><tr><td><span>"
                            + result[i].stuNumber7 + "</span></td></tr><tr><td><span>" + result[i].stuNumber8 + "</span></td></tr></table></td><td>" + result[i].teacherName + "</td><td><a href='"
                            + mathd + "' >去往详情页</a></td><td><a class='delete_other' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_other").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "otherMatch/falseDeleteById/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

//学生信息
function initdataStudent() {
    var stuNumber = document.getElementById("stuNumber").value;
    var name = document.getElementById("name").value;
    var sex = document.getElementById("sex").value;
    var grade = document.getElementById("grade").value;
    var majorCode = document.getElementById("majorCode").value;
    var phone = document.getElementById("phone").value;

    $.ajax({
        type: "get",
        url: website + "student/query/by/condition",
        data: {
            stuNumber: stuNumber,
            name: name,
            sex: sex,
            grade: grade,
            majorCode: majorCode,
            phone: phone
        },
        dataType:"json",
        success: function(data, textStatus) {
            console.log(data);
            var datas = data.studentDtoList;
            options = {
                "id": "page", //显示页码的元素
                "data": datas, //显示数据
                "maxshowpageitem": max, //最多显示的页码个数
                "pagelistcount": pagelistc, //每页显示数据个数
                "callBack": function(result) {
                    console.log(result);
                    var cHtml = "";
                    for(var i in result) {
                        cHtml += "<tr><td>" + result[i].stuNumber + "</td><td>" + result[i].name + "</td><td>"
                            + result[i].sex + "</td><td>" + result[i].grade + "</td><td>" + result[i].major +
                            "</td><td>" + result[i].phone + "</td><td><a class='delete_student' id='" + result[i].id + "'>删除</a></td><tr>";
                    }
                    $(".grid-body").html(cHtml);

                    $(".delete_student").click(function (e) {
                        var id = $(e.target).attr("id");
                        $.ajax({
                            type: 'post',
                            url:  website + "student/delete/by/stuNumber/" + id,
                            data: {id: id},
                            dataType: "text",
                            success: function (msg) {
                                var msg = parseInt(msg);
                                if (msg == 1) {
                                    alert("删除成功!");
                                    $("#" + id).parent().parent().remove();
                                }
                                else if (msg == -1) {
                                    alert("删除失败!");
                                }
                            },
                            error: function (msg) {
                                alert("error!");
                            },
                            traditional: true
                        });
                    });
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

