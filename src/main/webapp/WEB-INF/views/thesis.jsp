<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>论文</title>
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
									<form class="condition_form form-inline" action="" method="post">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">论文级别：</label>
												<select id="type" class="form-control">
													<option>---请选择论文级别---</option>
													<option >第一级-T类</option>
													<option >第二级-A类</option>
													<option >第三级-B类</option>
													<option >第四级-C类</option>
													<option >第五级-D类</option>
													<option >第六级-E类</option>
													<option >第七级-国家级内刊</option>
													<option >第八级-省级内刊</option>
													<option >第九级-区级内刊</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="author">作者排名：</label>
												<select id="author" class="form-control">
													<option>---请选择作者排名---</option>
													<option>第一作者</option>
													<option>第二作者</option>
													<option>第三作者</option>
													<option>第四作者</option>
													<option>第五作者</option>
													<option>第六作者</option>
													<option>通讯作者</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="title">论文题目：</label>
												<input type="text" id="title" class="form-control"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="unit">发表单位：</label>
												<input type="text" id="unit" class="form-control"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="journal">发表刊物：</label>
												<input type="text" id="journal" class="form-control"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="time">发表时间：</label>
												<select id="time" class="form-control">
													<option>---请选择发表年份---</option>
													<option>2017</option>
													<option>2016</option>
													<option>2015</option>
													<option>2014</option>
												</select>
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
										<!--第四行-->
										<div class="tab-row">
											<div class="form-group col-sm-12">
												<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
												<input type="text" id="tutor" class="form-control"/>
											</div>
										</div>
										<!--第五行-->
										<input type="button" value="选择" id="sort"/>
										
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
											<th class="text-center">期刊级别</th>
											<th class="text-center">发表刊物</th>
											<th class="text-center">论文题目</th>
											<th class="text-center">发表时间</th>
											<th class="text-center">作者姓名</th>
											<th class="text-center">作者排名</th>
											<th class="text-center">作者学号</th>
											<th class="text-center">作者专业</th>
											<th class="text-center">指导老师</th>
											<th class="text-center">论文摘要</th>
											<th class="text-center">操作</th>	
										</tr>
									</thead>

									<tbody>
									<c:forEach items="${thesisDtoList}" var="thesisDto">
										<tr>
											<td>${thesisDto.journalLevel}</td>
											<td>${thesisDto.journalName}</td>
											<td>${thesisDto.thesisTitle}</td>
											<td>${thesisDto.publishTime}</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${thesisDto.authorName1} != null and ${thesisDto.authorName1} != ''">
														<tr><td>${thesisDto.authorName1}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName2} != null and ${thesisDto.authorName2} != ''">
														<tr><td>${thesisDto.authorName2}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName3} != null and ${thesisDto.authorName3} != ''">
														<tr><td>${thesisDto.authorName3}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName4} != null and ${thesisDto.authorName4} != ''">
														<tr><td>${thesisDto.authorName4}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName5} != null and ${thesisDto.authorName5} != ''">
														<tr><td>${thesisDto.authorName5}</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${thesisDto.authorName1} != null and ${thesisDto.authorName1} != ''">
														<tr><td>第${thesisDto.authorLevel1}作者</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName2} != null and ${thesisDto.authorName2} != ''">
														<tr><td>第${thesisDto.authorLevel2}作者</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName3} != null and ${thesisDto.authorName3} != ''">
														<tr><td>第${thesisDto.authorLevel3}作者</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName4} != null and ${thesisDto.authorName4} != ''">
														<tr><td>第${thesisDto.authorLevel4}作者</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName5} != null and ${thesisDto.authorName5} != ''">
														<tr><td>第${thesisDto.authorLevel5}作者</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${thesisDto.authorName1} != null and ${thesisDto.authorName1} != ''">
														<tr><td>${thesisDto.authorStuNumber1}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName2} != null and ${thesisDto.authorName2} != ''">
														<tr><td>${thesisDto.authorStuNumber2}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName3} != null and ${thesisDto.authorName3} != ''">
														<tr><td>${thesisDto.authorStuNumber3}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName4} != null and ${thesisDto.authorName4} != ''">
														<tr><td>${thesisDto.authorStuNumber4}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName5} != null and ${thesisDto.authorName5} != ''">
														<tr><td>${thesisDto.authorStuNumber5}</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${thesisDto.authorName1} != null and ${thesisDto.authorName1} != ''">
														<tr><td>${thesisDto.authorMajor1}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName2} != null and ${thesisDto.authorName2} != ''">
														<tr><td>${thesisDto.authorMajor2}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName3} != null and ${thesisDto.authorName3} != ''">
														<tr><td>${thesisDto.authorMajor3}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName4} != null and ${thesisDto.authorName4} != ''">
														<tr><td>${thesisDto.authorMajor4}</td></tr>
													</c:if>
													<c:if test="${thesisDto.authorName5} != null and ${thesisDto.authorName5} != ''">
														<tr><td>${thesisDto.authorMajor5}</td></tr>
													</c:if>
												</table>
											</td>
											<td >${thesisDto.teacherName}</td>
											<td ><a href="#">详情</a></td>
											<td class="aparent">
												<a href="" data-toggle="modal" data-target="#delete">删除</a>
											</td>
										</tr>
									</c:forEach>
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
