/**
 * Created by liujing on 2017/12/19.
 */
$(function(){
    // 网站地址 - 本地开发
    var website = "http://infoprize.nenu.edu.cn/";

    //网站地址 - 服务器开发
    // var website = "http://120.78.154.246/";

    //网站地址 - 服务器开发(带项目名)
    // var website = "http://120.78.154.246/info_prize/";

    // 添加论文信息
    $("#sort_thesis").click(function(){
        var journalName = $('#journalName').val();
        var journalLevel = $('#journalLevel').val();
        var thesisTitle = $('#thesisTitle').val();
        var publishTime = $('#publishTime').val();
        var authorName1 = $('#authorName1').val();
        var authorStuNumber1 = $('#authorStuNumber1').val();
        var authorLevel1 = $('#authorLevel1').val();
        var authorName2 = $('#authorName2').val();
        var authorStuNumber2 = $('#authorStuNumber2').val();
        var authorLevel2 = $('#authorLevel2').val();
        var authorName3 = $('#authorName3').val();
        var authorStuNumber3 = $('#authorStuNumber3').val();
        var authorLevel3 = $('#authorLevel3').val();
        var authorName4 = $('#authorName4').val();
        var authorStuNumber4 = $('#authorStuNumber4').val();
        var authorLevel4 = $('#authorLevel4').val();
        var authorName5 = $('#authorName5').val();
        var authorStuNumber5 = $('#authorStuNumber5').val();
        var authorLevel5 = $('#authorLevel5').val();
        var teacherName = $('#teacherName').val();
        var thesisAbstract = $('#thesisAbstract').val();
        console.log(website);
        $.ajax({
            type: 'post',
            url: website + "thesis/add",
            dataType: "text",
            data:{
                journalName: journalName,
                journalLevel: journalLevel,
                thesisTitle: thesisTitle,
                publishTime: publishTime,
                authorName1: authorName1,
                authorStuNumber1: authorStuNumber1,
                authorLevel1: authorLevel1,
                authorName2: authorName2,
                authorStuNumber2: authorStuNumber2,
                authorLevel2: authorLevel2,
                authorName3: authorName3,
                authorStuNumber3: authorStuNumber3,
                authorLevel3: authorLevel3,
                authorName4: authorName4,
                authorStuNumber4: authorStuNumber4,
                authorLevel4: authorLevel4,
                authorName5: authorName5,
                authorStuNumber5: authorStuNumber5,
                authorLevel5: authorLevel5,
                teacherName: teacherName,
                thesisAbstract: thesisAbstract
            },
            success: function (msg) {
                console.log(msg);
                msg = parseInt(msg);
                if (msg == 1) {
                    alert("插入成功!");
                    window.location.reload();
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
    $("#sortpatent").click(function(){
        var patentType = $('#patentType').val();
        var patentName = $('#patentName').val();
        var applyTime = $('#applyTime').val();
        var applierName1 = $('#applierName1').val();
        var applierStuNumber1 = $('#applierStuNumber1').val();
        var applierName2 = $('#applierName2').val();
        var applierStuNumber2 = $('#applierStuNumber2').val();
        var applierName3 = $('#applierName3').val();
        var applierStuNumber3 = $('#applierStuNumber3').val();
        var applierName4 = $('#applierName4').val();
        var applierStuNumber4 = $('#applierStuNumber4').val();
        var applierName5 = $('#applierName5').val();
        var applierStuNumber5 = $('#applierStuNumber5').val();
        var teacherName = $('#teacherName').val();
        var thesisAbstract = $('#thesisAbstract').val();
        console.log(website);
        $.ajax({
            type: 'post',
            url: website + "patent/add",
            dataType: "text",
            data:{
                patentType: patentType,
                patentName: patentName,
                applyTime: applyTime,
                applierName1: applierName1,
                applierStuNumber1: applierStuNumber1,
                applierName2: applierName2,
                applierStuNumber2: applierStuNumber2,
                applierName3: applierName3,
                applierStuNumber3: applierStuNumber3,
                applierName4: applierName4,
                applierStuNumber4: applierStuNumber4,
                applierName5: applierName5,
                applierStuNumber5: applierStuNumber5,
                teacherName: teacherName,
                patentIntroduce: patentIntroduce
            },
            success: function (msg) {
                console.log(msg);
                msg = parseInt(msg);
                if (msg == 7) {
                    alert("插入成功!");
                    window.location.reload();
                }
                else if (msg == 1){
                    alert("申请者1姓名学号不匹配!");
                }
                else if (msg == 2){
                    alert("申请者2姓名学号不匹配!");
                }
                else if (msg == 3){
                    alert("申请者3姓名学号不匹配!");
                }
                else if (msg == 4){
                    alert("申请者4姓名学号不匹配!");
                }
                else if (msg == 5){
                    alert("申请者5姓名学号不匹配!");
                }
                else if (msg == 6){
                    alert("教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

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
                    window.location.reload();
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
                    window.location.reload();
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
                    window.location.reload();
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

    //添加挑战杯信息
    $("#sort_comp").click(function(){
        var matchName = $('#matchName').val();
        var hostUnit = $('#hostUnit').val();
        var matchLevel = $('#matchLevel').val();
        var prizeLevel = $('#prizeLevel').val();
        var prizeTime = $('#prizeTime').val();
        var projectName = $('#projectName').val();
        var teamName = $('#teamName').val();
        var teammateName1 = $('#teammateName1').val();
        var teammateStuNumber1 = $('#teammateStuNumber1').val();
        var teammateName2 = $('#teammateName2').val();
        var teammateStuNumber2 = $('#teammateStuNumber2').val();
        var teammateName3 = $('#teammateName3').val();
        var teammateStuNumber3 = $('#teammateStuNumber3').val();
        var teammateName4 = $('#teammateName4').val();
        var teammateStuNumber4 = $('#teammateStuNumber4').val();
        var teammateName5 = $('#teammateName5').val();
        var teammateStuNumber5 = $('#teammateStuNumber5').val();
        var teammateName6 = $('#teammateName6').val();
        var teammateStuNumber6 = $('#teammateStuNumber6').val();
        var teammateName7 = $('#teammateName7').val();
        var teammateStuNumber7 = $('#teammateStuNumber7').val();
        var teammateName8 = $('#teammateName8').val();
        var teammateStuNumber8 = $('#teammateStuNumber8').val();
        var teacherName = $('#teacherName').val();
        $.ajax({
            type: 'post',
            url: website + "ChallengeCup/add",
            dataType: "text",
            data:{
                matchName: matchName,
                hostUnit: hostUnit,
                matchLevel: matchLevel,
                prizeLevel: prizeLevel,
                prizeTime: prizeTime,
                projectName: projectName,
                teamName: teamName,
                teammateName1: teammateName1,
                teammateStuNumber1: teammateStuNumber1,
                teammateName2: teammateName2,
                teammateStuNumber2: teammateStuNumber2,
                teammateName3: teammateName3,
                teammateStuNumber3: teammateStuNumber3,
                teammateName4: teammateName4,
                teammateStuNumber4: teammateStuNumber4,
                teammateName5: teammateName5,
                teammateStuNumber5: teammateStuNumber5,
                teammateName6: teammateName6,
                teammateStuNumber6: teammateStuNumber6,
                teammateName7: teammateName7,
                teammateStuNumber7: teammateStuNumber7,
                teammateName8: teammateName8,
                teammateStuNumber8: teammateStuNumber8,
                teacherName: teacherName
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 10) {
                    alert("插入成功!");
                    window.location.reload();
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
                    alert("队员4的姓名学号不匹配!");
                }
                else if (msg == 5){
                    alert("队员5的姓名学号不匹配!");
                }
                else if (msg == 6){
                    alert("队员6的姓名学号不匹配!");
                }
                else if (msg == 7){
                    alert("队员7的姓名学号不匹配!");
                }
                else if (msg == 8){
                    alert("队员8的姓名学号不匹配!");
                }
                else if (msg == 9){
                    alert("该教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    //添加互联网+信息
    $("#sort_int").click(function(){
        var matchName = $('#matchName').val();
        var hostUnit = $('#hostUnit').val();
        var matchLevel = $('#matchLevel').val();
        var prizeLevel = $('#prizeLevel').val();
        var prizeTime = $('#prizeTime').val();
        var projectName = $('#projectName').val();
        var teamName = $('#teamName').val();
        var teammateName1 = $('#teammateName1').val();
        var teammateStuNumber1 = $('#teammateStuNumber1').val();
        var teammateName2 = $('#teammateName2').val();
        var teammateStuNumber2 = $('#teammateStuNumber2').val();
        var teammateName3 = $('#teammateName3').val();
        var teammateStuNumber3 = $('#teammateStuNumber3').val();
        var teammateName4 = $('#teammateName4').val();
        var teammateStuNumber4 = $('#teammateStuNumber4').val();
        var teammateName5 = $('#teammateName5').val();
        var teammateStuNumber5 = $('#teammateStuNumber5').val();
        var teammateName6 = $('#teammateName6').val();
        var teammateStuNumber6 = $('#teammateStuNumber6').val();
        var teammateName7 = $('#teammateName7').val();
        var teammateStuNumber7 = $('#teammateStuNumber7').val();
        var teammateName8 = $('#teammateName8').val();
        var teammateStuNumber8 = $('#teammateStuNumber8').val();
        var teacherName = $('#teacherName').val();
        $.ajax({
            type: 'post',
            url: website + "InternetPlus/add",
            dataType: "text",
            data:{
                matchName: matchName,
                hostUnit: hostUnit,
                matchLevel: matchLevel,
                prizeLevel: prizeLevel,
                prizeTime: prizeTime,
                projectName: projectName,
                teamName: teamName,
                teammateName1: teammateName1,
                teammateStuNumber1: teammateStuNumber1,
                teammateName2: teammateName2,
                teammateStuNumber2: teammateStuNumber2,
                teammateName3: teammateName3,
                teammateStuNumber3: teammateStuNumber3,
                teammateName4: teammateName4,
                teammateStuNumber4: teammateStuNumber4,
                teammateName5: teammateName5,
                teammateStuNumber5: teammateStuNumber5,
                teammateName6: teammateName6,
                teammateStuNumber6: teammateStuNumber6,
                teammateName7: teammateName7,
                teammateStuNumber7: teammateStuNumber7,
                teammateName8: teammateName8,
                teammateStuNumber8: teammateStuNumber8,
                teacherName: teacherName
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 10) {
                    alert("插入成功!");
                    window.location.reload();
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
                    alert("队员4的姓名学号不匹配!");
                }
                else if (msg == 5){
                    alert("队员5的姓名学号不匹配!");
                }
                else if (msg == 6){
                    alert("队员6的姓名学号不匹配!");
                }
                else if (msg == 7){
                    alert("队员7的姓名学号不匹配!");
                }
                else if (msg == 8){
                    alert("队员8的姓名学号不匹配!");
                }
                else if (msg == 9){
                    alert("该教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加其他比赛信息
    $("#sort_other").click(function(){
        var matchName = $('#matchName').val();
        var hostUnit = $('#hostUnit').val();
        var matchLevel = $('#matchLevel').val();
        var prizeLevel = $('#prizeLevel').val();
        var prizeTime = $('#prizeTime').val();
        var projectName = $('#projectName').val();
        var teamName = $('#teamName').val();
        var teammateName1 = $('#teammateName1').val();
        var teammateStuNumber1 = $('#teammateStuNumber1').val();
        var teammateName2 = $('#teammateName2').val();
        var teammateStuNumber2 = $('#teammateStuNumber2').val();
        var teammateName3 = $('#teammateName3').val();
        var teammateStuNumber3 = $('#teammateStuNumber3').val();
        var teammateName4 = $('#teammateName4').val();
        var teammateStuNumber4 = $('#teammateStuNumber4').val();
        var teammateName5 = $('#teammateName5').val();
        var teammateStuNumber5 = $('#teammateStuNumber5').val();
        var teammateName6 = $('#teammateName6').val();
        var teammateStuNumber6 = $('#teammateStuNumber6').val();
        var teammateName7 = $('#teammateName7').val();
        var teammateStuNumber7 = $('#teammateStuNumber7').val();
        var teammateName8 = $('#teammateName8').val();
        var teammateStuNumber8 = $('#teammateStuNumber8').val();
        var teacherName = $('#teacherName').val();
        $.ajax({
            type: 'post',
            url: website + "otherMatch/add",
            dataType: "text",
            data:{
                matchName: matchName,
                hostUnit: hostUnit,
                matchLevel: matchLevel,
                prizeLevel: prizeLevel,
                prizeTime: prizeTime,
                projectName: projectName,
                teamName: teamName,
                teammateName1: teammateName1,
                teammateStuNumber1: teammateStuNumber1,
                teammateName2: teammateName2,
                teammateStuNumber2: teammateStuNumber2,
                teammateName3: teammateName3,
                teammateStuNumber3: teammateStuNumber3,
                teammateName4: teammateName4,
                teammateStuNumber4: teammateStuNumber4,
                teammateName5: teammateName5,
                teammateStuNumber5: teammateStuNumber5,
                teammateName6: teammateName6,
                teammateStuNumber6: teammateStuNumber6,
                teammateName7: teammateName7,
                teammateStuNumber7: teammateStuNumber7,
                teammateName8: teammateName8,
                teammateStuNumber8: teammateStuNumber8,
                teacherName: teacherName
            },
            success: function (msg) {
                msg = parseInt(msg);
                if (msg == 10) {
                    alert("插入成功!");
                    window.location.reload();
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
                    alert("队员4的姓名学号不匹配!");
                }
                else if (msg == 5){
                    alert("队员5的姓名学号不匹配!");
                }
                else if (msg == 6){
                    alert("队员6的姓名学号不匹配!");
                }
                else if (msg == 7){
                    alert("队员7的姓名学号不匹配!");
                }
                else if (msg == 8){
                    alert("队员8的姓名学号不匹配!");
                }
                else if (msg == 9){
                    alert("该教师不存在!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });

    // 添加学生信息
//  $("#sort_student").click(function(){
//      var stuNumber = $('#stuNumber').val();
//      var name = $('#name').val();
//      var sex = $('#sex').val();
//      var grade = $('#grade').val();
//      var profession = $('#profession').val();
//      var phone = $('#phone').val();
//      $.ajax({
//          type: 'post',
//          url: website + "mathModel/add",
//          dataType: "text",
//          data:{
//              stuNumber:stuNumber,
//              name:name,
//              sex:sex,
//              grade:grade,
//              profession:profession,
//              phone:phone
//          },
//          success: function (msg) {
//              msg = parseInt(msg);
//              if (msg == 5) {
//                  alert("插入成功!");
//              }
//              else if (msg == -1) {
//                  alert("输入错误!");
//              }
//              else if (msg == 1){
//                  alert("学号已存在!");
//              }
//
//          },
//          error: function (msg) {
//              alert("error!");
//          } ,
//          traditional: true
//      });
//  });
    //添加教师
    $("#sort_teacher").click(function(){
        var teacherName = $("#teacherName").val();
        var teacherLevel = $("#teacherLevel").val();
        var phone = $("#phone").val();
        $.ajax({
            type: 'post',
            url: website + "teacher/add",
            dataType: "text",
            data:{
                teacherName: teacherName,
                teacherLevel: teacherLevel,
                phone: phone
            },
            success: function (msg) {
                console.log(msg);
                msg = parseInt(msg);
                if (msg == 1) {
                    alert("插入成功!");
                    window.location.reload();
                }
                else if (msg == 2) {
                    alert("请输入教师姓名!");
                }
                else if (msg == 3){
                    alert("请选择教师等级!");
                }
            },
            error: function (msg) {
                alert("error!");
            } ,
            traditional: true
        });
    });
    // 导入excel
    $("#file").change(function(){  // 当 id 为 file 的对象发生变化时
        var fileSize = this.files[0].size;
        var size = fileSize / 1024 / 1024;
        if (size > 5) {
            alert("附件不能大于5M,请将文件压缩后重新上传！");
            this.value="";
            return false;
        }else{
            $("#file_name").val($("#file").val());  //将 #file 的值赋给 #file_name
        }
    });
    $("#define").click(function (e) {
        if($("#file_name").val()==null||$("#file_name").val()==""){
            e.preventDefault();
            alert("请先导入文件！");
        }
    });
    $("#sort_student").click(function (e) {
        if($("#stuNumber").val()==null||$("#stuNumber").val()==""){
            e.preventDefault();
            alert("请填写信息！");
        }
    });

});
