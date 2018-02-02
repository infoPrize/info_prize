<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html xmlns:jsp="http://java.sun.com/jsf/html">
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta name="keywords" content="scclui框架">
	<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>首页</title>
	  <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
	  <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
  </head>
  
  <body>
	首页<br>

	<h3>互联网+:</h3><br>
	<a href="${website}internet_plus_add_test.jsp"><h4>互联网+添加</h4></a><br>
	<a href="${website}internet_plus_listByCondition_test.jsp"><h4>按条件查询互联网+信息</h4></a><br><br><br>


  	<h3>挑战杯:</h3><br>
	<a href="${website}challenge_cup_add_test.jsp"><h4>挑战杯添加</h4></a><br>
	<a href="${website}challenge_cup_listByCondition_test.jsp"><h4>按条件查询挑战杯信息</h4></a>

  </body>
</html>
