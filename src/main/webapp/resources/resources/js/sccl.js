
/*左侧菜单点击*/
$(".side-menu").on('click', 'li a', function(e) {
    var animationSpeed = 300;
    var $this = $(this);
    var checkElement = $this.next();

    if(checkElement.is('.menu-item-child') && checkElement.is(':visible')) {
        checkElement.slideUp(animationSpeed, function() {
            checkElement.removeClass('menu-open');
        });
        checkElement.parent("li").removeClass("active");
    }
    //如果菜单是不可见的
    else if((checkElement.is('.menu-item-child')) && (!checkElement.is(':visible'))) {
        //获取上级菜单
        var parent = $this.parents('ul').first();
        //从父级开始找所有打开的菜单并关闭
        var ul = parent.find('ul:visible').slideUp(animationSpeed);
        //在父级中移出menu-open标记
        ul.removeClass('menu-open');
        //获取父级li
        var parent_li = $this.parent("li");
        //打开菜单时添加menu-open标记
        checkElement.slideDown(animationSpeed, function() {
            //添加样式active到父级li
            checkElement.addClass('menu-open');
            parent.find('li.active').removeClass('active');
            parent_li.addClass('active');
        });
    }
    //防止有链接跳转
    e.preventDefault();

    addIframe($this);
});

/*添加iframe*/
function addIframe(cur) {
    var $this = cur;
    var h = $this.attr("href"),
        m = $this.data("index"),
        label = $this.find("span").text(),
        isHas = false;
    if(h == "" || $.trim(h).length == 0) {
        return false;
    }

    var fullWidth = $(window).width();
    if(fullWidth >= 750) {
        $(".layout-side").show();
    } else {
        $(".layout-side").hide();
    }

    $(".content-tab").each(function() {
        if($(this).data("id") == h) {
            if(!$(this).hasClass("active")) {
                $(this).addClass("active").siblings(".content-tab").removeClass("active");
                addTab(this);
            }
            isHas = true;
        }
    });
    if(isHas) {
        $(".body-iframe").each(function() {
            if($(this).data("id") == h) {
                $(this).show().siblings(".body-iframe").hide();
            }
        });
    }
    if(!isHas) {
        var tab = "<a href='javascript:;' class='content-tab active' data-id='" + h + "'>" + label + " <i class='icon-font'>&#xe617;</i></a>";
        $(".content-tab").removeClass("active");
        $(".tab-nav-content").append(tab);
        var iframe = "<iframe class='body-iframe' name='iframe" + m + "' width='100%' height='99%' src='" + h + "' frameborder='0' data-id='" + h + "' seamless></iframe>";
        $(".layout-main-body").find("iframe.body-iframe").hide().parents(".layout-main-body").append(iframe);
        addTab($(".content-tab.active"));
    }
    return false;
}

/*添加tab*/
function addTab(cur) {
    var prev_all = tabWidth($(cur).prevAll()),
        next_all = tabWidth($(cur).nextAll());
    var other_width = tabWidth($(".layout-main-tab").children().not(".tab-nav"));
    var navWidth = $(".layout-main-tab").outerWidth(true) - other_width; //可视宽度
    var hidewidth = 0;
    if($(".tab-nav-content").width() < navWidth) {
        hidewidth = 0
    } else {
        if(next_all <= (navWidth - $(cur).outerWidth(true) - $(cur).next().outerWidth(true))) {
            if((navWidth - $(cur).next().outerWidth(true)) > next_all) {
                hidewidth = prev_all;
                var m = cur;
                while((hidewidth - $(m).outerWidth()) > ($(".tab-nav-content").outerWidth() - navWidth)) {
                    hidewidth -= $(m).prev().outerWidth();
                    m = $(m).prev()
                }
            }
        } else {
            if(prev_all > (navWidth - $(cur).outerWidth(true) - $(cur).prev().outerWidth(true))) {
                hidewidth = prev_all - $(cur).prev().outerWidth(true)
            }
        }
    }
    $(".tab-nav-content").animate({
            marginLeft: 0 - hidewidth + "px"
        },
        "fast")
}

