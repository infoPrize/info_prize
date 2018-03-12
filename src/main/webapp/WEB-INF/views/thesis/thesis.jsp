<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>论文</title>
	<link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
	<link rel="stylesheet" href="${staticWebsite}resources/css/page.css">
	<link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
</head>
<body onload="initdataThesis()">
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
										<label class="tab-label control-label text-right" for="journalLevel">期刊级别：</label>
										<select id="journalLevel" class="form-control" name="journalLevel">
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
										<input type="text" name="journalName" class="form-control" id="journalName"/>
									</div>
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right" for="authorName">作者姓名：</label>
										<input type="text" id="authorName" class="form-control" name="authorName"/>
									</div>
								</div>
								<!--第二行-->
								<div class="tab-row">
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right" for="authorStuNumber">作者学号：</label>
										<input type="text" id="authorStuNumber" class="form-control" name="authorStuNumber"/>
									</div>
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right" for="authorMajor">作者专业：</label>
										<select id="authorMajor" class="form-control" name="authorMajor">
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
										<label class="tab-label control-label text-right" for="authorGrade">作者年级：</label>
										<input type="text" id="authorGrade" class="form-control" name="authorGrade"/>
									</div>
								</div>
								<!-- 第三行 -->
								<div class="tab-row">
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right">起始发表时间：</label>
										<input type="text" name="beginTime" id="beginTime" class="form-control" onClick="laydate()"/>
									</div>
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right">截止发表时间：</label>
										<input type="text" name="endTime" id="endTime" class="form-control" id="end"/>
									</div>
									<div class="form-group col-sm-4">
										<label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
										<input type="text" id="teacherName" class="form-control" name="teacherName"/>
									</div>
								</div>

								<!--第四行-->
								<input type="button" id="sort" value="选择" type="submit" onclick="initdataThesis()"/>
								<input type="button" id="sort" value="导出Excel" type="submit" onclick="form.action='/export/thesis';form.submit();"/>

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
            elem: '#end'
        })
    }();

</script>
</body>
</html>
