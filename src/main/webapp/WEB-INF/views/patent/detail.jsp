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
                                    <td >发明专利</td>
                                    <th class="text-center">专利名称</th>
                                    <td >机器猫1</td>
                                    <th class="text-center">申请成功时间</th>
                                    <td >2017-12-12</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">申请人</th>
                                    <td >刘旺</td>
                                    <th class="text-center">申请人专业</th>
                                    <td >软件工程</td>
                                    <th class="text-center">申请人学号</th>
                                    <td >2015011969</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >李勍</td>
                                    <th class="text-center">专利内容</th>
                                    <td colspan="3"><p class="detail_p">文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容
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
                                        <td><a href="/thesis/delete/material/${list.id}/${patentDto.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/thesis/upload/${patentDto.id}" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="上传材料" id="upload">
                            </form>
                            <br>
                            <a href="/thesis/down/${patentDto.id}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
