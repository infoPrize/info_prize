<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>数学建模信息录入</title>
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
                        <h3>数学建模信息录入</h3>
                        <hr/>
                    </div>
                    <div class="x_content">
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
                            </div>
                        </div>

                    </div>
                    <hr/>
                    <form action="/import/math" enctype="multipart/form-data" method="post" class="dinline">
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