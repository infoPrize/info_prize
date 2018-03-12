<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <form class="condition_form form-inline" action="${website}teacher/add" method="post" enctype="multipart/form-data" name="f1">
                                <!--第一行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="name">教师姓名：</label>
                                        <input type="text" id="name" class="form-control" name="teacherName"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="profession">职称：</label>
                                        <select id="profession" class="form-control" name="teacherLevel">
                                            <option value="-1">---请选择教师职称---</option>
                                            <option value="1">助教</option>
                                            <option value="2">讲师</option>
                                            <option value="3">副教授</option>
                                            <option value="4">教授</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="phone">联系方式：</label>
                                        <input type="text" id="phone" class="form-control" name="phone"/>
                                    </div>
                                </div>
                                <!--第二行-->
                                <input type="submit" value="添加" id="sort">
                            </form>

                        </div>
                        <div class="x_title title2">
                            <h3>教师信息</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <table id="datatable" class="table table-striped table-bordered text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">教师姓名</th>
                                    <th class="text-center">职称</th>
                                    <th class="text-center">联系方式</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${teacherDtoList}" var="teacher">
                                    <tr>
                                        <td >${teacher.teacherName}</td>
                                        <td >${teacher.teacherLevel}</td>
                                        <td >${teacher.phone}</td>
                                        <td class="aparent">
                                            <a href="" data-toggle="modal" data-target="#delete">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
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