/*获取宽度*/
function tabWidth(tabarr) {
    var allwidth = 0;
    $(tabarr).each(function() {
        allwidth += $(this).outerWidth(true)
    });
    return allwidth;
}

/*左按钮事件*/
$(".btn-left").on("click", leftBtnFun);
/*右按钮事件*/
$(".btn-right").on("click", rightBtnFun);
/*选项卡切换事件*/
$(".tab-nav-content").on("click", ".content-tab", navChange);
/*选项卡关闭事件*/
$(".tab-nav-content").on("click", ".content-tab i", closePage);
/*选项卡双击关闭事件*/
$(".tab-nav-content").on("dblclick", ".content-tab", closePage);

/*左按钮方法*/
function leftBtnFun() {
    var ml = Math.abs(parseInt($(".tab-nav-content").css("margin-left")));
    var other_width = tabWidth($(".layout-main-tab").children().not(".tab-nav"));
    var navWidth = $(".layout-main-tab").outerWidth(true) - other_width; //可视宽度
    var hidewidth = 0;
    if($(".tab-nav-content").width() < navWidth) {
        return false
    } else {
        var tabIndex = $(".content-tab:first");
        var n = 0;
        while((n + $(tabIndex).outerWidth(true)) <= ml) {
            n += $(tabIndex).outerWidth(true);
            tabIndex = $(tabIndex).next();
        }
        n = 0;
        if(tabWidth($(tabIndex).prevAll()) > navWidth) {
            while((n + $(tabIndex).outerWidth(true)) < (navWidth) && tabIndex.length > 0) {
                n += $(tabIndex).outerWidth(true);
                tabIndex = $(tabIndex).prev();
            }
            hidewidth = tabWidth($(tabIndex).prevAll());
        }
    }
    $(".tab-nav-content").animate({
            marginLeft: 0 - hidewidth + "px"
        },
        "fast");
}

/*右按钮方法*/
function rightBtnFun() {
    var ml = Math.abs(parseInt($(".tab-nav-content").css("margin-left")));
    var other_width = tabWidth($(".layout-main-tab").children().not(".tab-nav"));
    var navWidth = $(".layout-main-tab").outerWidth(true) - other_width; //可视宽度
    var hidewidth = 0;
    if($(".tab-nav-content").width() < navWidth) {
        return false
    } else {
        var tabIndex = $(".content-tab:first");
        var n = 0;
        while((n + $(tabIndex).outerWidth(true)) <= ml) {
            n += $(tabIndex).outerWidth(true);
            tabIndex = $(tabIndex).next();
        }
        n = 0;
        while((n + $(tabIndex).outerWidth(true)) < (navWidth) && tabIndex.length > 0) {
            n += $(tabIndex).outerWidth(true);
            tabIndex = $(tabIndex).next()
        }
        hidewidth = tabWidth($(tabIndex).prevAll());
        if(hidewidth > 0) {
            $(".tab-nav-content").animate({
                    marginLeft: 0 - hidewidth + "px"
                },
                "fast");
        }
    }
}
function load() {
    window.location.reload();
}
/*选项卡切换方法*/
function navChange() {
    if(!$(this).hasClass("active")) {
        var k = $(this).data("id");
        $(".body-iframe").each(function() {
            if($(this).data("id") == k) {
                $(this).show().siblings(".body-iframe").hide();
                return false
            }
        });
        $(this).addClass("active").siblings(".content-tab").removeClass("active");
        $(this).load();
        addTab(this);
    }
    $(".content-tab").click(function (e) {
        var dataid = $(e.target).attr("data-id");
        $(this).contentWindow.location.reload(true);
    })
}

