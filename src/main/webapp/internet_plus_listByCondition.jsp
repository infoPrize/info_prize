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
    <h1>根据条件筛选互联网+比赛信息</h1>
    <hr>
    <form action="${website}InternetPlus/listByCondition" method="post">
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
</body>
</html>
