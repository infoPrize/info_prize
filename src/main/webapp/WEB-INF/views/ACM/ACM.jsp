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
									<form class="condition_form form-inline" action="" method="get">
										<!--第一行-->
										<div class="tab-row">
					    					<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="type">比赛级别：</label>
												<select id="type" class="form-control" name="matchLevel">
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
												<label class="tab-label control-label text-right" for="competition">比赛名称：</label>
												<input type="text" id="competition" class="form-control" name="matchName" />
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">起始时间：</label>
												<input type="text" name="beginTime" class="form-control" onClick="laydate()"/>
											</div>
										</div>
										<!--第二行-->
										<div class="tab-row">
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right">结束时间：</label>
												<input type="text" name="endTime" class="form-control" id="end"/>
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
												<label class="tab-label control-label text-right" for="profession">学生专业：</label>
												<select id="profession" class="form-control" name="major">
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
												<label class="tab-label control-label text-right" for="student_name">学生姓名：</label>
												<input type="text" id="student_name" class="form-control" name="stuName"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_number">学生学号：</label>
												<input type="text" id="student_number" class="form-control" name="stuNumber"/>
											</div>
											<div class="form-group col-sm-4">
												<label class="tab-label control-label text-right" for="student_name">主办单位：</label>
												<input type="text" id="hostUnit" class="form-control" name="hostUnit"/>
											</div>
										</div>
										<!--第四行-->
										<div class="tab-row">
											<div class="form-group col-sm-8">
												<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
												<input type="text" id="tutor" class="form-control" name="teacherName"/>
											</div>
											<div class="form-group col-sm-4">
												<input type="button" class="inlibut" value="选择" type="submit" onclick="form.action='${website}acm/listACMByCondition/0';form.submit();"/>
												<input type="button" class="inlibut" value="导出Excel" type="submit" onclick="form.action='/export/acm';form.submit();"/>
											</div>
										</div>
										<div class="clearfix"></div>
									</form>
								</div>
								<div class="x_title">
									<h3 class="dinline">查询结果</h3>
									<button id="showcolumn">显示所有栏目</button>
									<button id="hidecolumn">显示部分栏目</button>
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
												<th class="text-center hidecol">参赛人员</th>
												<th class="text-center hidecol">学号</th>
												<th class="text-center hidecol">专业</th>
												<th class="text-center">指导老师</th>
												<th class="text-center">操作</th>
											</tr>
										</thead>
	
										<tbody>
											<!--第一行-->
											<c:forEach items="${acmPrizeDtoList}" var="acmPrizeDto">
											<tr>
												<td>${acmPrizeDto.matchLevel}</td>
												<td>${acmPrizeDto.matchName}</td>
												<td>${acmPrizeDto.hostUnit}</td>
												<td>${acmPrizeDto.prizeTimeStr}</td>
												<td>${acmPrizeDto.prizeLevel}</td>
												<td>${acmPrizeDto.teamName}</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>${acmPrizeDto.teammateName1}</td></tr>
														<tr><td>${acmPrizeDto.teammateName2}</td></tr>
														<tr><td>${acmPrizeDto.teammateName3}</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>${acmPrizeDto.teammateStuNumber1}</td></tr>
														<tr><td>${acmPrizeDto.teammateStuNumber2}</td></tr>
														<tr><td>${acmPrizeDto.teammateStuNumber3}</td></tr>
													</table>
												</td>
												<td class="td_table hidecol">
													<table class="sub">
														<tr><td>${acmPrizeDto.teammateMajor1}</td></tr>
														<tr><td>${acmPrizeDto.teammateMajor2}</td></tr>
														<tr><td>${acmPrizeDto.teammateMajor3}</td></tr>
													</table>
												</td>
												<td>${acmPrizeDto.teacherName}</td>
												<td class="aparent">
													<a href="${website}acm/falseDeleteById/${acmPrizeDto.id}">删除</a><br>
													<a href="${website}acm/toDetail/${acmPrizeDto.id}">去往详情页</a>
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
										<a href="${website}acm/toPrevious">上一页</a>
									</li>
									<li>
										<a href="${website}acm/toNext">下一页</a>
									</li>
									<li class="total">
										共${totalPage}页
									</li>
									<li class="total">
										第${curPage}页
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
		<script type="text/javascript">
            $(document).ready(function(){
                $("#showcolumn").click(function(){
                    $(".hidecol").css("display","table-cell");
                });
                $("#hidecolumn").click(function(){
                    $(".hidecol").css("display","none");
                });
            })
            !function(){
                laydate({
                    elem: '#end'
                })
            }();
		</script>

	</body>
</html>
