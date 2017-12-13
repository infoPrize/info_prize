$(document).ready(function(){
	$.ajax({
		type:"get",
		url:"/resources/resources/js/competition.json",
		dataType:"json",
		data:"",
		success:function(data){
			var option="";
			$.each(data,function(i,o){
				option+="<option id="+o.id+">"+o.name+"</option>";
			})
			$("#level").append(option);
		}
	})

	$("#level").change(function(){
		$("#type").empty();
		$("#type").append("<option>---请选择比赛类别---</option>");
		var thisId=$(this).find("option:selected").attr("id");
		$.ajax({
			type:"get",
			url:"/resources/resources/js/competition.json",
			dataType:"json",
			data:"",
			success:function(data){
				$.each(data,function(i,value){
					if(value.id==thisId){
						var type="";
						$.each(value.items,function(i,o){
							type+="<option id="+o.id+">"+o.name+"</option>";
						});
						$("#type").append(type);
					}
				})
			}
		})
	})
})