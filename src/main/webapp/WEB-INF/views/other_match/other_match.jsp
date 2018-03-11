<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Join
  Date: 2018/3/7
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>其他比赛</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
    <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css" />
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
                            <form class="condition_form form-inline" action="${website}otherMatch/listByCondition/1" method="get">
                                <!--第一行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="competition">比赛名称：</label>
                                        <input type="text" id="competition" class="form-control" name="matchName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="type">比赛等级：</label>
                                        <select id="type" class="form-control" name="matchLevel">
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
                                        <label class="tab-label control-label text-right" for="prize">获奖等级：</label>
                                        <select id="prize" class="form-control" name="prizeLevel">
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
                                        <label class="tab-label control-label text-right" for="starttime">起始时间：</label>
                                        <input type="text" id="starttime" class="form-control" name="startTime" onClick="laydate()"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right">结束时间：</label>
                                        <input type="text" id="end" class="form-control" name="endTime"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="unit">主办单位：</label>
                                        <input type="text" id="unit" class="form-control" name="hostUnit"/>
                                    </div>
                                </div>
                                <!--第三行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="projectname">项目名称：</label>
                                        <input type="text" id="projectname" class="form-control" name="projectName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="student_name">学生姓名：</label>
                                        <input type="text" id="student_name" class="form-control" name="stuName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="profession">学生专业：</label>
                                        <select id="profession" class="form-control" name="majorCode">
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
                                <!--第四行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-8">
                                        <label class="tab-label control-label text-right" for="tutor">指导老师：</label>
                                        <input type="text" id="tutor" class="form-control" name="teacherName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <input type="button" class="inlibut" value="选择" type="submit"/>
                                        <input type="button" class="inlibut" value="导出Excel" type="submit"/>
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
                                    <th class="text-center">比赛名称</th>
                                    <th class="text-center">比赛级别</th>
                                    <th class="text-center">主办单位</th>
                                    <th class="text-center">获奖人员</th>
                                    <th class="text-center">获奖人员学号</th>
                                    <th class="text-center">项目名称</th>
                                    <th class="text-center">获奖时间</th>
                                    <th class="text-center">获奖等级</th>
                                    <th class="text-center">指导老师</th>
                                    <th class="text-center">详情信息</th>
                                    <th class="text-center">操作</th>
                                </tr>

                                </thead>

                                <tbody>
                                <!--第一行-->
                                <c:forEach items="${otherMatchDtoList}" var="otherMatchDto">
                                    <tr>
                                        <td>${otherMatchDto.matchName}</td>
                                        <td>${otherMatchDto.matchLevel}</td>
                                        <td>${otherMatchDto.hostUnit}</td>
                                        <td class="td_table">
                                            <table class="sub">
                                                <tr><td>${challengeCupDto.stuName1}</td></tr>
                                                <tr><td>${challengeCupDto.stuName2}</td></tr>
                                                <tr><td>${challengeCupDto.stuName3}</td></tr>
                                                <tr><td>${challengeCupDto.stuName4}</td></tr>
                                                <tr><td>${challengeCupDto.stuName5}</td></tr>
                                                <tr><td>${challengeCupDto.stuName6}</td></tr>
                                                <tr><td>${challengeCupDto.stuName7}</td></tr>
                                                <tr><td>${challengeCupDto.stuName8}</td></tr>
                                            </table>
                                        </td>
                                        <td class="td_table">
                                            <table class="sub">
                                                <tr><td>${challengeCupDto.stuNumber1}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber2}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber3}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber4}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber5}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber6}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber7}</td></tr>
                                                <tr><td>${challengeCupDto.stuNumber8}</td></tr>
                                            </table>
                                        </td>
                                        <td>${challengeCupDto.prizeLevel}</td>
                                        <td>${challengeCupDto.prizeTimeStr}</td>
                                        <td>${otherMatchDto.prizeLevel}</td>
                                        <td>${challengeCupDto.teacherName}</td>
                                        <td ><a href="${website}otherMatch/toDetail/${otherMatchDto.id}">详情</a></td>
                                        <td class="aparent">
                                            <a href="${website}otherMatch/falseDeleteById/${otherMatchDto.id}" data-toggle="modal" data-target="#delete">删除</a>
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
                                <a href="${website}otherMatch/toPrevious">上一页</a>
                            </li>
                            <li>
                                <a href="${website}otherMatch/toNext">下一页</a>
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
    <script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js" ></script>
    <script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="${staticWebsite}resources/laydate/laydate.js"></script>
    <script type="text/javascript">
        !function(){
            laydate({
                elem: '#end'
            })
        }();
    </script>
</body>
</html>