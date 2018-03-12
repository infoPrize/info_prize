<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>专利详情页</title>
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
                            <h3 class="detail_title">这是专利信息中id为${patentDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">专利类别</th>
                                    <td >${patentDto.patentType}</td>
                                    <th class="text-center">专利名称</th>
                                    <td >${patentDto.patentName}</td>
                                    <th class="text-center">申请成功时间</th>
                                    <td >${patentDto.applyTimeStr}</td>
                                </tr>
                                <!--第二行-->
                                <c:if test="${!empty patentDto.applierName1 and patentDto.applierName1 ne ''}">
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >${patentDto.applierName1}</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >${patentDto.applierMajor1}</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >${patentDto.applierStuNumber1}</td>
                                </tr>
                                </c:if>
                                <!--第三行-->
                                <c:if test="${!empty patentDto.applierName2 and patentDto.applierName2 ne ''}">
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >${patentDto.applierName2}</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >${patentDto.applierMajor2}</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >${patentDto.applierStuNumber2}</td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty patentDto.applierName3 and patentDto.applierName3 ne ''}">
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >${patentDto.applierName3}</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >${patentDto.applierMajor3}</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >${patentDto.applierStuNumber3}</td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty patentDto.applierName4 and patentDto.applierName4 ne ''}">
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >${patentDto.applierName4}</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >${patentDto.applierMajor4}</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >${patentDto.applierStuNumber4}</td>
                                </tr>
                                </c:if>
                                <c:if test="${!empty patentDto.applierName5 and patentDto.applierName5 ne ''}">
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >${patentDto.applierName5}</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >${patentDto.applierMajor5}</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >${patentDto.applierStuNumber5}</td>
                                </tr>
                                </c:if>
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >${patentDto.teacherName}</td>
                                    <th class="text-center">专利内容</th>
                                    <td colspan="3"><p class="detail_p">
                                        ${patentDto.introduce}
                                    </p></td>
                                </tr>
                                <!--第四行-->
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
                                        <td><a href="/patent/delete/material?matchId=${list.matchId}&materialUrl=${list.materialUrl}&id=${list.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/patent/upload/${patentDto.id}/${patentDto.patentName}" enctype="multipart/form-data" method="post" class="dinline">
                                <label class="tab-label control-label text-right">导入excel：</label>
                                <input type="text" id="file_name" readonly="readonly" value=""/>
                                <a href="javascript:void(0);" class="input top">
                                    浏览
                                    <input type="file" id="file" name="file">
                                </a>
                                <input type="submit" class="input" value="确定"/>

                            </form>
                            <a href="/patent/down/${patentDto.patentName}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${staticWebsite}resources/js/add.js"></script>

</body>
</html>