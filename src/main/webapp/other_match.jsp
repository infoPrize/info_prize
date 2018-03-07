<%--
  Created by IntelliJ IDEA.
  User: Join
  Date: 2018/3/7
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>其他比赛</title>
</head>
<body>
    <h1>其他比赛添加</h1>
    <hr>
    <table>
        <tr>
            <td>比赛名称</td>
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
            <td>主办单位:</td>
            <td><input type="text" name="hostUnit"></td>
        </tr>
        <tr>
            <td>团队成员1姓名:</td>
            <td><input type="text" name="teammateName1"></td>
        </tr>
        <tr>
            <td>团队成员1学号:</td>
            <td><input type="text" name="teammateStuNumber1"></td>
        </tr>
        <tr>
            <td>团队成员2姓名:</td>
            <td><input type="text" name="teammateName2"></td>
        </tr>
        <tr>
            <td>团队成员2学号:</td>
            <td><input type="text" name="teammateStuNumber2"></td>
        </tr>
        <tr>
            <td>团队成员3姓名:</td>
            <td><input type="text" name="teammateName3"></td>
        </tr>
        <tr>
            <td>团队成员3学号:</td>
            <td><input type="text" name="teammateStuNumber3"></td>
        </tr>
        <tr>
            <td>团队成员4姓名:</td>
            <td><input type="text" name="teammateName4"></td>
        </tr>
        <tr>
            <td>团队成员4学号:</td>
            <td><input type="text" name="teammateStuNumber4"></td>
        </tr>
        <tr>
            <td>团队成员5姓名:</td>
            <td><input type="text" name="teammateName5"></td>
        </tr>
        <tr>
            <td>团队成员5学号:</td>
            <td><input type="text" name="teammateStuNumber5"></td>
        </tr>
        <tr>
            <td>团队成员6姓名:</td>
            <td><input type="text" name="teammateName6"></td>
        </tr>
        <tr>
            <td>团队成员6学号:</td>
            <td><input type="text" name="teammateStuNumber6"></td>
        </tr>
        <tr>
            <td>团队成员7姓名:</td>
            <td><input type="text" name="teammateName7"></td>
        </tr>
        <tr>
            <td>团队成员7学号:</td>
            <td><input type="text" name="teammateStuNumber7"></td>
        </tr>
        <tr>
            <td>团队成员8姓名:</td>
            <td><input type="text" name="teammateName8"></td>
        </tr>
        <tr>
            <td>团队成员8学号:</td>
            <td><input type="text" name="teammateStuNumber8"></td>
        </tr>
        <tr>
            <td>项目名:</td>
            <td><input type="text" name="projectName"></td>
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
            <td>获奖时间:</td>
            <td><input type="date" name="prizeTime"></td>
        </tr>
        <tr>
            <td>指导教师:</td>
            <td>
                <input type="text" name="teacherName">
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="提交"></td>
        </tr>
    </table>
</body>
</html>
