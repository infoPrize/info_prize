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
                                    <td >D类</td>
                                    <th class="text-center">发表刊物</th>
                                    <td >英语考试</td>
                                    <th class="text-center">论文题目</th>
                                    <td >CET62</td>
                                    <th class="text-center">发表时间</th>
                                    <td >2017-12-06</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >刘旺1</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第一作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">作者专业</th>
                                    <td>软件工程</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >刘旺2</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第二作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">作者专业</th>
                                    <td>软件工程</td>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >刘旺3</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第三作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">作者专业</th>
                                    <td>软件工程</td>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >刘旺4</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第四作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">作者专业</th>
                                    <td>软件工程</td>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">作者姓名</th>
                                    <td >刘旺5</td>
                                    <th class="text-center">作者排名</th>
                                    <td >第五作者</td>
                                    <th class="text-center">作者学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">作者专业</th>
                                    <td>软件工程</td>
                                </tr>
                                <!--第七行-->
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >李勍</td>
                                    <th class="text-center">论文摘要</th>
                                    <td colspan="5"><p class="detail_p">文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容
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
                                        <td><a href="/thesis/delete/material/${list.id}/${thesisDto.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <form action="/thesis/upload/${thesisDto.id}/${thesisDto.thesisTitle}" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="上传材料">
                            </form>
                            <br>
                            <a href="/thesis/down/${thesisDto.thesisTitle}" id="download">下载</a>
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
