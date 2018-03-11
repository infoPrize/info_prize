<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>信息录入</title>
    <link rel="stylesheet" href="${staticWebsite}resources/css/base.css">
    <link rel="stylesheet" href="${staticWebsite}resources/css/bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h3>论文信息录入</h3>
                        <hr/>
                    </div>
                    <div class="x_content">
                        <div class="tab-pane active" id="tab-article">
                            <div class="row feature">
                                <form class="condition_form form-inline" action="${website}thesis/add" method="post">
                                    <!--第一行-->
                                    <div class="tab-row">
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="journal">刊物名称：</label>
                                            <input type="text" id="journal" class="form-control" name="journalName" />
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="type">刊物等级：</label>
                                            <select class="form-control" id="journalLevel">
                                                <option value="-1">---请选择刊物等级---</option>
                                                <option value="1">E类</option>
                                                <option value="2">D类</option>
                                                <option value="3">C类</option>
                                                <option value="4">B类</option>
                                                <option value="5">A类</option>
                                                <option value="6">T类</option>
                                                <option value="7">未知</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right">论文题目：</label>
                                            <input type="text" id="thesisTitle" class="form-control" />
                                        </div>
                                    </div>
                                    <!--第二行-->
                                    <div class="tab-row" id="thesis">

                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right">作者姓名：</label>
                                            <input type="text" class="form-control" id="authorName1" />
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right">作者学号：</label>
                                            <input type="text" class="form-control" id="authorStuNumber1"/>
                                        </div>
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right">作者等级：</label>
                                            <select id="authorLevel1" class="form-control">
                                                <option value="-1">---请选择作者等级---</option>
                                                <option value="1">第一作者</option>
                                                <option value="2">第二作者</option>
                                                <option value="3">第三作者</option>
                                                <option value="4">第四作者</option>
                                                <option value="5">第五作者</option>
                                                <option value="6">第六作者</option>
                                                <option value="7">第七作者</option>
                                            </select>
                                        </div>
                                    </div>
                                    <!--第三行-->
                                    <div class="tab-row">
                                        <div class="form-group col-sm-4">
                                            <label class="tab-label control-label text-right" for="time">发表时间：</label>
                                            <input type="text" class="form-control" onClick="laydate()" id="publishTime"/>
                                        </div>
                                        <div class="form-group col-sm-8">
                                            <label class="tab-label control-label text-right">指导老师：</label>
                                            <input type="text" class="form-control" id="teacherName" />
                                        </div>


                                    </div>
                                    <!--第四行-->
                                    <div class="tab-row">
                                        <div class="col-sm-12">
                                            <label class="tab-label control-label text-right">论文摘要：</label>
                                            <textarea class="detailtext form-control" rows="3" id="thesisAbstract" style="width: 850px"></textarea>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <!--第五行-->
                                    <input type="button" value="提交" id="sort_thesis"/>
                                    <input type="button" value="添加作者" id="addthesis">
                                </form>
                                <form action="/import/thesis" enctype="multipart/form-data" method="post">
                                    <%--<input type="file" name="file">--%>
                                    <%--<input type="submit" value="导入excel">--%>
                                    <div class="tab-row">
                                        <input type="text" id="file_name" readonly="readonly" value="" class="form-control"/>
                                        <a href="javascript:void(0);" class="btn">
                                            浏览
                                            <input type="file" id="file" name="file">
                                        </a>
                                        <input type="submit" class="btn" value="导入excel"/>
                                    </div>

                                </form>
                                <h1>${message}</h1>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${staticWebsite}resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${staticWebsite}resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${staticWebsite}resources/js/competition.js"></script>
<script type="text/javascript" src="${staticWebsite}resources/laydate/laydate.js"></script>
<script type="text/javascript" src="${staticWebsite}resources/js/add.js"></script>
<script type="text/javascript" src="${staticWebsite}resources/js/addmember.js"></script>
<script type="text/javascript">
    $(function(){
        $("#file").change(function(){  // 当 id 为 file 的对象发生变化时
            var fileSize = this.files[0].size;
            var size = fileSize / 1024 / 1024;
            if (size > 5) {
                alert("附件不能大于5M,请将文件压缩后重新上传！");
                this.value="";
                return false;
            }else{
                $("#file_name").val($("#file").val());  //将 #file 的值赋给 #file_name
            }
        })
    });

</script>
</body>

</html>