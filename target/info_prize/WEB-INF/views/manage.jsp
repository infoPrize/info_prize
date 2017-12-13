<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
  <head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>权限管理</title>
	  <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
	  <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
  </head>
  
  <body>
		<div class="container">
			<div class="">
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h3>权限管理</h3>
								<hr/>
							</div>
							<div class="x_content">
								<table id="datatable" class="table table-striped table-bordered text-center">
									<thead>
										<tr>
											<th class="text-center">学号</th>
											<th class="text-center">姓名</th>
											<th class="text-center">学生组织职位</th>
											<th class="text-center">QQ</th>
											<th class="text-center">联系方式</th>
											<th class="text-center">管理员设置</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td name="user_account">2015011959</td>
											<td name="user_petname">刘晶</td>
											<td name="user_address">暂无</td>
											<td name="user_tele">3287573562</td>
											<td name="user_name">15764321043</td>
											<td name="user_regmethod" class="set">
												<button type="button" id="button" class="btn btn-default" >启用</button>
											</td>
											<td class="aparent">
												<button type="button" class="btn btn-danger">删除</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<nav aria-label="Page navigation">
							<ul class="pagination pull-right">
								<li>
									<a href="#" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li>
									<a href="#">1</a>
								</li>
								<li>
									<a href="#">2</a>
								</li>
								<li>
									<a href="#">3</a>
								</li>
								<li>
									<a href="#">4</a>
								</li>
								<li>
									<a href="#">5</a>
								</li>
								<li>
									<a href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"></script>
		<script>
			$(function(){
				$("#button").click(function(){
					$(this).toggleClass("btn-success");
				});
			});
		</script>
  </body>
</html>
