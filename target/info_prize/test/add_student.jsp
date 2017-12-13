<%--
  Created by IntelliJ IDEA.
  User: Join
  Date: 2017/11/7
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>增加学生</h1>
<hr>
<%--<form action="/import/student" method="post">--%>
<%--name : <input type="text" name="name"><br>--%>
<%--sex  :--%>
    <%--<select name="sex">--%>
        <%--<option value="-1">请选择</option>--%>
        <%--<option value="0">男</option>--%>
        <%--<option value="1">女</option>--%>
    <%--</select><br>--%>
<%--stu_num : <input type="text" name="stuNumber"> <br>--%>
<%--grade : <input type="text" name="grade"> <br>--%>
<%--major :--%>
    <%--<select name="majorCode">--%>
        <%--<option value="-1">请选择</option>--%>
        <%--<option value="1">软件工程</option>--%>
        <%--<option value="2">计算机科学与技术</option>--%>
        <%--<option value="3">计算机科学与技术(中美合作)</option>--%>
        <%--<option value="4">教育技术学</option>--%>
        <%--<option value="5">图书情报与档案管理</option>--%>
        <%--<option value="51">图书馆学</option>--%>
        <%--<option value="52">信息资源管理</option>--%>
    <%--</select><br>--%>
<%--phone : <input type="text" name="phone"> <br>--%>
    <%--<input type="submit" value="submit">--%>
<%--</form><br>--%>

文件上传：
<form action="${website}/import/student" method="post" enctype="multipart/form-data">
    请选择文件:<input type="file" name="file"><br/>
    <input type="submit" value="提交">
</form>


</body>
</html>
