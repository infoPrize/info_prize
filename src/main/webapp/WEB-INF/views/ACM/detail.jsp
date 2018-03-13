<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>ACM详情页</title>
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
                            <h3 class="detail_title">这是ACM获奖信息中id为${acmPrizeDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">比赛类别</th>
                                    <td >${acmPrizeDto.matchLevel}</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >${acmPrizeDto.matchName}</td>
                                    <th class="text-center">主办单位</th>
                                    <td >${acmPrizeDto.hostUnit}</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">获奖时间</th>
                                    <td >${acmPrizeDto.prizeTimeStr}</td>
                                    <th class="text-center">获奖等级	</th>
                                    <td >${acmPrizeDto.prizeLevel}</td>
                                    <th class="text-center">团队名称</th>
                                    <td >${acmPrizeDto.teamName}</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">参赛成员1</th>
                                    <td >${acmPrizeDto.teammateName1}</td>
                                    <th class="text-center">成员1学号</th>
                                    <td >${acmPrizeDto.teammateStuNumber1}</td>
                                    <th class="text-center">成员1专业</th>
                                    <td >${acmPrizeDto.teammateMajor1}</td>
                                </tr>
                                <!--第四行-->
                                <c:if test="${!empty acmPrizeDto.teammateName2 and acmPrizeDto.teammateName2 ne ''}">
                                <tr>
                                    <th class="text-center">参赛成员2</th>
                                    <td >${acmPrizeDto.teammateName2}</td>
                                    <th class="text-center">成员2学号</th>
                                    <td >${acmPrizeDto.teammateStuNumber2}</td>
                                    <th class="text-center">成员2专业</th>
                                    <td >${acmPrizeDto.teammateMajor2}</td>
                                </tr>
                                </c:if>
                                <!--第五行-->
                                <c:if test="${!empty acmPrizeDto.teammateName3 and acmPrizeDto.teammateName3 ne ''}">
                                <tr>
                                    <th class="text-center">参赛成员3</th>
                                    <td >${acmPrizeDto.teammateName3}</td>
                                    <th class="text-center">成员3学号</th>
                                    <td >${acmPrizeDto.teammateStuNumber3}</td>
                                    <th class="text-center">成员3专业</th>
                                    <td >${acmPrizeDto.teammateMajor3}</td>
                                </tr>
                                </c:if>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >${acmPrizeDto.teacherName}</td>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <th class="text-center" >图片名称</th>
                                    <th class="text-center" colspan="4">图片预览</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                <!--第九行-->
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td>${list.materialName}</td>
                                        <td colspan="4"><img src="${website}${list.materialUrl}" class="detail_img"> </td>
                                        <td><a href="${website}acm/delete/material?matchId=${list.matchId}&materialUrl=${list.materialUrl}&id=${list.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>


                            <form action="${website}acm/upload/${acmPrizeDto.id}/${acmPrizeDto.teamName}" enctype="multipart/form-data" method="post" class="dinline">
                                <label class="tab-label control-label text-right">导入excel：</label>
                                <input type="text" id="file_name" readonly="readonly" value=""/>
                                <a href="javascript:void(0);" class="input top">
                                    浏览
                                    <input type="file" id="file" name="file">
                                </a>
                                <input type="submit" class="input" value="确定"/>

                            </form>
                            <a href="${website}acm/down/${acmPrizeDto.teamName}" id="download">下载</a>
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
