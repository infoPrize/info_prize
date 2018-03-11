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
                            <h3 class="detail_title">这是互联网+信息中id为${internetPlusDto.id}的详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">比赛级别</th>
                                    <td >多省级</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >第十五届互联网+1</td>
                                    <th class="text-center">项目名称</th>
                                    <td >${internetPlusDto.projectName}</td>
                                    <th class="text-center">团队名称</th>
                                    <td >HelloWorld</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">参赛成员1</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员1学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">参赛成员2</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员2学号</th>
                                    <td >2015011969</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">参赛成员3</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员3学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">参赛成员4</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员4学号</th>
                                    <td >2015011969</td>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <th class="text-center">参赛成员5</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员5学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">参赛成员6</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员6学号</th>
                                    <td >2015011969</td>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <th class="text-center">参赛成员7</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员7学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">参赛成员8</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员8学号</th>
                                    <td >2015011969</td>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">获奖等级</th>
                                    <td >二等奖(银奖)</td>
                                    <th class="text-center">比赛时间</th>
                                    <td >2018-01-17</td>
                                    <th class="text-center">主办单位</th>
                                    <td >黑龙江省教育厅</td>
                                    <th class="text-center">指导老师</th>
                                    <td >李勍</td>
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
                                        <td><a href="/InternetPlus/delete/material/${list.id}/${internetPlusDto.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/InternetPlus/upload/${internetPlusDto.id}/${internetPlusDto.projectName}" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="上传材料" id="upload">
                            </form>
                            <br>
                            <a href="/InternetPlus/down/${internetPlusDto.projectName}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
