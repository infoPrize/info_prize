<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>专业竞赛</title>
		<link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
		<style>
			.hidecol{
				display: none;
			}
		</style>
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
									<form class="condition_form form-inline" action="" method="post">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="level">比赛级别：</label>
												<select id="level" class="form-control">
													<option class="level_option">---请选择比赛级别---</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">比赛类别：</label>
												<select id="type" class="form-control">
													<option class="level_option">---请选择比赛类别---</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
												<input type="text" id="tutor" class="form-control"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="competition">比赛名称：</label>
												<input type="text" id="competition" class="form-control"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="time">比赛时间：</label>
												<select id="time" class="form-control">
													<option>---请选择比赛时间---</option>
													<option>2017年</option>
													<option>2016年</option>
													<option>2015年</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="prize">获奖等级：</label>
												<input type="text" id="prize" class="form-control"/>
											</div>
										</div>
										<!--第三行-->
										<div class="tab-row">
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
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_name">学生姓名：</label>
												<input type="text" id="student_name" class="form-control"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_number">学生学号：</label>
												<input type="text" id="student_number" class="form-control"/>
											</div>
										</div>
										<!--第五行-->
										<input type="button" value="选择" id="sort"/>
										
									</form>
					
								</div>
								<div class="x_title">
									<h3>查询结果</h3>
									<button id="showcolumn">显示所有栏目</button>
									<button id="hidecolumn">显示部分栏目</button>
									<hr/>
								</div>
								<div class="x_content">
									<table id="datatable" class="table-striped table-bordered text-center">
										<thead>
											<tr>
												<th class="text-center">比赛级别</th>
												<th class="text-center">比赛类别</th>
												<th class="text-center">比赛名称</th>
												<th class="text-center">主办单位</th>
												<th class="text-center">比赛时间</th>
												<th class="text-center">参赛形式</th>
												<th class="text-center">获奖等级</th>
												<th class="text-center hidecol">参赛人员</th>
												<th class="text-center hidecol">参赛人员专业</th>
												<th class="text-center hidecol">参赛人员学号</th>
												<th class="text-center hidecol">参赛人员联系方式</th>
												<th class="text-center hidecol">参赛人员电子邮箱</th>
												<th class="text-center">指导老师</th>
												<th class="text-center">指导老师工作量</th>
												<th class="text-center">详情信息</th>
												<th class="text-center">操作</th>	
											</tr>
										</thead>
	
										<tbody>
											<!--第一行-->
											<tr>
												<td >国家级</td>
												<td >蓝桥杯</td>
												<td >第八届蓝桥杯全国软件和信息技术专业人才大赛</td>
												<td>工业和信息化部人才交流中心</td>
												<td >2017年</td>
												<td >团体赛</td>
												<td >二等奖</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>张三</td></tr>
														<tr><td>张三</td></tr>
														<tr><td>张三</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>计算机普班</td></tr>
														<tr><td>图书情报</td></tr>
														<tr><td>软件工程</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>2015898758</td></tr>
														<tr><td>2015012569</td></tr>
														<tr><td>2015125898</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>12365987458</td></tr>
														<tr><td>12365987458</td></tr>
														<tr><td>12365987458</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>4569874569@qq.com</td></tr>
														<tr><td>4569874569@qq.com</td></tr>
														<tr><td>4569874569@qq.com</td></tr>
													</table>
												</td>
												<td >张伟</td>
												<td >很多</td>
												<td ><a href="#">详情</a></td>
												<td class="aparent">
													<a href="" data-toggle="modal" data-target="#delete">删除</a>
												</td>
											</tr>
											<!--第二行-->
											<tr>
												<td >国家级</td>
												<td >蓝桥杯</td>
												<td >第八届蓝桥杯全国软件和信息技术专业人才大赛</td>
												<td>工业和信息化部人才交流中心</td>
												<td >2017年</td>
												<td >团体赛</td>
												<td >二等奖</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>张三</td></tr>
														<tr><td>张三</td></tr>
														<tr><td>张三</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>计算机普班</td></tr>
														<tr><td>图书情报</td></tr>
														<tr><td>软件工程</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>2015898758</td></tr>
														<tr><td>2015012569</td></tr>
														<tr><td>2015125898</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>12365987458</td></tr>
														<tr><td>12365987458</td></tr>
														<tr><td>12365987458</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>4569874569@qq.com</td></tr>
														<tr><td>4569874569@qq.com</td></tr>
														<tr><td>4569874569@qq.com</td></tr>
													</table>
												</td>
												<td >张伟</td>
												<td >很多</td>
												<td ><a href="#">详情</a></td>
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
		<script type="text/javascript" src="${staticWebsite}resources/js/competition.js" ></script>
		<script type="text/javascript">
            $(document).ready(function(){
                $("#showcolumn").click(function(){
                    $(".hidecol").css("display","table-cell");
                });
                $("#hidecolumn").click(function(){
                    $(".hidecol").css("display","none");
                });
            })
		</script>
	</body>
</html>
