<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>国创科研详情页</title>
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
                            <h3 class="detail_title">这是国创科研信息中id为${scientificProject.id}的信息详情页</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <th class="text-center">项目类别</th>
                                    <td >一般科研立项</td>
                                    <th class="text-center">项目名称</th>
                                    <td colspan="5">AR2</td>
                                    <th class="text-center">立项年份</th>
                                    <td >2017</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">项目负责人</th>
                                    <td >刘旺</td>
                                    <th class="text-center">负责人性别</th>
                                    <td >女</td>
                                    <th class="text-center">负责人学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">负责人联系方式</th>
                                    <td >2015011969</td>
                                    <th class="text-center">负责人专业</th>
                                    <td >软件工程</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">项目组成员1</th>
                                    <td >刘旺</td>
                                    <th class="text-center">组员1学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">项目组成员2</th>
                                    <td >刘旺</td>
                                    <th class="text-center">组员2学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">指导老师</th>
                                    <td >李勍</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">项目组成员3</th>
                                    <td >刘旺</td>
                                    <th class="text-center">组员3学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">项目组成员4</th>
                                    <td >刘旺</td>
                                    <th class="text-center">组员4学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">批复经费</th>
                                    <td >5000</td>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <th class="text-center">项目简介</th>
                                    <td colspan="9"><p class="detail_p">文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容
                                    </p></td>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <th class="text-center" >图片名称</th>
                                    <th class="text-center" colspan="8">图片预览</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                <!--第九行-->
                                <c:forEach items="${list}" var="list">
                                    <tr>
                                        <td>${list.materialName}</td>
                                        <td colspan="8"><img src="${website}${list.materialUrl}" class="detail_img"> </td>
                                        <td><a href="/thesis/delete/material/${list.id}/${scientificProject.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/thesis/upload/${scientificProject.id}" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="上传材料" id="upload">
                            </form>
                            <br>
                            <a href="/thesis/down/${scientificProject.id}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
