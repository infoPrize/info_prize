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
		<title>首页</title>

		<link rel="stylesheet" href="${staticWebsite}resources/layui/css/layui.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/sccl.css">

	</head>

	<body class="login-bg">
		<div id="login-box">
			<div class="login-box">
				<header>
					<h1>信息科学与技术学院奖项查询系统</h1>
				</header>
				<div class="login-main">
					<form action="${website}login/checkLogin" class="layui-form" method="post">
						<input name="__RequestVerificationToken" type="hidden" value="">
						<div class="layui-form-item">
							<input type="text" name="username" lay-verify="userName" autocomplete="off" placeholder="请输入用户名" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input">
						</div>
						<div class="layui-form-item">
							<button class="submit layui-btn layui-btn-primary" lay-submit="" lay-filter="login"> 登录</button>
						</div>
					</form>
				</div>
				<footer>
					<p>东北师范大学@信息科学与技术学院</p>
				</footer>
			</div>
		</div>
		<script type="text/html" id="code-temp">
			<div class="login-code-box">
				<input type="text" class="layui-input" id="code" />
				<img id="valiCode" src="/manage/validatecode?v=636150612041789540" alt="验证码" />
			</div>
		</script>
		<script src="${staticWebsite}resources/layui/layui.js"></script>
	</body>

</html>