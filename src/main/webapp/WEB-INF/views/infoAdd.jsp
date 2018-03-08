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
										<a href="#tab-challenge" role="tab" data-toggle="tab">挑战杯</a>
									</li>
									<li>
										<a href="#tab-internet" role="tab" data-toggle="tab">互联网+</a>
									</li>
									<li>
										<a href="#tab-more" role="tab" data-toggle="tab">其他比赛</a>
									</li>
								</ul>
								<div class="tab-content">
									<!--论文添加-->
									<div class="tab-pane active" id="tab-article">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}thesis/add" method="post">
												<!--第一行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="journal">刊物名称：</label>
														<input type="text" id="journal" class="form-control" name="journalName" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="type">刊物等级：</label>
														<select class="form-control" id="journalLevel">
															<option value="-1">---请选择刊物等级---</option>
															<option value="1">E类</option>
															<option value="2">D类</option>
															<option value="3">C类</option>
															<option value="4">B类</option>
															<option value="5">A类</option>
															<option value="6">T类</option>
															<option value="7">未知</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">论文题目：</label>
														<input type="text" id="thesisTitle" class="form-control" />
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row" id="thesis">

													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">作者姓名：</label>
														<input type="text" class="form-control" id="authorName1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">作者学号：</label>
														<input type="text" class="form-control" id="authorStuNumber1"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">作者等级：</label>
														<select id="authorLevel1" class="form-control">
															<option value="-1">---请选择作者等级---</option>
															<option value="1">第一作者</option>
															<option value="2">第二作者</option>
															<option value="3">第三作者</option>
															<option value="4">第四作者</option>
															<option value="5">第五作者</option>
															<option value="6">第六作者</option>
															<option value="7">第七作者</option>
														</select>
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="time">发表时间：</label>
														<input type="text" class="form-control" onClick="laydate()" id="publishTime"/>
													</div>
													<div class="form-group col-sm-8">
														<label class="tab-label control-label text-right">指导老师：</label>
														<input type="text" class="form-control" id="teacherName" />
													</div>


												</div>


												<!--第四行-->
												<div class="tab-row">
													<div class="col-sm-12">
														<label class="tab-label control-label text-right">论文摘要：</label>
														<textarea class="detailtext form-control" rows="3" id="thesisAbstract" style="width: 850px"></textarea>
													</div>
													<div class="clearfix"></div>
												</div>
												<!--第五行-->
												<input type="button" value="添加" id="addthesis">
												<input type="button" value="提交" id="sort_thesis"/>
											</form>
											<form action="/import/thesis" enctype="multipart/form-data" method="post">
												<input type="file" name="file">
												<input type="submit" value="导入excel">
											</form>
											<h1>${message}</h1>
										</div>
									</div>
									<!--专利添加-->
									<div class="tab-pane" id="tab-product">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}patent/add" method="post">
												<!--第一行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="type">专利类别：</label>
														<select id="type" class="form-control" name="patentType">
															<option value="-1">---请选择专利类别---</option>
															<option value="1">发明专利</option>
															<option value="2">实用新型专利</option>
															<option value="3">外观设计专利</option>
															<option value="4">其他</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="name">专利名称：</label>
														<input type="text" id="name" class="form-control" name="patentName"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="apply_time">申请成功时间：</label>
														<input type="text" id="apply_time" name="applyTime" class="form-control" onClick="laydate()"/>
													</div>

												</div>
												<!--第二行-->
												<div class="tab-row" id="patent">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" id="tutor" class="form-control" name="teacherName" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="author_name_2">申请人姓名</label>
														<input type="text" class="form-control" id="author_name_2" name="applierName1" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="author_stu_number2">申请人学号</label>
														<input type="text" class="form-control" id="author_stu_number2" name="applierStuNumber1" />
													</div>

												</div>
												<!--第三行-->

												<div class="tab-row">
													<div class="col-sm-12">
														<label class="tab-label control-label text-right" for="student_number">专利介绍：</label>
														<textarea class="detailtext form-control" rows="3" style="width: 850px" name="patentIntroduce"></textarea>
													</div>
												</div>
												<div class="clearfix"></div>
												<!--第五行-->
												<input type="button" value="添加" id="addpatent">
												<input type="submit" value="提交" id="sort" />

											</form>
											</form>
											<form action="/import/patent" enctype="multipart/form-data" method="post">
												<input type="file" name ="file">
												<input type="submit" value ="导入excel">
											</form>
											<h1>${message}</h1>
										</div>

									</div>
									<!--国创科研添加-->
									<div class="tab-pane" id="tab-science">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}scientificProject/add" method="post">
												<div class="">
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">项目名称：</label>
															<input type="text" class="form-control" id="projectName"/>
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">项目类别：</label>
															<select class="form-control" id="projectType">
																<option value="-1">---请选择项目类别---</option>
																<option value="1">一般培育项目</option>
																<option value="2">专项计划项目</option>
																<option value="3">重点培育项目</option>
																<option value="4">国家级大学生创新创业训练计划</option>
																<option value="0">其他</option>
															</select>
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">立项年份：</label>
															<input type="text" id="setYear" class="form-control" onClick="laydate()"/>
														</div>
													</div>
													<div class="tab-row">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">项目负责人：</label>
															<input type="text" id="projectManName" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">负责人学号：</label>
															<input type="text" id="projectManStuNumber" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">指导老师：</label>
															<input type="text" id="teacherName" class="form-control" />
														</div>
													</div>
													<div class="tab-row" id="scientific_project">
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">批复经费：</label>
															<select class="form-control" id="fundsLimit">
																<option value="-1">---请选择项目批复经费---</option>
																<option value="1000">1000</option>
																<option value="2000">2000</option>
																<option value="5000">5000</option>
																<option value="10000">10000</option>
															</select>
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">组员1姓名：</label>
															<input type="text" id="projectMemberName1" class="form-control" />
														</div>
														<div class="form-group col-sm-4">
															<label class="tab-label control-label text-right">组员1学号：</label>
															<input type="text" id="projectMemberStuNumber1" class="form-control" />
														</div>

													</div>

													<div class="tab-row">
														<div class="col-sm-12">
															<label class="tab-label control-label text-right" for="student_number">项目详情：</label>
															<textarea id="projectIntroduce" class="detailtext form-control" rows="3" style="width: 850px"></textarea>
														</div>
													</div>
													<div class="clearfix"></div>
												</div>
												<input type="button" value="添加" id="addscientific_project">
												<input type="button" value="提交" id="sort_scient"/>
											</form>
											<form action="/import/scientificProject" enctype="multipart/form-data" method="post">
												<input type="file" name="file">
												<input type="submit" value="导入excel">
											</form>
											<h1>${message}</h1>
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
														<select id="matchLevel" class="form-control">
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
														<input type="text" id="matchName" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="time">获奖时间：</label>
														<input type="text" id="prizeTime" class="form-control" onClick="laydate()"/>
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="prize">获奖等级：</label>
														<select id="prizeLevel" class="form-control">
															<option value="-1">---请选择获奖等级---</option>
															<option value="1">金奖(一等奖)</option>
															<option value="2">银奖(二等奖)</option>
															<option value="3">铜奖(三等奖)</option>
															<option value="4">优胜奖(成功参赛奖)</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">主办单位：</label>
														<input type="text" id="hostUnit" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">团队名称：</label>
														<input type="text" id="teamName" class="form-control"/>
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">队员1姓名：</label>
														<input type="text" id="teammateName1" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员1学号：</label>
														<input type="text" id="teammateStuNumber1" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2姓名：</label>
														<input type="text" id="teammateName2" class="form-control"/>
													</div>
												</div>
												<!-- 第四行 -->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2学号：</label>
														<input type="text" id="teammateStuNumber2" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3姓名：</label>
														<input type="text" id="teammateName3" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3学号：</label>
														<input type="text" id="teammateStuNumber3" class="form-control"/>
													</div>
												</div>
												<!--第五行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" class="form-control" id="teacherNameACM" />
													</div>
												</div>
												<div class="clearfix"></div>
												<input type="button" value="提交" id="sort_ACM"/>
											</form>
											<form action="/import/ACMPrize" enctype="multipart/form-data" method="post">
												<input type="file" name="file">
												<input type="submit" value="导入excel">
											</form>
											<h1>${message}</h1>
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
														<select id="matchLevel" class="form-control">
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
														<label class="tab-label control-label text-right">比赛名称：</label>
														<input type="text" id="matchName" class="form-control"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="time">获奖时间：</label>
														<input type="text" id="prizeTime" class="form-control" onClick="laydate()"/>
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="prize">获奖等级：</label>
														<select id="prizeLevel" class="form-control">
															<option value="-1">---请选择获奖等级---</option>
															<option value="1">金奖(一等奖)</option>
															<option value="2">银奖(二等奖)</option>
															<option value="3">铜奖(三等奖)</option>
															<option value="4">优胜奖(成功参赛奖)</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">主办单位：</label>
														<input type="text" id="hostUnit" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">团队名称：</label>
														<input type="text" id="teamName" class="form-control" />
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">队员1姓名：</label>
														<input type="text" id="teammateName1" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员1学号：</label>
														<input type="text" id="teammateStuNumber1" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2姓名：</label>
														<input type="text" id="teammateName2" class="form-control" />
													</div>
												</div>
												<!-- 第四行 -->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员2学号：</label>
														<input type="text" id="teammateStuNumber2" class="form-control"  />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3姓名：</label>
														<input type="text" id="teammateName3" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">队员3学号：</label>
														<input type="text" id="teammateStuNumber3" class="form-control" />
													</div>
												</div>
												<!--第五行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" class="form-control" id="teacherName" />
													</div>
												</div>
												<div class="clearfix"></div>
												<input type="button" value="提交" id="sort_math"/>

											</form>
											<form action="/import/math" enctype="multipart/form-data" method="post">
												<input type="file" name="file">
												<input type="submit" value="导入excel">
											</form>
											<h1>${message}</h1>
										</div>
									</div>
									<!--挑战杯添加-->
									<div class="tab-pane" id="tab-challenge">
										<div class="row feature">
											<form class="condition_form form-inline" action="${website}ChallengeCup/add" method="post">
												<!--第一行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">比赛名称：</label>
														<input type="text" name="matchName" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">主办单位：</label>
														<input type="text" name="hostUnit" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">比赛等级：</label>
														<select class="form-control" name="matchLevel">
															<option class="level_option" value="-1">---请选择比赛等级---</option>
															<option value="1">校级</option>
															<option value="2">市级</option>
															<option value="3">省级</option>
															<option value="4">多省级</option>
															<option value="5">国家级</option>
															<option value="6">亚洲级</option>
															<option value="7">国际级</option>
														</select>
													</div>
												</div>
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">获奖等级：</label>
														<select class="form-control" name="prizeLevel">
															<option class="level_option" value="-1">---请选择获奖等级---</option>
															<option value="1">一等奖(金奖)</option>
															<option value="2">二等奖(银奖)</option>
															<option value="3">三等奖(铜奖)</option>
															<option value="4">成功参赛奖(优胜奖)</option>
														</select>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="time">获奖时间：</label>
														<input type="date" id="prizeTime" name="prizeTime" class="form-control" onClick="laydate()"/>
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="tutor">指导老师：</label>
														<input type="text" class="form-control" name="prizeTime"/>
													</div>
												</div>
												<!--第二行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">团队名：</label>
														<input type="text" name="teamName" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right">项目名：</label>
														<input type="text" name="projectName" class="form-control" />
													</div>
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_name">团队成员1姓名：</label>
														<input type="text" id="student_name" class="form-control" name="teammateName1"/>
													</div>
												</div>
												<!--第三行-->
												<div class="tab-row">
													<div class="form-group col-sm-4">
														<label class="tab-label control-label text-right" for="student_number">团队成员1学号：</label>
														<input type="text" id="student_number" class="form-control" name="teammateStuNumber1"/>
													</div>
												</div>
												<!--第五行-->
												<input type="button" value="提交" id="sort_comp" />

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
		<script type="text/javascript" src="${staticWebsite}resources/js/add.js"></script>
		<script type="text/javascript" src="${staticWebsite}resources/js/addmember.js"></script>
	</body>

</html>