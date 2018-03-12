<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>互联网+详情页</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
    <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
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
                            <h3 class="detail_title">这是其他比赛中id为${otherMatchDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">比赛级别</th>
                                    <td >${otherMatchDto.matchLevel}</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >${otherMatchDto.matchName}</td>
                                    <th class="text-center">项目名称</th>
                                    <td >${otherMatchDto.projectName}</td>
                                    <th class="text-center">主办单位</th>
                                    <td >${otherMatchDto.hostUnit}</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <c:if test="${!empty otherMatchDto.stuName1 and otherMatchDto.stuName1 ne''}">
                                    <th class="text-center">获奖成员1</th>
                                    <td >${otherMatchDto.stuName1}</td>
                                    <th class="text-center">成员1学号</th>
                                    <td >${otherMatchDto.stuNumber1}</td>
                                    </c:if>
                                    <c:if test="${!empty otherMatchDto.stuName2 and otherMatchDto.stuName2 ne''}">
                                    <th class="text-center">获奖成员2</th>
                                    <td >${otherMatchDto.stuName2}</td>
                                    <th class="text-center">成员2学号</th>
                                    <td >${otherMatchDto.stuNumber2}</td>
                                    </c:if>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <c:if test="${!empty otherMatchDto.stuName3 and otherMatchDto.stuName3 ne''}">
                                    <th class="text-center">获奖成员3</th>
                                    <td >${otherMatchDto.stuName3}</td>
                                    <th class="text-center">成员3学号</th>
                                    <td >${otherMatchDto.stuNumber3}</td>
                                    </c:if>
                                    <c:if test="${!empty otherMatchDto.stuName4 and otherMatchDto.stuName4 ne''}">
                                    <th class="text-center">获奖成员4</th>
                                    <td >${otherMatchDto.stuName4}</td>
                                    <th class="text-center">成员4学号</th>
                                    <td >${otherMatchDto.stuNumber4}</td>
                                    </c:if>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <c:if test="${!empty otherMatchDto.stuName5 and otherMatchDto.stuName5 ne''}">
                                    <th class="text-center">获奖成员5</th>
                                    <td >${otherMatchDto.stuName5}</td>
                                    <th class="text-center">成员5学号</th>
                                    <td >${otherMatchDto.stuNumber5}</td>
                                    </c:if>
                                    <c:if test="${!empty otherMatchDto.stuName6 and otherMatchDto.stuName6 ne''}">
                                    <th class="text-center">获奖成员6</th>
                                    <td >${otherMatchDto.stuName6}</td>
                                    <th class="text-center">成员6学号</th>
                                    <td >${otherMatchDto.stuNumber6}</td>
                                    </c:if>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <c:if test="${!empty otherMatchDto.stuName7 and otherMatchDto.stuName7 ne''}">
                                    <th class="text-center">获奖成员7</th>
                                    <td >${otherMatchDto.stuName7}</td>
                                    <th class="text-center">成员7学号</th>
                                    <td >${otherMatchDto.stuNumber7}</td>
                                    </c:if>
                                    <c:if test="${!empty otherMatchDto.stuName8 and otherMatchDto.stuName8 ne''}">
                                    <th class="text-center">获奖成员8</th>
                                    <td >${otherMatchDto.stuName8}</td>
                                    <th class="text-center">成员8学号</th>
                                    <td >${otherMatchDto.stuNumber8}</td>
                                    </c:if>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">获奖等级</th>
                                    <td >${otherMatchDto.prizeLevel}</td>
                                    <th class="text-center">获奖时间</th>
                                    <td >${otherMatchDto.prizeTimeStr}</td>
                                    <th class="text-center">指导老师</th>
                                    <td >${otherMatchDto.teacherName}</td>
                                </tr>
                                <!--第七行-->
                                <tr>
                                    <th class="text-center" >图片名称</th>
                                    <th class="text-center" colspan="6">图片预览</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                <!--第九行-->
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td>${list.materialName}</td>
                                        <td colspan="6"><img src="${website}${list.materialUrl}" class="detail_img"> </td>
                                        <td><a href="/otherMatch/delete/material?matchId=${list.matchId}&materialUrl=${list.materialUrl}&id=${list.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/otherMatch/upload/${otherMatchDto.id}/${otherMatchDto.projectName}" enctype="multipart/form-data" method="post" class="dinline">
                                <label class="tab-label control-label text-right">导入excel：</label>
                                <input type="text" id="file_name" readonly="readonly" value=""/>
                                <a href="javascript:void(0);" class="input top">
                                    浏览
                                    <input type="file" id="file" name="file">
                                </a>
                                <input type="submit" class="input" value="确定"/>

                            </form>
                            <a href="/otherMatch/down/${otherMatchDto.projectName}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${staticWebsite}resources/js/add.js"></script>

</body>
</html>

