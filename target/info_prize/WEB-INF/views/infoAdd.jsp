<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>信息录入</title>
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
								<h3>信息录入</h3>
								<hr/>
							</div>
							<div class="x_content">
								<!--tab选项-->
								<ul class="nav nav-tabs" role="tablist">
									<li class="active">
										<a href="#tab-article" role="tab" data-toggle="tab">论文</a>
									</li>
									<li>
										<a href="#tab-product" role="tab" data-toggle="tab">专利</a>
									</li>
									<li>
										<a href="#tab-science" role="tab" data-toggle="tab">国创科研</a>
									</li>
									<li>
										<a href="#tab-acm" role="tab" data-toggle="tab">ACM</a>
									</li>
									<li>
										<a href="#tab-math" role="tab" data-toggle="tab">数学建模</a>
									</li>
									<li>
										<a href="#tab-profession" role="tab" data-toggle="tab">专业竞赛</a>
									</li>
									<li>
										<a href="#tab-more" role="tab" data-toggle="tab">其他比赛</a>
									</li>
								</ul>
								<div class="tab-content">
									<!--论文添加-->
									<div class="tab-pane active" id="tab-article">
										<div class="row feature">
											<form class="condition_form form-inline" action="" method="post">
												<!--第一行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="type">论文级别：</label>
														<select class="form-control">
															<option>---请选择论文级别---</option>
															<option>第一级-T类</option>
															<option>第二级-A类</option>
															<option>第三级-B类</option>
															<option>第四级-C类</option>
															<option>第五级-D类</option>
															<option>第六级-E类</option>
															<option>第七级-国家级内刊</option>
															<option>第八级-省级内刊</option>
															<option>第九级-区级内刊</option>
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
														<input type="text" id="title" class="form-control" />
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="unit">发表单位：</label>
														<input type="text" id="unit" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="journal">发表刊物：</label>
														<input type="text" id="journal" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="time">发表时间：</label>
														<select class="form-control">
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
														<label class="tab-label control-label text-right" for="student_name">作者姓名：</label>
														<input type="text" id="student_name" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">作者学号：</label>
														<input type="text" id="student_number" class="form-control" />
													</div>
												</div>
												<!--第四行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">作者联系方式：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">作者电子邮件：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
												</div>
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师工作量：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">稿费：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
												</div>
												<div class="tab-row">
													<div class="col-sm-12">
														<label class="tab-label control-label text-right" for="student_number">项目详情：</label>
														<textarea class="detailtext form-control" rows="3" style="width: 850px"></textarea>
													</div>
												</div>
												<div class="clearfix"></div>
												<!--第五行-->
												<input type="button" value="提交" id="sort"/>

											</form>
										</div>
									</div>
									<!--专利添加-->
									<div class="tab-pane" id="tab-product">
										<div class="row feature">
											<form class="condition_form form-inline" action="" method="post">
												<!--第一行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="type">专利类别：</label>
														<select id="type" class="form-control">
															<option>---请选择专利类别---</option>
															<option>发明专利</option>
															<option>实用新型专利</option>
															<option>外观设计专利</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="stime">申请成功时间：</label>
														<select id="stime" class="form-control">
															<option>---请选择申请成功时间---</option>
															<option>2017年8月</option>
															<option>2017年6月</option>
															<option>2015年4月</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="profession">申请人专业：</label>
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
														<label class="tab-label control-label text-right" for="name">专利名称：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">申请人：</label>
														<input type="text" id="student_name" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">申请人学号：</label>
														<input type="text" id="student_number" class="form-control" />
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">申请人电子邮箱：</label>
														<input type="text" id="student_name" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" id="tutor" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">指导老师工作量：</label>
														<input type="text" id="student_number" class="form-control" />
													</div>
												</div>
												<div class="tab-row">
													<div class="col-sm-12">
														<label class="tab-label control-label text-right" for="student_number">项目详情：</label>
														<textarea class="detailtext form-control" rows="3" style="width: 850px"></textarea>
													</div>
												</div>
												<div class="clearfix"></div>
												<!--第五行-->
												<input type="button" value="提交" id="sort" />

											</form>
											</form>
										</div>

									</div>
									<!--国创科研添加-->
									<div class="tab-pane" id="tab-science">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}scientificProject/add" method="post">
												<div class="">
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="name">项目名称：</label>
															<input type="text" id="name" class="form-control" name="projectName"/>
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="type">项目类别：</label>
															<select id="type" class="form-control" name="projectType">
																<option value="-1">---请选择项目类别---</option>
																<option value="1">一般培育项目</option>
																<option value="2">专项计划项目</option>
																<option value="3">重点培育项目</option>
																<option value="4">国家级大学生创新创业训练计划</option>
																<option value="0">其他</option>
															</select>
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="stime">立项年份：</label>
															<select name="setYear" id="setYear" class="form-control">
																<option value="-1">---请选择立项年份---</option>
																<option value="${year}">${year}</option>
																<option value="${year-1}">${year-1}</option>
																<option value="${year-2}">${year-2}</option>
																<option value="${year-3}">${year-3}</option>
																<option value="${year-4}">${year-4}</option>
															</select>
															<%--<input type="text" name="setTime" class="form-control" onClick="laydate()"/>--%>
														</div>
													</div>
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_name">项目负责人：</label>
															<input type="text" name="projectManName" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_number">负责人学号：</label>
															<input type="text" name="projectManStuNumber" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_number">指导老师：</label>
															<input type="text" name="teacherName" class="form-control" />
														</div>
													</div>
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_name">组员1姓名：</label>
															<input type="text" name="projectMemberName1" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_number">组员1学号：</label>
															<input type="text" name="projectMemberStuNumber1" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_name">组员2姓名：</label>
															<input type="text" name="projectMemberName2" class="form-control" />
														</div>
													</div>
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="tutor">组员2学号：</label>
															<input type="text" name="projectMemberStuNumber2" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_name">组员3姓名：</label>
															<input type="text" name="projectMemberName3" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_number">组员3学号：</label>
															<input type="text" name="projectMemberStuNumber3" class="form-control" />
														</div>
													</div>
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="tutor">组员4姓名：</label>
															<input type="text" name="projectMemberName4" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right" for="student_name">组员4学号：</label>
															<input type="text" name="projectMemberStuNumber4" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">批复经费：</label>
															<select class="form-control" name="fundsLimit">
																<option value="-1">---请选择项目批复经费---</option>
																<option value="1000">1000</option>
																<option value="2000">2000</option>
																<option value="5000">5000</option>
																<option value="10000">10000</option>
															</select>
														</div>
													</div>
													<div class="tab-row">
														<div class="col-sm-12">
															<label class="tab-label control-label text-right" for="student_number">项目详情：</label>
															<textarea name="projectIntroduce" class="detailtext form-control" rows="3" style="width: 850px"></textarea>
														</div>
													</div>
													<div class="clearfix"></div>
												</div>
												<input type="submit" value="提交" id="sort"/>
											</form>
										</div>
									</div>
									<!--ACM添加-->
									<div class="tab-pane" id="tab-acm">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}acm/add" method="post">
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
														<label class="tab-label control-label text-right" for="time">获奖时间：</label>
														<input type="text" name="prizeTime" class="form-control" onClick="laydate()"/>
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="prize">获奖等级：</label>
														<select id="prizeLevel" name="prizeLevel" class="form-control">
															<option value="-1">---请选择获奖等级---</option>
															<option value="1">金奖(一等奖)</option>
															<option value="2">银奖(二等奖)</option>
															<option value="3">铜奖(三等奖)</option>
															<option value="4">优胜奖(成功参赛奖)</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">主办单位：</label>
														<input type="text" id="hostUnit" class="form-control" name="hostUnit" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">团队名称：</label>
														<input type="text" id="teamName" class="form-control" name="teamName" />
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">队员1姓名：</label>
														<input type="text" id="teammateName1" class="form-control" name="teammateName1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员1学号：</label>
														<input type="text" id="teammateStuNumber1" class="form-control" name="teammateStuNumber1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2姓名：</label>
														<input type="text" id="teammateName2" class="form-control" name="teammateName2"/>
													</div>
												</div>
												<!-- 第四行 -->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2学号：</label>
														<input type="text" id="teammateStuNumber2" class="form-control" name="teammateStuNumber2" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3姓名：</label>
														<input type="text" id="teammateName3" class="form-control" name="teammateName3"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3学号：</label>
														<input type="text" id="teammateStuNumber3" class="form-control" name="teammateStuNumber3" />
													</div>
												</div>
												<!--第五行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" class="form-control" name="teacherName" />
													</div>
												</div>
												<div class="clearfix"></div>
												<input type="submit" value="提交" />
											</form>
										</div>
									</div>
									<!--数学建模添加-->
									<div class="tab-pane" id="tab-math">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}mathModel/add" method="post">
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
														<label class="tab-label control-label text-right" for="time">获奖时间：</label>
														<input type="text" name="prizeTime" class="form-control" onClick="laydate()"/>
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="prize">获奖等级：</label>
														<select id="prizeLevel" name="prizeLevel" class="form-control">
															<option value="-1">---请选择获奖等级---</option>
															<option value="1">金奖(一等奖)</option>
															<option value="2">银奖(二等奖)</option>
															<option value="3">铜奖(三等奖)</option>
															<option value="4">优胜奖(成功参赛奖)</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">主办单位：</label>
														<input type="text" id="hostUnit" class="form-control" name="hostUnit" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">团队名称：</label>
														<input type="text" id="teamName" class="form-control" name="teamName" />
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">队员1姓名：</label>
														<input type="text" id="teammateName1" class="form-control" name="teammateName1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员1学号：</label>
														<input type="text" id="teammateStuNumber1" class="form-control" name="teammateStuNumber1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2姓名：</label>
														<input type="text" id="teammateName2" class="form-control" name="teammateName2"/>
													</div>
												</div>
												<!-- 第四行 -->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2学号：</label>
														<input type="text" id="teammateStuNumber2" class="form-control" name="teammateStuNumber2" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3姓名：</label>
														<input type="text" id="teammateName3" class="form-control" name="teammateName3"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3学号：</label>
														<input type="text" id="teammateStuNumber3" class="form-control" name="teammateStuNumber3" />
													</div>
												</div>
												<!--第五行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" class="form-control" name="teacherName" />
													</div>
												</div>
												<div class="clearfix"></div>
												<input type="submit" value="提交" />

											</form>
										</div>
									</div>
									<!--专业比赛添加-->
									<div class="tab-pane" id="tab-profession">
										<div class="row feature">
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
														<input type="text" id="tutor" class="form-control" />
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="competition">比赛名称：</label>
														<input type="text" id="competition" class="form-control" />
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
														<input type="text" id="prize" class="form-control" />
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
														<input type="text" id="student_name" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">学生学号：</label>
														<input type="text" id="student_number" class="form-control" />
													</div>
												</div>
												<!--第五行-->
												<input type="button" value="提交" id="sort" />

											</form>
										</div>
									</div>
									<div class="tab-pane" id="tab-more">
										<div class="row feature">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/competition.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/laydate/laydate.js"></script>

	</body>

</html>