/*选项卡关闭方法*/
function closePage() {
    var url = $(this).parents(".content-tab").data("id");
    var cur_width = $(this).parents(".content-tab").width();
    if($(this).parents(".content-tab").hasClass("active")) {
        if($(this).parents(".content-tab").next(".content-tab").size()) {
            var next_url = $(this).parents(".content-tab").next(".content-tab:eq(0)").data("id");
            $(this).parents(".content-tab").next(".content-tab:eq(0)").addClass("active");
            $(".body-iframe").each(function() {
                if($(this).data("id") == next_url) {
                    $(this).show().siblings(".body-iframe").hide();
                    return false
                }
            });
            var n = parseInt($(".tab-nav-content").css("margin-left"));
            if(n < 0) {
                $(".tab-nav-content").animate({
                        marginLeft: (n + cur_width) + "px"
                    },
                    "fast")
            }
            $(this).parents(".content-tab").remove();
            $(".body-iframe").each(function() {
                if($(this).data("id") == url) {
                    $(this).remove();
                    return false
                }
            })
        }
        if($(this).parents(".content-tab").prev(".content-tab").size()) {
            var prev_url = $(this).parents(".content-tab").prev(".content-tab:last").data("id");
            $(this).parents(".content-tab").prev(".content-tab:last").addClass("active");
            $(".body-iframe").each(function() {
                if($(this).data("id") == prev_url) {
                    $(this).show().siblings(".body-iframe").hide();
                    return false
                }
            });
            $(this).parents(".content-tab").remove();
            $(".body-iframe").each(function() {
                if($(this).data("id") == url) {
                    $(this).remove();
                    return false
                }
            })
        }
    } else {
        $(this).parents(".content-tab").remove();
        $(".body-iframe").each(function() {
            if($(this).data("id") == url) {
                $(this).remove();
                return false
            }
        });
        addTab($(".content-tab.active"))
    }
    return false
}

/*循环菜单*/
function initMenu(menu, parent) {
    for(var i = 0; i < menu.length; i++) {
        var item = menu[i];
        var str = "";
        try {
            if(item.isHeader == "1") {
                str = "<li class='menu-header'>" + item.name + "</li>";
                $(parent).append(str);
                if(item.childMenus != "") {
                    initMenu(item.childMenus, parent);
                }
            } else {
                item.icon == "" ? item.icon = "&#xe610" : item.icon = item.icon;
                if(item.childMenus == "") {
                    str = "<li><a href='" + item.url + "'><i class='icon-font'>" + item.icon + "</i><span>" + item.name + "</span></a></li>";
                    $(parent).append(str);
                } else {
                    str = "<li><a href='" + item.url + "'><i class='icon-font '>" + item.icon + "</i><span>" + item.name + "</span><i class='icon-font icon-right'>&#xe60b;</i></a>";
                    str += "<ul class='menu-item-child' id='menu-child-" + item.id + "'></ul></li>";
                    $(parent).append(str);
                    var childParent = $("#menu-child-" + item.id);
                    initMenu(item.childMenus, childParent);
                }
            }
        } catch(e) {}
        $("#menu-child-1").css("display", "block");
        $(".side-menu > li:first").addClass('active');
    }
}

/*头部下拉框移入移出*/
$(document).on("mouseenter", ".header-bar-nav", function() {
    $(this).addClass("open");
});
$(document).on("mouseleave", ".header-bar-nav", function() {
    $(this).removeClass("open");
});

/*左侧菜单展开和关闭按钮事件*/
$(document).on("click", ".layout-side-arrow", function() {
    if($(".layout-side").hasClass("close")) {
        $(".layout-side").removeClass("close");
        $(".layout-main").removeClass("full-page");
        $(".layout-footer").removeClass("full-page");
        $(this).removeClass("close");
        $(".layout-side-arrow-icon").removeClass("close");
    } else {
        $(".layout-side").addClass("close");
        $(".layout-main").addClass("full-page");
        $(".layout-footer").addClass("full-page");
        $(this).addClass("close");
        $(".layout-side-arrow-icon").addClass("close");
    }
});

