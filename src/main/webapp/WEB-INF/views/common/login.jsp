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
					<form class="layui-form" id="loginForm">
						<div class="layui-form-item">
							<input type="text" name="username" id="username" autocomplete="off" placeholder="请输入用户名" class="layui-input">
						</div>
						<div class="layui-form-item">
							<input type="password" name="password" id="password" autocomplete="off" placeholder="请输入密码" class="layui-input">
						</div>
						<div class="layui-form-item">
							<button class="layui-btn layui-btn-primary" id="login">js登录</button>
						</div>
					</form>
					<%--<a href="${website}register/toRegister">新用户注册</a>--%>
				</div>
				<footer>
					<p>东北师范大学@信息科学与技术学院</p>
				</footer>
			</div>
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/layui/layui.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/sccl.js"></script>

	</body>

</html>