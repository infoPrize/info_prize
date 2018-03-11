<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Join
  Date: 2018/3/8
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ACM详情页</title>
</head>
<body>

    <h1>这是ACM获奖信息中id为${acmPrizeDto.id}的详情页</h1>

    <hr>
    <br>

    <table>
        <tr>
            <th>图片名称</th>
            <th>图片预览</th>
            <th>操作</th>
        </tr>
    </table>
    <c:forEach items="${list}" var="list">
        <tr>
            <td>${list.materialName}</td>
            <td><img src="${website}${list.materialUrl}"> </td>
            <td><a href="/acm/delete/material/${list.id}/${acmPrizeDto.id}">删除</a></td>
            <br>
        </tr>
    </c:forEach>

    <hr>


    <form action="/acm/upload/${acmPrizeDto.id}/${acmPrizeDto.teamName}" enctype="multipart/form-data" method="post">
        <input type="file" name="file">
        <input type="submit" value="上传材料">
    </form>
    <a href="/acm/down/${acmPrizeDto.teamName}">下载</a>
    ${message}


</body>
</html>
