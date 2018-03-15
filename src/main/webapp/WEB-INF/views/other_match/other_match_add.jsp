<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>其他比赛信息录入</title>
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
                        <h3>其他比赛信息录入</h3>
                        <hr/>
                    </div>
                    <div class="x_content">
                        <div class="tab-pane" id="tab-challenge">
                            <div class="row feature">
                                <form class="condition_form form-inline" action="${website}otherMatch/add" method="get">
                                    <!--第一行-->
                                    <div class="tab-row">
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="matchName">比赛名称：</label>
                                            <input type="text" name="matchName" class="form-control" id="matchName"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="hostUnit">主办单位：</label>
                                            <input type="text" name="hostUnit" class="form-control" id="hostUnit"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="matchLevel">比赛等级：</label>
                                            <select class="form-control" name="matchLevel" id="matchLevel">
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
                                            <label class="tab-label control-label text-right" for="prizeLevel">获奖等级：</label>
                                            <select class="form-control" name="prizeLevel" id="prizeLevel">
                                                <option class="level_option" value="-1">---请选择获奖等级---</option>
                                                <option value="1">一等奖(金奖)</option>
                                                <option value="2">二等奖(银奖)</option>
                                                <option value="3">三等奖(铜奖)</option>
                                                <option value="4">成功参赛奖(优胜奖)</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="prizeTime">获奖时间：</label>
                                            <input type="text" id="prizeTime" name="prizeTime" class="form-control" onClick="laydate()"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
                                            <input type="text" class="form-control" name="teacherName" id="teacherName"/>
                                        </div>
                                    </div>
                                    <div class="tab-row" id="other_match">
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="projectName">项目名：</label>
                                            <input type="text" name="projectName" class="form-control" id="projectName"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="teammateName1">团队成员姓名：</label>
                                            <input type="text" id="teammateName1" class="form-control" name="teammateName1"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="teammateStuNumber1">团队成员学号：</label>
                                            <input type="text" id="teammateStuNumber1" class="form-control" name="teammateStuNumber1"/>
                                        </div>
                                    </div>
                                    <input type="button" value="提交" id="sort_other"/>
                                    <input type="button" value="添加组员" id="addother_match">
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <form action="${website}import/otherMatch" enctype="multipart/form-data" method="post" class="dinline">
                        <label class="tab-label control-label text-right">导入excel：</label>
                        <input type="text" id="file_name" readonly="readonly" value=""/>
                        <a href="javascript:void(0);" class="input top">
                            浏览
                            <input type="file" id="file" name="file">
                        </a>
                        <input type="submit" class="input" value="确定" id="define"/>${message}
                        <a href="${staticWebsite}resources/otherMatch.xls" id="download_model">下载excel模板</a>
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
