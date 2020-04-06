<#assign types = types>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8"/>
    <title>简易群发工具</title>
    <#include "header.ftl"/>
</head>
<body>
<div class="c_content">
    <div class="c_content_box">
        <div class="c_box_left">
            <div class="c_menu_nav">
                <ul class="layui-nav" lay-filter="">
                    <#list types as item >
                        <#if item.isChoose == 1>
                            <li class="layui-nav-item layui-this"><a href="#">${item.description}</a></li>
                        <#else>
                            <li class="layui-nav-item"><a href="#">${item.description}</a></li>
                        </#if>
                    </#list>
                </ul>
            </div>
            <div id="c_source" class="c_source">
<#--                <#include "source.list.ftl">-->
            </div>
            <div id="pageId" style="text-align: center;"></div>
        </div>
        <div class="c_box_right">
            <div class="c_right_my">
                <div style="padding-top: 10px;text-align: center;">此站为分享学习资源网站</div>
                <hr>
                <div style="text-align: center;line-height: 40px;">
                    <button type="button" class="layui-btn layui-btn-sm">现在注册</button>
                    <div>已有账号？<a>登录</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="../static/layui/layui.js"></script>
<script>
    (function () {
        getSourcePage(1, 15)
    })()

    function getPageInfo(pageIndex, pageSize, total) {
        layui.use(['laypage'], function(){
            var laypage = layui.laypage;

            //总页数大于页码总数
            laypage.render({
                elem: 'pageId',
                limit: pageSize,
                curr : pageIndex||1,
                count: total,
                jump: function(obj, first) {
                    if(!first){
                        getSourcePage(obj.curr, obj.limit)
                    }
                }
            });})
    }


    function getSourcePage(pageIndex, pageSize) {
        $.ajax({
            url: "${requestPrefix}" + "/source/simpleSourcePage",
            type:"Get",
            data: {pageIndex: pageIndex, pageSize: pageSize},
            contentType: "application/json;charset=utf-8",
            dataType:"json",
            success: async function(data){
                console.log(data);
                if(data){
                    let list = data.data.records
                    if(list.length > 0){
                        let html = ''
                        for(let i in list){
                            var content = '<div class="c_list_item">\n' +
                                '<div class="c_item_img">' +
                                '<img src=' + list[i].cover + '>' +
                                '</div>' +
                                '<div class="c_item_info">' +
                                '<div>' +
                                '<div class="c_item_title">' + list[i].title + '</div>' +
                                '<div class="c_item_desc">' + list[i].description + '</div>' +
                                '</div>' +
                                '<div class="c_item_scan_desc">浏览量：' + list[i].scanCount + '</div>' +
                                '</div>' +
                                '</div>'
                            html = html + content
                        }
                        $("#c_source").html(html)
                    }
                    getPageInfo(pageIndex, pageSize, data.data.total)
                }
            },
            error:function(data){
                error(data.msg);
            }
        });
    }
    function error(msg){
        layui.use(["layer"], function () {
            let layer = layui.layer;
            layer.open({
                type: 0,
                title:"错误",
                btn: ["确定"],
                content: msg
            })
        })
    }
</script>
<style>
.c_content {
    background-color: #ededed;
}
.c_content_box {
    max-width: 1060px;
    min-width: 1060px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
}
.c_box_left {
    width: 800px;
    padding-top: 20px;
}
.c_box_right {
    padding-top: 20px;
}
.c_right_my {
    width: 230px;
    height: 150px;
    background-color: #fff;
}
.c_menu_nav {
}
div a {
    color: #555555
}
a:hover {
    color: #bbb;
    cursor: pointer;
}
.c_source {
    background-color: #fff;
}
.layui-nav {
    background-color: #fff;
    padding: 10px;
}
.layui-nav .layui-nav-item a {
    padding: 0 10px;
    color: #555555;
}
.layui-nav .layui-nav-item a:hover, .layui-nav .layui-this a {
    color: #fff;
    padding: 0 10px;
    background-color: #555555;
}
.layui-nav .layui-nav-item {
    line-height: 34px;
}
.layui-nav .layui-this:after, .layui-nav-bar, .layui-nav-tree .layui-nav-itemed:after {
    background-color: #555555;
    height: 0px;
}
.layui-btn {
    background-color: #D0021B;
}
.c_list_item {
    width: 780px;
    height: 160px;
    margin: 0px auto;
    padding: 12px 0 12px 0;
    border-top: 1px solid #ededed;
    display: flex;
    justify-content: flex-start;
}
.c_list_item:hover {
    background-color: #eeeeee;
    opacity: 0.5;
}
.c_item_img {
    width: 150px;
    height: 150px;
}
.c_item_img img {
    width: 150px;
    height: 150px;
}
.c_item_info {
    padding-left: 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    cursor: pointer;
}
.c_item_title {
    font-size: 16px;
    font-weight: 600;
}
.c_item_desc {
    font-size: 14px;
    color: #555555;
}
.c_item_scan_desc {
    text-align: right;
    color: #555555;
    font-size: 12px;
}
.page_area {
    text-align: center;
}
</style>