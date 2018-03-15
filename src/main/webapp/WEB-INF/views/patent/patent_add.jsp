<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>专利信息录入</title>
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
                        <h3>专利信息录入</h3>
                        <hr/>
                    </div>
                    <div class="x_content">
                        <div class="tab-pane" id="tab-product">
                            <div class="row feature">
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
                                                <option value="4">其他</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="patentName">专利名称：</label>
                                            <input type="text" id="patentName" class="form-control" name="patentName"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="applyTime">申请成功时间：</label>
                                            <input type="text" id="applyTime" name="applyTime" class="form-control" onClick="laydate()"/>
                                        </div>

                                    </div>
                                    <!--第二行-->
                                    <div class="tab-row" id="patent">
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
                                            <input type="text" id="teacherName" class="form-control" name="teacherName" />
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="applierName1">申请人姓名</label>
                                            <input type="text" class="form-control" id="applierName1" name="applierName1" />
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="applierStuNumber1">申请人学号</label>
                                            <input type="text" class="form-control" id="applierStuNumber1" name="applierStuNumber1" />
                                        </div>

                                    </div>
                                    <!--第三行-->
                                    <div class="tab-row">
                                        <div class="col-sm-12">
                                            <label class="tab-label control-label text-right">专利介绍：</label>
                                            <textarea class="detailtext form-control" rows="3" style="width: 850px" name="patentIntroduce" id="patentIntroduce"></textarea>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <!--第五行-->
                                    <input type="button" value="提交" id="sortpatent" />
                                    <input type="button" value="添加申请人" id="addpatent">
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr/>
                    <form action="${website}/import/patent" enctype="multipart/form-data" method="post" class="dinline">
                        <label class="tab-label control-label text-right">导入excel：</label>
                        <input type="text" id="file_name" readonly="readonly" value=""/>
                        <a href="javascript:void(0);" class="input top">
                            浏览
                            <input type="file" id="file" name="file">
                        </a>
                        <input type="submit" class="input" value="确定" id="define"/>${message}
                        <a href="${staticWebsite}resources/patent.xls" id="download_model">下载excel模板</a>
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