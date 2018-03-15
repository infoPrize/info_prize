<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>ACM</title>
		<link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/page.css">
		<link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
        <style>
            .hidecol{
                display: none;
            }
        </style>
	</head>
	<body onload="initdataAcm()">
		<div class="wrapper">
			<div class="container">
				<div class="">
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h3>查询条件</h3>
										<h1>${message}</h1>
									<hr/>
								</div>
								<div class="x_content">
									<form class="condition_form form-inline">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">比赛级别：</label>
												<select id="matchLevel" class="form-control" name="matchLevel">
													<option value="-1">---请选择比赛级别---</option>
													<option value="1">校级</option>
													<option value="2">市级</option>
													<option value="3">省级</option>
													<option value="4">多省级</option>
													<option value="5">国家级</option>
													<option value="6">亚洲级</option>
													<option value="7">国际级</option>
													<option value="8">未知</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="matchName">比赛名称：</label>
												<input type="text" id="matchName" class="form-control" name="matchName" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">起始时间：</label>
												<input type="text" id="beginTime" name="beginTime" class="form-control" onClick="laydate()"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">结束时间：</label>
												<input type="text" id="endTime" name="endTime" class="form-control"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">获奖等级：</label>
												<select id="prizeLevel"  name="prizeLevel" class="form-control">
													<option value="-1">---请选择获奖等级---</option>
													<option value="1">金奖(一等奖)</option>
													<option value="2">银奖(二等奖)</option>
													<option value="3">铜奖(三等奖)</option>
													<option value="4">优胜奖(成功参赛奖)</option>
												</select>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="major">学生专业：</label>
												<select id="major" class="form-control" name="major">
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
										<!--第三行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="stuName">学生姓名：</label>
												<input type="text" id="stuName" class="form-control" name="stuName"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="stuNumber">学生学号：</label>
												<input type="text" id="stuNumber" class="form-control" name="stuNumber"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="hostUnit">主办单位：</label>
												<input type="text" id="hostUnit" class="form-control" name="hostUnit"/>
											</div>
										</div>
										<!--第四行-->
										<div class="tab-row">
											<div class="form-group col-sm-8">
												<label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
												<input type="text" id="teacherName" class="form-control" name="teacherName"/>
											</div>
											<div class="form-group col-sm-4">
												<input type="button" class="inlibut" value="选择" type="" onclick="initdataAcm()"/>
												<input type="button" class="inlibut" value="导出Excel" type="submit" onclick="form.action='${website}export/acm';form.submit();"/>
											</div>
										</div>
										<div class="clearfix"></div>
									</form>
								</div>
								<div class="x_title">
									<h3 class="dinline">查询结果</h3>
									<hr/>
								</div>
								<div class="x_content">
									<table id="datatable" class="table table-striped table-bordered text-center">
										<thead>
											<tr>
												<th class="text-center">比赛类别</th>
												<th class="text-center">比赛名称</th>
												<th class="text-center">主办单位</th>
												<th class="text-center">获奖时间</th>
												<th class="text-center">获奖等级</th>
												<th class="text-center">团队名称</th>
												<th class="text-center">参赛人员</th>
												<th class="text-center">学号</th>
												<th class="text-center">专业</th>
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
		<script type="text/javascript">
            !function(){
                laydate({
                    elem: '#endTime'
                })
            }();
		</script>
	</body>
</html>
