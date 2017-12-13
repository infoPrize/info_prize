$(document).ready(function() {  
    $('#sort').click(function () {  
        var type = $('#type').val();  
        var time = $('#time').val();  
        var profession = $('#profession').val();  
        var tutor = $('#tutor').val(); 
        var student_name = $('#student_name').val(); 
        var student_number = $('#student_number').val(); 
        var project_name = $('#project_name').val(); 
       
        var tbody=window.document.getElementById("tbody-result");  
  
        $.ajax({  
            type: "get",  
            url: "country.json",
            dataType: "json",  
            data: {  
                type: type,  
                time: time,  
                profession: profession,  
                tutor: tutor,
                student_name: student_name,
                student_number: student_number,
                project_name: project_name
            },  
            success: function (msg) {  
                if (msg.ret) {  
                    var str = "";  
                    var data = msg.data;  
  
                    for (var i in data) {  
                        str += "<tr>" +  
                        "<td>" + data[i].projectType + "</td>" +  
                        "<td>" + data[i].projectName + "</td>" +  
                        "<td>" + data[i].setYear + "</td>" +  
                        "<td>" + data[i].projectManName + "</td>" +  
                        "<td>" + data[i].projectManSex + "</td>" +  
                        "<td>" + data[i].projectManStuNumber + "</td>" +  
                        "<td>" + data[i].projectManPhone + "</td>" +  
                        "<td>" + data[i].projectManMajor + "</td>" +  
                        "<td>" + 
                        	"<table>"+
                        		"<tr>"+
                        			"<td>"+data[i].projectMemberName1+"</td>"+
                        			"<td>"+data[i].projectMemberName2+"</td>"+
                        			"<td>"+data[i].projectMemberName3+"</td>"+
                        			"<td>"+data[i].projectMemberName4+"</td>"+
                        		"</tr>"+
                        	"</table>"+		
                        "</td>" +
                        "<td>" + 
                        	"<table>"+
                        		"<tr>"+
                        			"<td>"+data[i].projectMemberStuNumber1+"</td>"+
                        			"<td>"+data[i].projectMemberStuNumber2+"</td>"+
                        			"<td>"+data[i].projectMemberStuNumber3+"</td>"+
                        			"<td>"+data[i].projectMemberStuNumber4+"</td>"+
                        		"</tr>"+
                        	"</table>"+		
                        "</td>" +
                        "<td>" + data[i].teacherName + "</td>" +  
                        "<td>" + data[i].fundsLimit + "</td>" +  
                        "</tr>";  
                    }  
                    $("#tbody-result").innerHTML = str;  
                }  
            },  
            error: function () {  
                alert("查询失败");
            } ,
            traditional: true
        });  
    });  
});  