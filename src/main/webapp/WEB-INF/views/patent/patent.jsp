<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>专利</title>
		<link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/page.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
	</head>
	<body onload="initdataPatent()">
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
									<form class="condition_form form-inline">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="patentType">专利类别：</label>
												<select id="patentType" class="form-control" name="patentType">
													<option value="-1">---请选择专利类别---</option>
													<option value="1">发明专利</option>
													<option value="2">实用新型专利</option>
													<option value="3">外观设计专利</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="patentName">专利名称：</label>
												<input type="text" class="form-control" name="patentName" id="patentName"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">起始申请时间：</label>
												<input type="text" id="beginTime" name="beginTime" class="form-control" onClick="laydate()"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">截止申请时间：</label>
												<input type="text" name="endTime" class="form-control end" id="endTime"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="majorCode">学生专业：</label>
												<select id="majorCode" class="form-control" name="majorCode">
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
												<label class="tab-label control-label text-right" for="grade">学生年级：</label>
												<input type="text" class="form-control" name="grade" id="grade"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="stuNumber">学生学号：</label>
												<input type="text" class="form-control" name="stuNumber" id="stuNumber"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="stuName">学生姓名：</label>
												<input type="text" class="form-control" name="stuName" id="stuName"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
												<input type="text" id="teacherName" class="form-control" name="teacherName"/>
											</div>
										</div>
										<!--第三行-->
										<input type="button" id="sort" value="选择" type="submit" onclick="initdataPatent()"/>
										<input type="button" id="sort" value="导出Excel" type="submit" onclick="form.action='/export/patent';form.submit();"/>

										
									</form>
								</div>
								<div class="x_title title2">
									<h3>查询结果</h3>
									<hr/>
								</div>
								<div class="x_content">
									<table id="datatable" class="table table-striped table-bordered text-center">
										<thead>
											<tr>
												<th class="text-center">专利类别</th>
												<th class="text-center">专利名称</th>
												<th class="text-center">申请成功时间</th>
												<th class="text-center">申请人</th>
												<th class="text-center">申请人专业</th>
												<th class="text-center">申请人学号</th>
												<th class="text-center">指导老师</th>
												<th class="text-center">详情信息</th>
												<th class="text-center">操作</th>	
											</tr>
										</thead>
	
										<tbody class="grid-body">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 wrap">
							<!--分页-->
							<div class="page" id="page"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/laydate/laydate.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/page.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/search.js"></script>
		<script>
            !function(){
                laydate({
                    elem: '.end'
                })
            }();

		</script>
	</body>
</html>
