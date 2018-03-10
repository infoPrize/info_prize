<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>论文详情页</title>
</head>
<body>
<hr>
<h1>这是论文中id为${thesisDto.id}的详情页</h1>
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
       <td><a href="/thesis/delete/material/${list.id}/${thesisDto.id}">删除</a></td>
       <br>
   </tr>
</c:forEach>

<hr>


<form action="/thesis/upload/${thesisDto.id}" enctype="multipart/form-data" method="post">
    <input type="file" name="file">
    <input type="submit" value="上传材料">
</form>

${message}



</body>
</html>