/*头部菜单按钮点击事件*/
$(".header-menu-btn").click(function() {
    $(".layout-side").removeClass("close");
    $(".layout-main").removeClass("full-page");
    $(".layout-footer").removeClass("full-page");
    $(".layout-side-arrow").removeClass("close");
    $(".layout-side-arrow-icon").removeClass("close");

    $(".layout-side").slideToggle();
});

/*左侧菜单响应式*/
$(window).resize(function() {
    var width = $(this).width();
    if(width >= 750) {
        $(".layout-side").show();
    } else {
        $(".layout-side").hide();
    }
});

/*皮肤选择*/
$(".dropdown-skin li a").click(function() {
    var v = $(this).attr("data-val");
    var hrefStr = $("#layout-skin").attr("href");
    var hrefRes = hrefStr.substring(0, hrefStr.lastIndexOf('skin/')) + 'skin/' + v + '/skin.css';
    $(window.frames.document).contents().find("#layout-skin").attr("href", hrefRes);

    setCookie("scclui-skin", v);
});

/*获取cookie中的皮肤*/
function getSkinByCookie() {
    var v = getCookie("scclui-skin");
    var hrefStr = $("#layout-skin").attr("href");
    if(v == null || v == "") {
        v = "qingxin";
    }
    if(hrefStr != undefined) {
        var hrefRes = hrefStr.substring(0, hrefStr.lastIndexOf('skin/')) + 'skin/' + v + '/skin.css';
        $("#skin").attr("href", hrefRes);
    }
}

/*随机颜色*/
function getMathColor() {
    var arr = new Array();
    arr[0] = "#ffac13";
    arr[1] = "#83c44e";
    arr[2] = "#2196f3";
    arr[3] = "#e53935";
    arr[4] = "#00c0a5";
    arr[5] = "#16A085";
    arr[6] = "#ee3768";

    var le = $(".menu-item > a").length;
    for(var i = 0; i < le; i++) {
        var num = Math.round(Math.random() * 5 + 1);
        var color = arr[num - 1];
        $(".menu-item > a").eq(i).find("i:first").css("color", color);
    }
}

