<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>互联网+详情页</title>
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
                            <h3 class="detail_title">这是互联网+信息中id为${internetPlusDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">比赛级别</th>
                                    <td >${internetPlusDto.matchLevel}</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >${internetPlusDto.matchName}</td>
                                    <th class="text-center">项目名称</th>
                                    <td >${internetPlusDto.projectName}</td>
                                    <th class="text-center">团队名称</th>
                                    <td >${internetPlusDto.teamName}</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <c:if test="${!empty internetPlusDto.stuName1 and internetPlusDto.stuName1 ne ''}">
                                    <th class="text-center">参赛成员1</th>
                                    <td >${internetPlusDto.stuName1}</td>
                                    <th class="text-center">成员1学号</th>
                                    <td >${internetPlusDto.stuNumber1}</td>
                                    </c:if>
                                    <c:if test="${!empty internetPlusDto.stuName2 and internetPlusDto.stuName2 ne ''}">
                                    <th class="text-center">参赛成员2</th>
                                    <td >${internetPlusDto.stuName2}</td>
                                    <th class="text-center">成员2学号</th>
                                    <td >${internetPlusDto.stuNumber2}</td>
                                    </c:if>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <c:if test="${!empty internetPlusDto.stuName3 and internetPlusDto.stuName3 ne ''}">
                                    <th class="text-center">参赛成员3</th>
                                    <td >${internetPlusDto.stuName3}</td>
                                    <th class="text-center">成员3学号</th>
                                    <td >${internetPlusDto.stuNumber3}</td>
                                    </c:if>
                                    <c:if test="${!empty internetPlusDto.stuName4 and internetPlusDto.stuName4 ne ''}">
                                    <th class="text-center">参赛成员4</th>
                                    <td >${internetPlusDto.stuName4}</td>
                                    <th class="text-center">成员4学号</th>
                                    <td >${internetPlusDto.stuNumber4}</td>
                                    </c:if>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <c:if test="${!empty internetPlusDto.stuName5 and internetPlusDto.stuName5 ne ''}">
                                    <th class="text-center">参赛成员5</th>
                                    <td >${internetPlusDto.stuName5}</td>
                                    <th class="text-center">成员5学号</th>
                                    <td >${internetPlusDto.stuNumber5}</td>
                                    </c:if>
                                    <c:if test="${!empty internetPlusDto.stuName6 and internetPlusDto.stuName6 ne ''}">
                                    <th class="text-center">参赛成员6</th>
                                    <td >${internetPlusDto.stuName6}</td>
                                    <th class="text-center">成员6学号</th>
                                    <td >${internetPlusDto.stuNumber6}</td>
                                    </c:if>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <c:if test="${!empty internetPlusDto.stuName7 and internetPlusDto.stuName7 ne ''}">
                                    <th class="text-center">参赛成员7</th>
                                    <td >${internetPlusDto.stuName7}</td>
                                    <th class="text-center">成员7学号</th>
                                    <td >${internetPlusDto.stuNumber7}</td>
                                    </c:if>
                                    <c:if test="${!empty internetPlusDto.stuName8 and internetPlusDto.stuName8 ne ''}">
                                    <th class="text-center">参赛成员8</th>
                                    <td >${internetPlusDto.stuName8}</td>
                                    <th class="text-center">成员8学号</th>
                                    <td >${internetPlusDto.stuNumber8}</td>
                                    </c:if>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">获奖等级</th>
                                    <td >${internetPlusDto.prizeLevel}</td>
                                    <th class="text-center">比赛时间</th>
                                    <td >${internetPlusDto.prizeTimeStr}</td>
                                    <th class="text-center">主办单位</th>
                                    <td >${internetPlusDto.hostUnit}</td>
                                    <th class="text-center">指导老师</th>
                                    <td >${internetPlusDto.teacherName}</td>
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
                                        <td><a href="${website}InternetPlus/delete/material?matchId=${list.matchId}&materialUrl=${list.materialUrl}&id=${list.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="${website}InternetPlus/upload/${internetPlusDto.id}/${internetPlusDto.projectName}" enctype="multipart/form-data" method="post" class="dinline">
                                <label class="tab-label control-label text-right">导入图片：</label>
                                <input type="text" id="file_name" readonly="readonly" value=""/>
                                <a href="javascript:void(0);" class="input top">
                                    浏览
                                    <input type="file" id="file" name="file">
                                </a>
                                <input type="submit" class="input" value="确定" id="define"/>
                            </form>
                            <a href="${website}InternetPlus/down/${internetPlusDto.projectName}" id="download">下载</a>
                            ${message}
                        </div>
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
