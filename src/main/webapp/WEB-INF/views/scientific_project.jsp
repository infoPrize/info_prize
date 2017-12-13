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
									<form class="condition_form form-inline" action="${website}/scientificProject/selectByCondition" method="post">
										<!--第一行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">项目类别：</label>
												<select id="type" class="form-control" name="projectType">
													<option value="-1">---请选择项目类别---</option>
													<option value="1">一般培育项目</option>
													<option value="2">专项计划项目</option>
													<option value="3">重点培育项目</option>
													<option value="4">国家级大学生创新创业训练计划</option>
													<option value="5">其他</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">立项年份：</label>
												<select id="time" class="form-control" name="setYear">
													<option value="">---请选择立项年份---</option>
													<option value="${year}">${year}</option>
													<option value="${year-1}">${year-1}</option>
													<option value="${year-2}">${year-2}</option>
													<option value="${year-3}">${year-3}</option>
													<option value="${year-4}">${year-4}</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="profession">学生专业：</label>
												<select id="profession" class="form-control" name="majorCode">
													<option value="-1">---请选择学生专业---</option>
													<option value="1">软件工程</option>
													<option value="2">计算机科学与技术</option>
													<option value="3">计算机科学与技术(中美合作)</option>
													<option value="4">教育技术</option>
													<option value="5">图书情报与档案管理</option>
													<option value="51">图书馆学</option>
													<option value="52">信息资源管理</option>
												</select>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
												<input type="text" name="teacherName" id="tutor" class="form-control" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_name">学生姓名：</label>
												<input type="text" name="stuName" id="student_name" class="form-control" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_number">学生学号：</label>
												<input type="text" name="stuNumber" id="student_number" class="form-control" />
											</div>
										</div>
										<!--第三行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">项目名称：</label>
												<input type="text" name="projectName" id="project_name" class="form-control" />
											</div>
										</div>
										<!--第四行-->
										<input type="submit" value="选择" id="sort" />
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
												<th class="text-center">立项年份</th>
												<th class="text-center">项目负责人</th>
												<th class="text-center">负责人性别</th>
												<th class="text-center">负责人学号</th>
												<th class="text-center">负责人联系方式</th>
												<th class="text-center">负责人专业</th>
												<th class="text-center">项目组成员</th>
												<th class="text-center">组员学号</th>
												<th class="text-center">指导老师</th>
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
												<td>2017</td>
												<td>张三</td>
												<td>男</td>
												<td>201501123</td>
												<td>15919864567</td>
												<td>软件工程</td>
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
												<td>2017</td>
												<td>张三</td>
												<td>男</td>
												<td>201501123</td>
												<td>15919864567</td>
												<td>软件工程</td>
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
		<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"
	</body>



</html>