/*
  初始化加载
*/
$(function() {
	/*获取皮肤*/
	//getSkinByCookie();

	//站点配置
	var site = {

		//本地开发配置
		website:'http://infoprize.nenu.edu.cn/',
		staticWebsite:'http://infoprize.nenu.edu.cn/resources/'

		//服务器开发配置
		// website:'http://120.78.154.246/',
		// staticWebsite:'http://120.78.154.246/resources/'

        //服务器开发配置
        // website:'http://120.78.154.246/info_prize/',
        // staticWebsite:'http:120.78.154.246/info_prize/resources/'
	}

	/*菜单json*/
    var menu = [{
        "id": "1",
        "name": "普通功能",
        "parentId": "0",
        "url": "",
        "icon": "",
        "order": "1",
        "isHeader": "1",
        "childMenus": [{
            "id": "3",
            "name": "查询奖项",
            "parentId": "1",
            "url": "",
            "icon": "&#xe602;",
            "order": "1",
            "isHeader": "0",
            "childMenus": [{
                "id": "4",
                "name": "论文",
                "parentId": "3",
                "url": "",
                "icon": "&#xe602;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
                {
                    "id": "5",
                    "name": "专利",
                    "parentId": "3",
                    "url": site.website + "patent/toList",
                    "icon": "&#xea99;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "6",
                    "name": "国创科研",
                    "parentId": "3",
                    "url": site.website + "scientificProject/toList",
                    "icon": "&#xe91f;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "7",
                    "name": "ACM",
                    "parentId": "3",
                    "url": site.website + "acm/toList",
                    "icon": "&#xe906;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "8",
                    "name": "数学建模",
                    "parentId": "3",
                    "url": site.website + "mathModel/toList",
                    "icon": "&#xe964;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "9",
                    "name": "挑战杯",
                    "parentId": "3",
                    "url": site.website + "ChallengeCup/toList",
                    "icon": "&#xe91f;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "10",
                    "name": "互联网+",
                    "parentId": "3",
                    "url": site.website + "InternetPlus/toList",
                    "icon": "&#xe91f;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                },
                {
                    "id": "11",
                    "name": "其他比赛",
                    "parentId": "3",
                    "url": site.website + "otherMatch/toList",
                    "icon": "&#xe927;",
                    "order": "1",
                    "isHeader": "0",
                    "childMenus": ""
                }]
        }]
    },
    {
        "id": "2",
        "name": "管理员功能",
        "parentId": "0",
        "url": "",
        "icon": "",
        "order": "1",
        "isHeader": "1",
        "childMenus": [{
            "id": "12",
            "name": "奖项添加",
            "parentId": "2",
            "url": "",
            "icon": "&#xe602;",
            "order": "1",
            "isHeader": "0",
            "childMenus": [{
                "id": "13",
                "name": "论文添加",
                "parentId": "12",
                "url": site.website + "thesis/toAdd",
                "icon": "&#xe602;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "14",
                "name": "专利添加",
                "parentId": "12",
                "url": site.website + "patent/toAdd",
                "icon": "&#xea99;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "15",
                "name": "国创科研添加",
                "parentId": "12",
                "url": site.website + "scientificProject/toAdd",
                "icon": "&#xe91f;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "16",
                "name": "ACM添加",
                "parentId": "12",
                "url": site.website + "acm/toAdd",
                "icon": "&#xe906;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "17",
                "name": "数学建模添加",
                "parentId": "12",
                "url": site.website + "mathModel/toAdd",
                "icon": "&#xe964;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "18",
                "name": "挑战杯添加",
                "parentId": "12",
                "url": site.website + "ChallengeCup/toAdd",
                "icon": "&#xe91f;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "19",
                "name": "互联网+添加",
                "parentId": "12",
                "url": site.website + "InternetPlus/toAdd",
                "icon": "&#xe91f;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "20",
                "name": "其他比赛添加",
                "parentId": "12",
                "url": site.website + "otherMatch/toAdd",
                "icon": "&#xe927;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            }]
        },
        {
            "id": "21",
            "name": "人员管理",
            "parentId": "2",
            "url": "",
            "icon": "&#xe610",
            "order": "1",
            "isHeader": "0",
            "childMenus": [{
                "id": "22",
                "name": "添加教师",
                "parentId": "21",
                "url": site.website + "teacher/toTeacher",
                "icon": "&#xe914;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "23",
                "name": "添加学生",
                "parentId": "21",
                "url": site.website + "student/toAdd",
                "icon": "&#xe609;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            },
            {
                "id": "24",
                "name": "学生管理",
                "parentId": "21",
                "url": site.website + "student/toList",
                "icon": "&#xe90e;",
                "order": "1",
                "isHeader": "0",
                "childMenus": ""
            }]
        }]
    }];

    $("#login").click(function() {
        var username = $('#username').val();
        var password = $('#password').val();

        $.ajax({
            type: 'post',
            url: site.website + "login/checkLogin",
            dataType: "json",
            data: $("#loginForm").serialize(),          // 序列化表单值
            async: false,
            success: function (msg) {
                msg = parseInt(msg);
                console.log(msg);
                if (msg == 1) {
                    //管理员登录
                    window.location.href = site.website + "index";
                } else if (msg == 2) {
                    //普通信科学生登录
                    window.location.href = site.website + "index";
                } else if(msg == 3) {
                    alert("对不起，您不是信科学院的学生或管理员还未将您的信息导入，请及时联系系统管理员");
                    window.location.href = window.location.href;
                    window.location.reload();
                } else if (msg == -1) {
                    alert("用户名或密码错误");
                    window.location.href=window.location.href;
                    window.location.reload();
                }

            }, error: function () {
                alert("系统发生异常，请联系系统管理员");
            },
            traditional: true
        });
        return false;
    });

	initMenu(menu, $(".side-menu"));
	$(".side-menu > li").addClass("menu-item");
    $("#menu-child-3").css("display", "block");
    $(".menu-item").eq(1).addClass("active");

	/*获取菜单icon随机色*/
	//getMathColor();
});