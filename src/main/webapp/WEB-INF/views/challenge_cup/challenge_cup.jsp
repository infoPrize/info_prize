<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>挑战杯</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
    <link rel="stylesheet" href="${staticWebsite}resources/css/page.css">
    <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css" />
</head>
<body onload="initdataCup()">
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
                                        <label class="tab-label control-label text-right" for="matchName">比赛名称：</label>
                                        <input type="text" id="matchName" class="form-control" name="matchName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="matchLevel">比赛等级：</label>
                                        <select id="matchLevel" class="form-control" name="matchLevel">
                                            <option value="-1">---请选择比赛等级---</option>
                                            <option value="1">校级</option>
                                            <option value="2">市级</option>
                                            <option value="3">省级</option>
                                            <option value="4">多省级</option>
                                            <option value="5">国家级</option>
                                            <option value="6">亚洲级</option>
                                            <option value="7">国际级</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="prizeLevel">获奖等级：</label>
                                        <select id="prizeLevel" class="form-control" name="prizeLevel">
                                            <option value="-1">---请选择---</option>
                                            <option value="1">一等奖(金奖)</option>
                                            <option value="2">二等奖(银奖)</option>
                                            <option value="3">三等奖(铜奖)</option>
                                            <option value="4">成功参赛奖(优胜奖)</option>
                                        </select>
                                    </div>

                                </div>
                                <!--第二行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="startTime">起始时间：</label>
                                        <input type="text" id="startTime" class="form-control" name="startTime" onClick="laydate()"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right">结束时间：</label>
                                        <input type="text" id="endTime" class="form-control end" name="endTime"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="teamName">团队名称：</label>
                                        <input type="text" id="teamName" class="form-control" name="teamName"/>
                                    </div>
                                </div>
                                <!--第三行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="stuName">学生姓名：</label>
                                        <input type="text" id="stuName" class="form-control" name="stuName"/>
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
                                        <label class="tab-label control-label text-right" for="projectName">项目名称：</label>
                                        <input type="text" id="projectName" class="form-control" name="projectName"/>
                                    </div>
                                </div>
                                <!--第四行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="hostUnit">主办单位：</label>
                                        <input type="text" id="hostUnit" class="form-control" name="hostUnit"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="teacherName">指导老师：</label>
                                        <input type="text" id="teacherName" class="form-control" name="teacherName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <input type="button" class="inlibut" value="选择" type="submit" onclick="initdataCup()"/>
                                        <input type="button" class="inlibut" value="导出Excel" type="submit" onclick="form.action='${website}export/challengeCup';form.submit();"/>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                        <div class="x_title">
                            <h3>查询结果</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">比赛级别</th>
                                    <th class="text-center">比赛名称</th>
                                    <th class="text-center">项目名称</th>
                                    <th class="text-center">团队名称</th>
                                    <th class="text-center">参赛成员</th>
                                    <th class="text-center">成员学号</th>
                                    <th class="text-center">成员专业</th>
                                    <th class="text-center">获奖等级</th>
                                    <th class="text-center">比赛时间</th>
                                    <th class="text-center">主办单位</th>
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
    <script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js" ></script>
    <script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js" ></script>
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
