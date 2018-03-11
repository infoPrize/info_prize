/*Created by liujing on 2018/3/10.*/
var website = "http://infoprize.nenu.edu.cn/";
//ajax分页开始
var ts = 5; //每页显示的条数
var page = 1; //当前页
$(document).ready(function(e) {
    //页面加载数据
    Load();
    //加载分页列表
    Loadlist();
    $("#ck").click(function() {
        //页面加载数据
        Load();
        //加载分页列表
        Loadlist();
    })
})

//加载数据的方法
function Load() {
    var gjz = $("#key").val();
    $.ajax({
        async: false,
        url: website + "scientificProject/listByConditions/1",
        data: {
            page: page,
            ts: ts,
            gjz: gjz
        }, //page是显示的页数；ts是显示的条数
        type: "get",
        dataType: "JSON",
        success: function(data) {
            console.log(data);
            var str = "";
            for(var k in data) {
                str += "<tr><td>" + data[k].username + "</td><td>" + data[k].age + "</td><td>" + data[k].sex + "</td><td>" + data[k].phone + "</td><td>" + data[k].address + "</td></tr>";
            }
            $("#list").html(str); //把拼接好的字符串放到要显示的thody里面
        }
    })
}
//加载分页列表
function Loadlist() {
    var str = "";
    //上一页
    str += "<li><a id='prev'>上一页</a></li>";
    //下一页
    str += "<li><a id='next'>下一页</a></li>";
    $("#fenye").html(str);

    $("#prev").click(function() {
        if(page > 1) {
            page--;
        }
        //页面加载数据
        Load();
        //加载分页列表
        Loadlist();
    })

    $(".item").click(function() {
        var p = $(this).text(); //取到的是字符串,转化为整数
        page = parseInt(p);
        //页面加载数据
        Load();
        //加载分页列表
        Loadlist();
    })

    $("#next").click(function() {
        if(page < zys()) {
            page++;
        }
        //页面加载数据
        Load();
        //加载分页列表
        Loadlist();
    })

}

//总页数
function zys() {
    var zys = 2;
    $.ajax({
        async:false,
        url:"",
        dataType:"TEXT",
        success:function(data){
            zys = Math.ceil(data/ts);
        }
    });
    return zys;
}