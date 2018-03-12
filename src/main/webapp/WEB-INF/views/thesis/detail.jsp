<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>论文详情页</title>
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
                            <h3 class="detail_title">这是论文中id为${thesisDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">期刊级别</th>
                                    <td >${thesisDto.journalLevel}</td>
                                    <th class="text-center">发表刊物</th>
                                    <td >${thesisDto.journalName}</td>
                                    <th class="text-center">论文题目</th>
                                    <td >${thesisDto.thesisTitle}</td>
                                    <th class="text-center">发表时间</th>
                                    <td >${thesisDto.publishTimeStr}</td>
                                </tr>
                                <!--第二行-->
                                <c:if test="${!empty thesisDto.authorName1 and thesisDto.authorName1 ne ''}">
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >${thesisDto.authorName1}</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第${thesisDto.authorLevel1}作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >${thesisDto.authorStuNumber1}</td>
                                    <th class="text-center">作者专业</th>
                                    <td>${thesisDto.authorMajor1}</td>
                                </tr>
                                </c:if>
                                <!--第三行-->
                                <c:if test="${!empty thesisDto.authorName2 and thesisDto.authorName2 ne ''}">
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >${thesisDto.authorName2}</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第${thesisDto.authorLevel2}作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >${thesisDto.authorStuNumber2}</td>
                                    <th class="text-center">作者专业</th>
                                    <td>${thesisDto.authorMajor2}</td>
                                </tr>
                                </c:if>
                                <!--第四行-->
                                <c:if test="${!empty thesisDto.authorName3 and thesisDto.authorName3 ne ''}">
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >${thesisDto.authorName3}</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第${thesisDto.authorLevel3}作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >${thesisDto.authorStuNumber3}</td>
                                    <th class="text-center">作者专业</th>
                                    <td>${thesisDto.authorMajor3}</td>
                                </tr>
                                </c:if>
                                <!--第五行-->
                                <c:if test="${!empty thesisDto.authorName4 and thesisDto.authorName4 ne ''}">
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >${thesisDto.authorName4}</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第${thesisDto.authorLevel4}作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >${thesisDto.authorStuNumber4}</td>
                                    <th class="text-center">作者专业</th>
                                    <td>${thesisDto.authorMajor4}</td>
                                </tr>
                                </c:if>
                                <!--第六行-->
                                <c:if test="${!empty thesisDto.authorName5 and thesisDto.authorName5 ne ''}">
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >${thesisDto.authorName5}</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第${thesisDto.authorLevel5}作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >${thesisDto.authorStuNumber5}</td>
                                    <th class="text-center">作者专业</th>
                                    <td>${thesisDto.authorMajor5}</td>
                                </tr>
                                </c:if>
                                <!--第七行-->
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >${thesisDto.teacherName}</td>
                                    <th class="text-center">论文摘要</th>
                                    <td colspan="5"><p class="detail_p">
                                        ${thesisDto.thesisAbstract}
                                    </p></td>
                                </tr>
                                <!--第八行-->
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
                                        <td><a href="/thesis/delete/material?matchId=${list.matchId}&materialUrl=${list.materialUrl}&id=${list.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <form action="/thesis/upload/${thesisDto.id}/${thesisDto.thesisTitle}" enctype="multipart/form-data" method="post" class="dinline">
                                <label class="tab-label control-label text-right">导入excel：</label>
                                <input type="text" id="file_name" readonly="readonly" value=""/>
                                <a href="javascript:void(0);" class="input top">
                                    浏览
                                    <input type="file" id="file" name="file">
                                </a>
                                <input type="submit" class="input" value="确定"/>

                            </form>
                            <a href="/thesis/down/${thesisDto.thesisTitle}" id="download">下载</a>
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
