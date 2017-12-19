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
									<form class="condition_form form-inline" action="${website}thesis/listByCondition" method="post">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">期刊级别：</label>
												<select id="type" class="form-control" name="journalLevel">
													<option value="-1">---请选择论文级别---</option>
													<option value="1">E类</option>
													<option value="2">D类</option>
													<option value="3">C类</option>
													<option value="4">B类</option>
													<option value="5">A类</option>
													<option value="6">T类</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">期刊名称：</label>
												<input type="text" name="journalName" class="form-control" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="author">作者姓名：</label>
												<input type="text" id="author" class="form-control" name="authorName"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="unit">作者学号：</label>
												<input type="text" id="unit" class="form-control" name="authorStuNumber"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="profession">作者专业：</label>
												<select id="profession" class="form-control" name="authorMajor">
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
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="journal">作者年级：</label>
												<input type="text" id="journal" class="form-control" name="authorGrade"/>
											</div>
										</div>
										<!-- 第三行 -->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">起始发表时间：</label>
												<input type="text" name="beginTime" class="form-control" onClick="laydate()"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">截止发表时间：</label>
												<input type="text" name="endTime" class="form-control" onClick="laydate()"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="journal">指导老师：</label>
												<input type="text" id="journal" class="form-control" name="teacherName"/>
											</div>

										</div>

										<!--第四行-->
										<input type="submit" value="选择" id="sort"/>
										
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
											<td>${thesisDto.publishTimeStr}</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${!empty thesisDto.authorName1 and thesisDto.authorName1 ne ''}">
														<tr><td>${thesisDto.authorName1}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName2 and thesisDto.authorName2 ne ''}">
														<tr><td>${thesisDto.authorName2}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName3 and thesisDto.authorName3 ne ''}">
														<tr><td>${thesisDto.authorName3}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName4 and thesisDto.authorName4 ne ''}">
														<tr><td>${thesisDto.authorName4}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName5 and thesisDto.authorName5 ne ''}">
														<tr><td>${thesisDto.authorName5}</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${!empty thesisDto.authorName1 and thesisDto.authorName1 ne ''}">
														<tr><td>第${thesisDto.authorLevel1}作者</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName2 and thesisDto.authorName2 ne ''}">
														<tr><td>第${thesisDto.authorLevel2}作者</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName3 and thesisDto.authorName3 ne ''}">
														<tr><td>第${thesisDto.authorLevel3}作者</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName4 and thesisDto.authorName4 ne ''}">
														<tr><td>第${thesisDto.authorLevel4}作者</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName5 and thesisDto.authorName5 ne ''}">
														<tr><td>第${thesisDto.authorLevel5}作者</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${!empty thesisDto.authorName1 and thesisDto.authorName1 ne ''}">
														<tr><td>${thesisDto.authorStuNumber1}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName2 and thesisDto.authorName2 ne ''}">
														<tr><td>${thesisDto.authorStuNumber2}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName3 and thesisDto.authorName3 ne ''}">
														<tr><td>${thesisDto.authorStuNumber3}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName4 and thesisDto.authorName4 ne ''}">
														<tr><td>${thesisDto.authorStuNumber4}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName5 and thesisDto.authorName5 ne ''}">
														<tr><td>${thesisDto.authorStuNumber5}</td></tr>
													</c:if>
												</table>
											</td>
											<td class="td_table">
												<table class="sub">
													<c:if test="${!empty thesisDto.authorName1 and thesisDto.authorName1 ne ''}">
														<tr><td>${thesisDto.authorMajor1}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName2 and thesisDto.authorName2 ne ''}">
														<tr><td>${thesisDto.authorMajor2}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName3 and thesisDto.authorName3 ne ''}">
														<tr><td>${thesisDto.authorMajor3}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName4 and thesisDto.authorName4 ne ''}">
														<tr><td>${thesisDto.authorMajor4}</td></tr>
													</c:if>
													<c:if test="${!empty thesisDto.authorName5 and thesisDto.authorName5 ne ''}">
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
		<script type="text/javascript" src="${staticWebsite}resources/laydate/laydate.js"></script>
	</body>
</html>
