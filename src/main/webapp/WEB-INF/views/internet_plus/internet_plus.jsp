<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>根据条件筛选互联网+比赛信息</h1>
    <hr>
    <form action="${website}InternetPlus/listByCondition/1" method="post">
        <table>
            <tr>
                <td>比赛名:</td>
                <td><input type="text" name="matchName"></td>
            </tr>
            <tr>
                <td>比赛等级:</td>
                <td>
                    <select name="matchLevel">
                        <option value="-1">---请选择---</option>
                        <option value="1">校级</option>
                        <option value="2">市级</option>
                        <option value="3">省级</option>
                        <option value="4">多省级</option>
                        <option value="5">国家级</option>
                        <option value="6">亚洲级</option>
                        <option value="7">国际级</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>获奖等级:</td>
                <td>
                    <select name="prizeLevel">
                        <option value="-1">---请选择---</option>
                        <option value="1">一等奖(金奖)</option>
                        <option value="2">二等奖(银奖)</option>
                        <option value="3">三等奖(铜奖)</option>
                        <option value="4">成功参赛奖(优胜奖)</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>起始时间:</td>
                <td><input type="date" name="startTime"></td>
            </tr>
            <tr>
                <td>结束时间:</td>
                <td><input type="date" name="endTime"></td>
            </tr>
            <tr>
                <td>队伍名:</td>
                <td><input type="text" name="teamName"></td>
            </tr>
            <tr>
                <td>学生姓名:</td>
                <td><input type="text" name="stuName"></td>
            </tr>
            <tr>
                <td>学生专业:</td>
                <td>
                    <select id="profession" class="form-control" name="majorCode">
                        <option value="-1">---请选择学生专业---</option>
                        <option value="1">软件工程</option>
                        <option value="2">计算机科学与技术</option>
                        <option value="3">计算机科学与技术(中美合作)</option>
                        <option value="4">教育技术</option>
                        <option value="5">图书情报与档案管理</option>
                        <option value="51">图书馆学</option>
                        <option value="52">信息资源管理</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>项目名:</td>
                <td><input type="text" name="projectName"></td>
            </tr>
            <tr>
                <td>主办单位:</td>
                <td><input type="text" name="hostUnit"></td>
            </tr>
            <tr>
                <td>指导教师:</td>
                <td><input type="text" name="teacherName"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="提交"></td>
            </tr>
        </table>

    </form>

    <form action="/import/internetPlus" enctype="multipart/form-data" method="post">
        <input type="file" name="file">
        <input type="submit" value="导入excel">
    </form>
    <h1>${message}</h1>

    <table width="3000" border="1">
        <tr>
            <td>比赛级别</td>
            <td>比赛名称</td>
            <td>项目名</td>
            <td>队伍名</td>
            <td>成员1姓名</td>
            <td>成员1学号</td>
            <td>成员2姓名</td>
            <td>成员2学号</td>
            <td>成员3姓名</td>
            <td>成员3学号</td>
            <td>成员4姓名</td>
            <td>成员4学号</td>
            <td>成员5姓名</td>
            <td>成员5学号</td>
            <td>成员6姓名</td>
            <td>成员6学号</td>
            <td>成员7姓名</td>
            <td>成员7学号</td>
            <td>成员8姓名</td>
            <td>成员8学号</td>
            <td>获奖等级</td>
            <td>获奖时间</td>
            <td>主办单位</td>
            <td>指导教师</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${internetPlusDtoList}" var="internetPlusDto">
            <tr>
                <td>${internetPlusDto.matchLevel}</td>
                <td>${internetPlusDto.matchName}</td>
                <td>${internetPlusDto.projectName}</td>
                <td>${internetPlusDto.teamName}</td>
                <td>${internetPlusDto.stuName1}</td>
                <td>${internetPlusDto.stuNumber1}</td>
                <td>${internetPlusDto.stuName2}</td>
                <td>${internetPlusDto.stuNumber2}</td>
                <td>${internetPlusDto.stuName3}</td>
                <td>${internetPlusDto.stuNumber3}</td>
                <td>${internetPlusDto.stuName4}</td>
                <td>${internetPlusDto.stuNumber4}</td>
                <td>${internetPlusDto.stuName5}</td>
                <td>${internetPlusDto.stuNumber5}</td>
                <td>${internetPlusDto.stuName6}</td>
                <td>${internetPlusDto.stuNumber6}</td>
                <td>${internetPlusDto.stuName7}</td>
                <td>${internetPlusDto.stuNumber7}</td>
                <td>${internetPlusDto.stuName8}</td>
                <td>${internetPlusDto.stuNumber8}</td>
                <td>${internetPlusDto.prizeLevel}</td>
                <td>${internetPlusDto.prizeTimeStr}</td>
                <td>${internetPlusDto.hostUnit}</td>
                <td>${internetPlusDto.teacherName}</td>
                <td>
                    <a href="${website}InternetPlus/falseDeleteById/${internetPlusDto.id}">删除</a><br>
                    <a href="${website}InternetPlus/toDetail/${internetPlusDto.id}">去往详情页</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <li>
        共${totalPage}页
    </li>
    <li>
        第${curPage}页
    </li>
    <li>
        <a href="${website}InternetPlus/toPrevious">上一页</a>
    </li>
    <li>
        <a href="${website}InternetPlus/toNext">下一页</a>
    </li>
</body>
</html>
