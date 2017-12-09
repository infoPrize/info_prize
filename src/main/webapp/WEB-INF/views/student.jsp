
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/sccl.css">
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
                            <h3>信息录入</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <form class="condition_form form-inline" action="${website}/import/student" method="post" enctype="multipart/form-data" name="f1">
                                <!--第一行-->
                                <%--<div class="tab-row">--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="number">学生学号：</label>--%>
                                        <%--<input type="text" id="number" class="form-control"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="name">学生姓名：</label>--%>
                                        <%--<input type="text" id="name" class="form-control"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="profession">学生专业：</label>--%>
                                        <%--<select id="profession" class="form-control">--%>
                                            <%--<option>---请选择学生专业---</option>--%>
                                            <%--<option>计算机普班</option>--%>
                                            <%--<option>计算机（中美）</option>--%>
                                            <%--<option>图书情报</option>--%>
                                            <%--<option>教技</option>--%>
                                            <%--<option>软件工程</option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!--第二行-->--%>
                                <%--<div class="tab-row">--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="grade">学生年级：</label>--%>
                                        <%--<input type="text" id="grade" class="form-control"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="email">电子邮箱：</label>--%>
                                        <%--<input type="text" id="email" class="form-control"/>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group col-sm-4">--%>
                                        <%--<label class="tab-label control-label text-right" for="password">登录密码：</label>--%>
                                        <%--<input type="text" id="password" class="form-control"/>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!--第三行-->--%>
                                <%--<input type="button" value="查找" id="find"/>--%>
                                <%--<input type="button" value="添加" id="add"/>--%>
                                <%--<!--第四行-->--%>
                                <%--<input type="button" value="导入excel表" onclick="mc()" id="up"/>--%>
                                <%--<span name="predent" id="puf"></span>--%>
                                <%--<input type="file" name="uf" id="upload" style="display:none" onchange="mm()" />--%>
                                <input type="file" name="file">
                                <input type="submit" value="提交">
                            </form>

                        </div>
                        <div class="x_title title2">
                            <h3>学生信息</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">学号</th>
                                    <th class="text-center">姓名</th>
                                    <th class="text-center">专业</th>
                                    <th class="text-center">年级</th>
                                    <th class="text-center">电子邮箱</th>
                                    <th class="text-center">登录密码</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                <!--第一行-->
                                <tr>
                                    <td >2015015987</td>
                                    <td >张三</td>
                                    <td >软件工程</td>
                                    <td >2015级</td>
                                    <td >zs@nenu.edu.cn</td>
                                    <td >15764321043</td>
                                    <td class="aparent">
                                        <a href="" data-toggle="modal" data-target="#delete">删除</a>
                                    </td>
                                </tr>
                                <!--第二行-->
                                <tr>
                                    <td >2015015987</td>
                                    <td >张三</td>
                                    <td >软件工程</td>
                                    <td >2015级</td>
                                    <td >zs@nenu.edu.cn</td>
                                    <td >15764321043</td>
                                    <td class="aparent">
                                        <a href="" data-toggle="modal" data-target="#delete">删除</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pull-right">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js" ></script>
<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js" ></script>
<script>
    $=function(id){
        return document.getElementById(id);
    }
    function mc(){
        var i=$("upload");
        i.click();
    }
    function mm(){
        $("puf").innerHTML=(document.f1.uf.value);
    }
</script>
</body>
</html>

