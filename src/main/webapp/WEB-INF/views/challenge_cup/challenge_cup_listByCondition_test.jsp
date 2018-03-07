<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jarvenman
  Date: 2018/1/29
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>根据条件筛选挑戰杯比赛信息</h1>
    <hr>
    <form action="${website}ChallengeCup/listByCondition/1" method="get">
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
                <input type="button" value="选择" type="submit" onclick="form.action='${website}ChallengeCup/listByCondition/1';form.submit();"/>
                <input type="button" value="导出Excel" type="submit" onclick="form.action='/export/challengeCup';form.submit();"/>
            </tr>
        </table>

    </form>

    <form action="/import/challengeCup" enctype="multipart/form-data" method="post">
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
        <c:forEach items="${challengeCupDtoList}" var="challengeCupDto">
        <tr>
            <td>${challengeCupDto.matchLevel}</td>
            <td>${challengeCupDto.matchName}</td>
            <td>${challengeCupDto.projectName}</td>
            <td>${challengeCupDto.teamName}</td>
            <td>${challengeCupDto.stuName1}</td>
            <td>${challengeCupDto.stuNumber1}</td>
            <td>${challengeCupDto.stuName2}</td>
            <td>${challengeCupDto.stuNumber2}</td>
            <td>${challengeCupDto.stuName3}</td>
            <td>${challengeCupDto.stuNumber3}</td>
            <td>${challengeCupDto.stuName4}</td>
            <td>${challengeCupDto.stuNumber4}</td>
            <td>${challengeCupDto.stuName5}</td>
            <td>${challengeCupDto.stuNumber5}</td>
            <td>${challengeCupDto.stuName6}</td>
            <td>${challengeCupDto.stuNumber6}</td>
            <td>${challengeCupDto.stuName7}</td>
            <td>${challengeCupDto.stuNumber7}</td>
            <td>${challengeCupDto.stuName8}</td>
            <td>${challengeCupDto.stuNumber8}</td>
            <td>${challengeCupDto.prizeLevel}</td>
            <td>${challengeCupDto.prizeTimeStr}</td>
            <td>${challengeCupDto.hostUnit}</td>
            <td>${challengeCupDto.teacherName}</td>
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
        <a href="${website}ChallengeCup/toPrevious">上一页</a>
    </li>
    <li>
        <a href="${website}ChallengeCup/toNext">下一页</a>
    </li>
</body>
</html>
