<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>挑战杯详情页</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
    <link rel="stylesheet" href="${staticWebsite}resources/iconfont/1.0.1/iconfont.css">
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
                            <span type="button" class="icon-uniE60D back" onclick="javascript:history.back();">返回</span>
                            <h3 class="detail_title">这是挑战杯信息中id为${challengeCupDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">比赛级别</th>
                                    <td >${challengeCupDto.matchLevel}</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >${challengeCupDto.matchName}</td>
                                    <th class="text-center">项目名称</th>
                                    <td >${challengeCupDto.projectName}</td>
                                    <th class="text-center">团队名称</th>
                                    <td >${challengeCupDto.teamName}</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <c:if test="${!empty challengeCupDto.stuName1 and challengeCupDto.stuName1 ne ''}">
                                        <th class="text-center">参赛成员1</th>
                                        <td >${challengeCupDto.stuName1}</td>
                                        <th class="text-center">成员1学号</th>
                                        <td >${challengeCupDto.stuNumber1}</td>
                                    </c:if>
                                    <c:if test="${!empty challengeCupDto.stuName2 and challengeCupDto.stuName2 ne ''}">
                                        <th class="text-center">参赛成员2</th>
                                        <td >${challengeCupDto.stuName2}</td>
                                        <th class="text-center">成员2学号</th>
                                        <td >${challengeCupDto.stuNumber2}</td>
                                    </c:if>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <c:if test="${!empty challengeCupDto.stuName3 and challengeCupDto.stuName3 ne ''}">
                                        <th class="text-center">参赛成员3</th>
                                        <td >${challengeCupDto.stuName3}</td>
                                        <th class="text-center">成员3学号</th>
                                        <td >${challengeCupDto.stuNumber3}</td>
                                    </c:if>
                                    <c:if test="${!empty challengeCupDto.stuName4 and challengeCupDto.stuName4 ne ''}">
                                        <th class="text-center">参赛成员4</th>
                                        <td >${challengeCupDto.stuName4}</td>
                                        <th class="text-center">成员4学号</th>
                                        <td >${challengeCupDto.stuNumber4}</td>
                                    </c:if>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <c:if test="${!empty challengeCupDto.stuName5 and challengeCupDto.stuName5 ne ''}">
                                        <th class="text-center">参赛成员5</th>
                                        <td >${challengeCupDto.stuName5}</td>
                                        <th class="text-center">成员5学号</th>
                                        <td >${challengeCupDto.stuNumber5}</td>
                                    </c:if>
                                    <c:if test="${!empty challengeCupDto.stuName6 and challengeCupDto.stuName6 ne ''}">
                                        <th class="text-center">参赛成员6</th>
                                        <td >${challengeCupDto.stuName6}</td>
                                        <th class="text-center">成员6学号</th>
                                        <td >${challengeCupDto.stuNumber6}</td>
                                    </c:if>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <c:if test="${!empty challengeCupDto.stuName7 and challengeCupDto.stuName7 ne ''}">
                                        <th class="text-center">参赛成员7</th>
                                        <td >${challengeCupDto.stuName7}</td>
                                        <th class="text-center">成员7学号</th>
                                        <td >${challengeCupDto.stuNumber7}</td>
                                    </c:if>
                                    <c:if test="${!empty challengeCupDto.stuName8 and challengeCupDto.stuName8 ne ''}">
                                        <th class="text-center">参赛成员8</th>
                                        <td >${challengeCupDto.stuName8}</td>
                                        <th class="text-center">成员8学号</th>
                                        <td >${challengeCupDto.stuNumber8}</td>
                                    </c:if>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">获奖等级</th>
                                    <td >${challengeCupDto.prizeLevel}</td>
                                    <th class="text-center">比赛时间</th>
                                    <td >${challengeCupDto.prizeTimeStr}</td>
                                    <th class="text-center">主办单位</th>
                                    <td >${challengeCupDto.hostUnit}</td>
                                    <th class="text-center">指导老师</th>
                                    <td >${challengeCupDto.teacherName}</td>
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
                                        <td><a href="${website}ChallengeCup/delete/material/${list.id}/${challengeCupDto.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <c:if test="${sessionScope.stuNumber eq 'admin'}">
                                <form action="${website}ChallengeCup/upload/${challengeCupDto.id}/${challengeCupDto.projectName}" enctype="multipart/form-data" method="post" class="dinline">
                                    <label class="tab-label control-label text-right">导入图片：</label>
                                    <input type="text" id="file_name" readonly="readonly" value=""/>
                                    <a href="javascript:void(0);" class="input top">
                                        浏览
                                        <input type="file" id="file" name="file">
                                    </a>
                                    <input type="submit" class="input" value="确定" id="define"/>

                                </form>
                                <a href="${website}ChallengeCup/down/${challengeCupDto.projectName}" id="download">下载</a>
                                ${message}
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${staticWebsite}resources/js/add.js"></script>

</body>
</html>
