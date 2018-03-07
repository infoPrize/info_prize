<%--
  Created by IntelliJ IDEA.
  User: Join
  Date: 2018/3/7
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>根据条件筛选其他比赛信息</h1>
    <hr>
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
            <td>
                <input type="submit" value="提交">
            </td>
        </tr>
    </table>

    <table width="3000" border="1">
        <tr>
            <td>比赛名</td>
            <td>比赛等级</td>
            <td>主办单位</td>
            <td>获奖人员1姓名</td>
            <td>获奖人员1学号</td>
            <td>获奖人员2姓名</td>
            <td>获奖人员2学号</td>
            <td>获奖人员3姓名</td>
            <td>获奖人员3学号</td>
            <td>获奖人员4姓名</td>
            <td>获奖人员4学号</td>
            <td>获奖人员5姓名</td>
            <td>获奖人员5学号</td>
            <td>获奖人员6姓名</td>
            <td>获奖人员6学号</td>
            <td>获奖人员7姓名</td>
            <td>获奖人员7学号</td>
            <td>获奖人员8姓名</td>
            <td>获奖人员8学号</td>
            <td>项目名</td>
            <td>获奖时间</td>
            <td>获奖等级</td>
            <td>指导教师</td>
        </tr>
        <tr>
            <td>第九届蓝桥杯大赛</td>
            <td>省级</td>
            <td>吉林省教育厅</td>
            <td>刘旺</td>
            <td>2015011969</td>
            <td>刘晶</td>
            <td>2015011959</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>基于嵌入式的图形引擎开发</td>
            <td>2016-01-04</td>
            <td>一等奖(金奖)</td>
            <td>李勍</td>
        </tr>
        <tr>
            <td>第九届蓝桥杯大赛</td>
            <td>省级</td>
            <td>吉林省教育厅</td>
            <td>刘旺</td>
            <td>2015011969</td>
            <td>刘晶</td>
            <td>2015011959</td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>基于嵌入式的图形引擎开发</td>
            <td>2016-01-04</td>
            <td>一等奖(金奖)</td>
            <td>李勍</td>
        </tr>
    </table>
</body>
</html>
