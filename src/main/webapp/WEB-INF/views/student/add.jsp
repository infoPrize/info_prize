
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学生</title>
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
                            <h3>添加学生</h3>
                            <hr/>
                        </div>
                        <div class="x_content">
                            <form class="condition_form form-inline" action="${website}/student/add" method="post"  name="f1">
                                <!--第一行-->
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="number">学号：</label>
                                        <input type="text" id="number" class="form-control" name="stuNumber"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="name">姓名：</label>
                                        <input type="text" id="name" class="form-control" name="name"/>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="sex">性别：</label>
                                        <select id="sex" class="form-control" name="sex">
                                            <option value="0">---请选择性别---</option>
                                            <option value="1">男</option>
                                            <option value="2">女</option>
                                        </select>
                                    </div>

                                </div>
                                <!--第二行-->
                                <div class="form-group col-sm-4">
                                    <label class="tab-label control-label text-right" for="grade">年级：</label>
                                    <input type="text" id="grade" class="form-control" name="grade"/>
                                </div>
                                <div class="tab-row">
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="profession">专业：</label>
                                        <select id="profession" class="form-control" name="majorCode">
                                            <option value="0">---请选择专业---</option>
                                            <option value="1">软件工程</option>
                                            <option value="2">计算机科学与技术</option>
                                            <option value="3">计算机科学与技术（中美合作）</option>
                                            <option value="4">教育技术学</option>
                                            <option value="41">教育技术学（公费师范）</option>
                                            <option value="5">图书情报与档案管理类</option>
                                            <option value="51">图书馆学</option>
                                            <option value="52">信息资源管理</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-sm-4">
                                        <label class="tab-label control-label text-right" for="phone" >电话号码：</label>
                                        <input type="text" id="phone" class="form-control" name="phone"/>
                                    </div>

                                </div>
                                <input type="submit" value="提交">
                            </form>
                            <form action="${website}/import/student" enctype="multipart/form-data" method="post">
                                <input type="file" name="file">
                                <input type="submit" value="导入excel">
                            </form>

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
