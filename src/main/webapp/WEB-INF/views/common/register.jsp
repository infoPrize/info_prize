<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<meta name="keywords" content="scclui框架">
		<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
		<title>注册</title>

		<link rel="stylesheet" href="${staticWebsite}resources/css/layui.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/sccl.css">
		<style type="text/css">
			.passagain_right{
				display: none;
			}
			.passagain_error{
				color: red;
			    position: relative;
			    top: -30px;
			    left: 300px;
			}
		</style>
	</head>

	<body class="login-bg">
		<div id="login-box">
			<div class="login-box">
				<header>
					<h1>信息科学与技术学院奖项查询系统</h1>
				</header>
				<div class="login-main">
					<form action="${website}register/register" class="layui-form" method="post">
						<input name="__RequestVerificationToken" type="hidden" value="">
						<div class="layui-form-item">
							<input type="text" name="stuName" lay-verify="stuName" autocomplete="off" placeholder="请输入姓名" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="text" name="stuNumber" lay-verify="stuNumber" autocomplete="off" placeholder="请输入学号" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input" id="pass">
						</div>
						<div class="layui-form-item">
							<input type="password" name="surePassword" lay-verify="password" autocomplete="off" placeholder="再次确认密码" class="layui-input" id="passagain">
							<span class="passagain_right">两次输入密码不一致</span>
						</div>
						<div class="layui-form-item">
							<button class="submit layui-btn layui-btn-primary" lay-submit="" lay-filter="register"> 注册</button>
						</div>
					</form>
				</div>
				<footer style="margin-top: 100px;">
					<p>东北师范大学@信息科学与技术学院</p>
				</footer>
			</div>
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js" ></script>
		<script src="${staticWebsite}resources/js/layui.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".submit").click(function(e){
					if($("#passagain").val()!=$("#pass").val()){
						$("span").removeClass("passagain_right").addClass("passagain_error");
						e.preventDefault();
						$(".submit").css("margin-top","-20px");
					}
				})
			})
		</script>
	</body>

</html>