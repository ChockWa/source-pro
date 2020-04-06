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
                            <li class="layui-nav-item layui-this"><a href="">${item.description}</a></li>
                        <#else>
                            <li class="layui-nav-item"><a href="">${item.description}</a></li>
                        </#if>
                    </#list>
                </ul>
            </div>
            <div class="c_source">
                <#include "source.list.ftl">
            </div>
        </div>
        <div class="c_box_right">
            <div class="c_right_my">
                <div style="padding-top: 10px;text-align: center;">此站为分享学习资源网站</div>
                <hr>
                <div style="text-align: center;line-height: 40px;">
                    <button type="button" class="layui-btn layui-btn-sm">现在注册</button>
                    <div>已有账号？<a style="color: #555555;">登录</a></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="../static/layui/layui.js"></script>
<script>

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
a:hover {
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
</style>