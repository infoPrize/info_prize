/**
 * Created by Administrator on 2018/3/8.
 */
$(document).ready(function(){
    /*论文*/
    $("#addthesis").click(function(){
        var $the=$('<div class="form-group col-sm-4">'+
                        ' <label class="tab-label control-label text-right">作者姓名：</label>'+
                         '<input type="text" class="form-control" id="authorName1" />'+
                 ' </div>'+
                  ' <div class="form-group col-sm-4">'+
                         '<label class="tab-label control-label text-right">作者学号：</label>'+
                         '<input type="text" class="form-control" id="authorStuNumber1"/>'+
                ' </div>'+
               ' <div class="form-group col-sm-4">'+
                         '<label class="tab-label control-label text-right">作者等级：</label>'+
                             '<select id="authorLevel1" class="form-control">'+
                                    ' <option value="-1">---请选择作者等级---</option>'+
                                   ' <option value="1">第一作者</option>'+
                                   ' <option value="2">第二作者</option>'+
                                   ' <option value="3">第三作者</option>'+
                                   ' <option value="4">第四作者</option>'+
                                    '<option value="5">第五作者</option>'+
                                   ' <option value="6">第六作者</option>'+
                                   ' <option value="7">第七作者</option>'+
                            '</select>'+
                 '</div>');
        $("#thesis").append($the);
    })

    /*专利*/
    $("#addpatent").click(function(){
        var $pat=$('<div class="form-group col-sm-4">'+
                         '<label class="tab-label control-label text-right" for="author_name_2">申请人姓名</label>'+
                         '<input type="text" class="form-control" id="author_name_2" name="applierName1" />'+
                ' </div>'+
                '<div class="form-group col-sm-4">'+
                        '<label class="tab-label control-label text-right" for="author_stu_number2">申请人学号</label>'+
                      '<input type="text" class="form-control" id="author_stu_number2" name="applierStuNumber1" />'+
                  '</div>');
        $("#patent").append($pat);
    })

    /*国创科研*/
    $("#addscientific_project").click(function(){
        var $sci=$('<div class="form-group col-sm-4">'+
                         '<label class="tab-label control-label text-right">组员1姓名：</label>'+
                         ' <input type="text" id="projectMemberName1" class="form-control" />'+
                ' </div>'+
                '<div class="form-group col-sm-4">'+
                         '<label class="tab-label control-label text-right">组员1学号：</label>'+
                         '<input type="text" id="projectMemberStuNumber1" class="form-control" />'+
                 ' </div>');
        $("#scientific_project").append($sci);
    })
})