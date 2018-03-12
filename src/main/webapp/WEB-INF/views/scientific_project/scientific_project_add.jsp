<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>国创科研信息录入</title>
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
                        <h3>国创科研信息录入</h3>
                        <hr/>
                    </div>
                    <div class="x_content">
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
                                                <label class="tab-label control-label text-right">组员姓名：</label>
                                                <input type="text" id="projectMemberName1" class="form-control" />
                                            </div>
                                            <div class="form-group col-sm-4">
                                                <label class="tab-label control-label text-right">组员学号：</label>
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
                                    <input type="button" value="提交" id="sort_scient"/>
                                    <input type="button" value="添加组员" id="addscientific_project">
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <form action="/import/scientificProject" enctype="multipart/form-data" method="post" class="dinline">
                        <label class="tab-label control-label text-right">导入excel：</label>
                        <input type="text" id="file_name" readonly="readonly" value=""/>
                        <a href="javascript:void(0);" class="input top">
                            浏览
                            <input type="file" id="file" name="file">
                        </a>
                        <input type="submit" class="input" value="确定"/>
                        <a href="#" id="download_model">下载excel模板</a>
                    </form>

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