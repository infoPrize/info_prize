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
		<div class="wrapper">
			<div class="container">
				<div class="">
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h3>查询条件</h3>
									<hr/>
								</div>
								<div class="x_content">
									<div class="clearfix"></div>
									<form class="condition_form form-inline" action="" method="post">
										<!--第一行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">项目类别：</label>
												<select id="type" class="form-control">
													<option>---请选择项目类别---</option>
													<option value="country">国创</option>
													<option value="key">校级重点科研立项</option>
													<option value="common">校级一般科研立项</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="stime">项目时间：</label>
												<select id="time" class="form-control">
													<option>---请选择项目时间---</option>
													<option>2016-2017</option>
													<option>2015-2016</option>
													<option>2014-2015</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="profession">学生专业：</label>
												<select id="profession" class="form-control">
													<option>---请选择学生专业---</option>
													<option>计算机普班</option>
													<option>计算机（中美）</option>
													<option>图书情报</option>
													<option>教技</option>
													<option>软件工程</option>
												</select>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
												<input type="text" id="tutor" class="form-control" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_name">学生姓名：</label>
												<input type="text" id="student_name" class="form-control" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_number">学生学号：</label>
												<input type="text" id="student_number" class="form-control" />
											</div>
										</div>
										<!--第三行-->
										<input type="button" value="选择" id="sort" />
										<div class="clearfix"></div>
									</form>
								</div>
								<div class="x_title title2">
									<h3>查询结果</h3>
									<hr/>
								</div>
								<div class="x_content">
									<table id="datatable" class="table-striped table-bordered text-center">
										<thead>
											<tr>
												<th class="text-center">项目类别</th>
												<th class="text-center">项目名称</th>
												<th class="text-center">项目时间</th>
												<th class="text-center">项目负责人</th>
												<th class="text-center">负责人学号</th>
												<th class="text-center">负责人联系方式</th>
												<th class="text-center">负责人QQ</th>
												<th class="text-center">负责人电子邮箱</th>
												<th class="text-center">项目组成员</th>
												<th class="text-center">组员学号</th>
												<th class="text-center">指导老师</th>
												<th class="text-center">指导老师工作量</th>
												<th class="text-center">批复经费</th>
												<th class="text-center">详情信息</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>

										<tbody>
											<!--第一行-->
											<tr>
												<td>国创</td>
												<td>构建基于本体库的软件开发技术交流社区</td>
												<td>2016-2017</td>
												<td>张三</td>
												<td>2015011234</td>
												<td>13456987546</td>
												<td>3569874565</td>
												<td>4569874569@qq.com</td>
												<td class="td_table">
													<table class="sub">
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
													</table>
												</td>
												<td>
													<table class="sub">
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
													</table>
												</td>
												<td>张伟</td>
												<td>很多</td>
												<td>5000</td>
												<td>
													<a href="#">详情</a>
												</td>
												<td class="aparent">
													<a href="" data-toggle="modal" data-target="#delete">删除</a>
												</td>
											</tr>
											<!--第二行-->
											<tr>
												<td>国创</td>
												<td>构建基于本体库的软件开发技术交流社区</td>
												<td>2016-2017</td>
												<td>张三</td>
												<td>2015011234</td>
												<td>13456987546</td>
												<td>3569874565</td>
												<td>4569874569@qq.com</td>
												<td class="td_table text-center">
													<table class="sub text-center">
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
														<tr>
															<td>张三</td>
														</tr>
													</table>
												</td>
												<td class="text-center">
													<table class="sub text-center">
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
														<tr>
															<td>2015021569</td>
														</tr>
													</table>
												</td>
												<td>张伟</td>
												<td>很多</td>
												<td>5000</td>
												<td>
													<a href="#">详情</a>
												</td>
												<td class="aparent">
													<a href="" data-toggle="modal" data-target="#delete">删除</a>
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
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"></script>
	</body>

</html>