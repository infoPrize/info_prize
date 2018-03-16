<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>出错页</title>
</head>
<body>
<div class="content">
    <div class="page-content">
        <div class="tool-content">
            <p class="tool-tip no-permisition"><span>500</span>抱歉，页面出错！</p>
        </div>
        <div class="tool-content">
            <p class="tool-tip no-permisition">
                ${message}
            </p>
        </div>
    </div>
</div>
</body>
</html>
