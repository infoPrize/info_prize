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
                                    <td >国家级</td>
                                    <th class="text-center">比赛名称</th>
                                    <td >ACM东北赛</td>
                                    <th class="text-center">主办单位</th>
                                    <td >吉林省教育厅</td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <th class="text-center">获奖时间</th>
                                    <td >2017-12-03</td>
                                    <th class="text-center">获奖等级	</th>
                                    <td >一等奖(金奖)	</td>
                                    <th class="text-center">团队名称</th>
                                    <td >嘿嘿</td>
                                </tr>
                                <!--第三行-->
                                <tr>
                                    <th class="text-center">参赛成员1</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员1学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">成员1专业</th>
                                    <td >软件工程</td>
                                </tr>
                                <!--第四行-->
                                <tr>
                                    <th class="text-center">参赛成员2</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员2学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">成员2专业</th>
                                    <td >软件工程</td>
                                </tr>
                                <!--第五行-->
                                <tr>
                                    <th class="text-center">参赛成员3</th>
                                    <td >刘旺</td>
                                    <th class="text-center">成员3学号</th>
                                    <td >2015011969</td>
                                    <th class="text-center">成员3专业</th>
                                    <td >软件工程</td>
                                </tr>
                                <!--第六行-->
                                <tr>
                                    <th class="text-center">指导老师</th>
                                    <td >李勍</td>
                                    <th class="text-center">比赛内容</th>
                                    <td colspan="3"><p class="detail_p">文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容文章内容
                                        文章内容文章内容文章内容文章内容文章内容
                                    </p></td>
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
                                        <td><a href="/acm/delete/material/${list.id}/${acmPrizeDto.id}">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <form action="/acm/upload/${acmPrizeDto.id}/${acmPrizeDto.id}" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="上传材料" id="upload">
                            </form>
                            <br>
                            <a href="/acm/down/${acmPrizeDto.teamName}" id="download">下载</a>
                            ${message}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
