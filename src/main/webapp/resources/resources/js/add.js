/**
 * Created by liujing on 2017/12/19.
 */
$(function(){
    // 网站地址 - 本地开发
    var website = "http://infoprize.nenu.edu.cn/";

    //网站地址 - 服务器开发
    // var website = "http://120.78.154.246/info_prize/";

    // 添加论文信息
    $("#sort_thesis").click(function(){
        var journameName = $('#journameName').val();
        var journalLevel = $('#journalLevel').val();
        var thesisTitle = $('#thesisTitle').val();
        var publishTime = $('#publishTime').val();
        var authorName1 = $('#authorName1').val();
        var authorStuNumber1 = $('#authorStuNumber1').val();
        var authorName2 = $('#authorName2').val();
        var authorStuNumber2 = $('#authorStuNumber2').val();
        var authorName3 = $('#authorName3').val();
        var authorStuNumber3 = $('#authorStuNumber3').val();
        var authorName4 = $('#authorName4').val();
        var authorStuNumber4 = $('#authorStuNumber4').val();
        var authorName5 = $('#authorName5').val();
        var authorStuNumber5 = $('#authorStuNumber5').val();
        var thesisAbstract = $('#thesisAbstract').val();
        console.log(website);
        $.ajax({
            type: 'post',
            url: website + "thesis/add",
            dataType: "text",
            data:{
                journameName: journameName,
                journalLevel: journalLevel,
                thesisTitle: thesisTitle,
                publishTime: publishTime,
                authorName1: authorName1,
                authorStuNumber1: authorStuNumber1,
                authorName2: authorName2,
                authorStuNumber2: authorStuNumber2,
                authorName3: authorName3,
                authorStuNumber3: authorStuNumber3,
                authorName4: authorName4,
                authorStuNumber4: authorStuNumber4,
                authorName5: authorName5,
                authorStuNumber5: authorStuNumber5,
                thesisAbstract: thesisAbstract
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 1) {
                    alert("插入成功!");
                }
                else if (msg == 2){
                    alert("第一位学生学号姓名不匹配!");
                }
                else if (msg == 3){
                    alert("第二位学生学号姓名不匹配!");
                }
                else if (msg == 4){
                    alert("第三位学生学号姓名不匹配!");
                }
                else if (msg == 5){
                    alert("第四位学生学号姓名不匹配!");
                }
                else if (msg == 6){
                    alert("第五位学生学号姓名不匹配!");
                }
                else if (msg == 7){
                    alert("教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加专利信息

    // 添加国创科研信息
    $("#sort_scient").click(function(){
        var projectName = $('#projectName').val();
        var projectType = $('#projectType').val();
        var setYear = $('#setYear').val();
        var projectManName = $('#projectManName').val();
        var projectManStuNumber = $('#projectManStuNumber').val();
        var teacherName = $('#teacherName').val();
        var projectMemberName1 = $('#projectMemberName1').val();
        var projectMemberStuNumber1 = $('#projectMemberStuNumber1').val();
        var projectMemberName2 = $('#projectMemberName2').val();
        var projectMemberStuNumber2 = $('#projectMemberStuNumber2').val();
        var projectMemberName3 = $('#projectMemberName3').val();
        var projectMemberStuNumber3 = $('#projectMemberStuNumber3').val();
        var projectMemberName4 = $('#projectMemberName4').val();
        var projectMemberStuNumber4 = $('#projectMemberStuNumber4').val();
        var fundsLimit = $('#fundsLimit').val();
        var projectIntroduce = $('#projectIntroduce').val();
        $.ajax({
            type: 'post',
            url: website + "scientificProject/add",
            dataType: "text",
            data:{
                projectName: projectName,
                projectType: projectType,
                setYear: setYear,
                projectManName: projectManName,
                projectManStuNumber: projectManStuNumber,
                teacherName: teacherName,
                projectMemberName1: projectMemberName1,
                projectMemberStuNumber1: projectMemberStuNumber1,
                projectMemberName2: projectMemberName2,
                projectMemberStuNumber2: projectMemberStuNumber2,
                projectMemberName3: projectMemberName3,
                projectMemberStuNumber3: projectMemberStuNumber3,
                projectMemberName4: projectMemberName4,
                projectMemberStuNumber4: projectMemberStuNumber4,
                fundsLimit: fundsLimit,
                projectIntroduce: projectIntroduce
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == -1) {
                    alert("学号输入错误!");
                }
                else if (msg == 0) {
                    alert("项目负责人学号姓名不匹配");
                }
                else if (msg == 1){
                    alert("成员1学号姓名不匹配!");
                }
                else if (msg == 2){
                    alert("成员2学号姓名不匹配!");
                }
                else if (msg == 3){
                    alert("成员3学号姓名不匹配!");
                }
                else if (msg == 4){
                    alert("成员4学号姓名不匹配!");
                }
                else if (msg == 5){
                    alert("指导教师姓名错误!");
                }
                else if (msg == 6){
                    alert("添加成功!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加ACM信息
    $("#sort_ACM").click(function(){
        var matchLevel = $('#matchLevel').val();
        var matchName = $('#matchName').val();
        var prizeTime = $('#prizeTime').val();
        var prizeLevel = $('#prizeLevel').val();
        var hostUnit = $('#hostUnit').val();
        var teamName = $('#teamName').val();
        var teammateName1 = $('#teammateName1').val();
        var teammateStuNumber1 = $('#teammateStuNumber1').val();
        var teammateName2 = $('#teammateName2').val();
        var teammateStuNumber2 = $('#teammateStuNumber2').val();
        var teammateName3 = $('#teammateName3').val();
        var teammateStuNumber3 = $('#teammateStuNumber3').val();
        var teacherName = $('#teacherNameACM').val();
        $.ajax({
            type: 'post',
            url: website + "acm/add",
            dataType: "text",
            data:{
                matchLevel: matchLevel,
                matchName: matchName,
                prizeTime: prizeTime,
                prizeLevel: prizeLevel,
                hostUnit: hostUnit,
                teamName: teamName,
                teammateName1: teammateName1,
                teammateStuNumber1: teammateStuNumber1,
                teammateName2: teammateName2,
                teammateStuNumber2: teammateStuNumber2,
                teammateName3: teammateName3,
                teammateStuNumber3: teammateStuNumber3,
                teacherName: teacherName
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 5) {
                    alert("插入成功!");
                }
                else if (msg == -1) {
                    alert("输入错误!");
                }
                else if (msg == 1){
                    alert("队员1的姓名学号不匹配!");
                }
                else if (msg == 2){
                    alert("队员2的姓名学号不匹配!");
                }
                else if (msg == 3){
                    alert("队员3的姓名学号不匹配!");
                }
                else if (msg == 4){
                    alert("该教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加数学建模信息
    $("#sort_math").click(function(){
        var matchLevel = $('#matchLevel').val();
        var matchName = $('#matchName').val();
        var prizeTime = $('#prizeTime').val();
        var prizeLevel = $('#prizeLevel').val();
        var hostUnit = $('#hostUnit').val();
        var teamName = $('#teamName').val();
        var teammateName1 = $('#teammateName1').val();
        var teammateStuNumber1 = $('#teammateStuNumber1').val();
        var teammateName2 = $('#teammateName2').val();
        var teammateStuNumber2 = $('#teammateStuNumber2').val();
        var teammateName3 = $('#teammateName3').val();
        var teammateStuNumber3 = $('#teammateStuNumber3').val();
        var teacherName = $('#teacherName').val();
        $.ajax({
            type: 'post',
            url: website + "mathModel/add",
            dataType: "text",
            data:{
                matchLevel: matchLevel,
                matchName: matchName,
                prizeTime: prizeTime,
                prizeLevel: prizeLevel,
                hostUnit: hostUnit,
                teamName: teamName,
                teammateName1: teammateName1,
                teammateStuNumber1: teammateStuNumber1,
                teammateName2: teammateName2,
                teammateStuNumber2: teammateStuNumber2,
                teammateName3: teammateName3,
                teammateStuNumber3: teammateStuNumber3,
                teacherName: teacherName
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 5) {
                    alert("插入成功!");
                }
                else if (msg == -1) {
                    alert("输入错误!");
                }
                else if (msg == 1){
                    alert("队员1的姓名学号不匹配!");
                }
                else if (msg == 2){
                    alert("队员2的姓名学号不匹配!");
                }
                else if (msg == 3){
                    alert("队员3的姓名学号不匹配!");
                }
                else if (msg == 4){
                    alert("该教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加专业竞赛信息

    // 添加其他比赛信息
});