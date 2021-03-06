<#assign types = types>
<#assign iframePath = iframePath>
<#assign sourceTotal = sourceTotal>
<#--<#assign total = sourceInfo.total>-->
<div class="c_content">
    <div class="c_content_box">
        <div class="c_box_left">
            <div class="c_menu_nav">
                <ul>
                    <#list types as item >
                        <li class="c_menu_item_${item.id}" onclick="changeType('${item.id}')">${item.description}</li>
                    </#list>
                </ul>
<#--                <ul class="layui-nav" lay-filter="">-->
<#--                    <#list types as item >-->
<#--                        <#if item.isChoose == 1>-->
<#--                            <li class="layui-nav-item layui-this"><a onclick="changeType('${item.id}')">${item.description}</a></li>-->
<#--                        <#else>-->
<#--                            <li class="layui-nav-item"><a onclick="changeType('${item.id}')">${item.description}</a></li>-->
<#--                        </#if>-->
<#--                    </#list>-->
<#--                </ul>-->
            </div>
            <iframe id="iframe_page" class="iframe_content" src="${requestPrefix}/${iframePath}" width="100%"  frameborder="0" scrolling="no" onload="setIframeHeight(this)"></iframe>
<#--            <#if pageType == 'list'>-->
<#--            <div id="c_source" class="c_source">-->
<#--                <#include "source.list.ftl">-->
<#--            </div>-->
<#--            <#else>-->
<#--            <div class="c_detail">-->
<#--                <#include "source.detail.ftl">-->
<#--            </div>-->
<#--            </#if>-->
            <div id="pageId" style="text-align: center;"></div>
        </div>
        <div class="c_box_right">
            <div class="c_right_my">
                <div style="padding-top: 10px;text-align: center;">此站为分享学习资源网站</div>
                <hr>
                <div style="text-align: center;line-height: 40px;">
                    <button type="button" class="layui-btn layui-btn-sm" onclick="registerHandle('aaaa')">现在注册</button>
                    <div>已有账号？<a>登录</a></div>
                </div>
            </div>
        </div>
        <button id="test" style="position:fixed;right:0;bottom:0">回到顶部</button>
    </div>
</div>
<script src="../static/layui/layui.js"></script>
<script>
    (function () {
        <#--if("${pageType}" == "list"){-->
        <#--    getSourcePage(1, 15)-->
        <#--}-->
        $(".c_menu_item_1").addClass("menu_choose")
        <#--setTimeout(getPageInfo(1, 15, '${sourceTotal}'), 500)-->
    })()

    var pageIndex = 1
    var pageSize = 15

    function setIframeHeight(iframe) {
        if (iframe) {
            if('${sourceTotal}' - pageIndex * pageSize >= 0){
                iframe.height = 185 * 15
            }else{
                console.log(pageSize - ('${sourceTotal}' - (pageIndex * pageSize))*-1)
                iframe.height = 185 * (pageSize - ('${sourceTotal}' - (pageIndex * pageSize))*-1)
            }
            // var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
            // if (iframeWin.document.body) {
            //     iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
            // }
        }
    };

    window.onload = function () {
        setIframeHeight(document.getElementById('iframe_page'));
        getPageInfo(pageIndex, pageSize, '${sourceTotal}')
    };

    function getPageInfo(pageIndex, pageSize, total) {
        const _this = this
        console.log(_this.pageSize)
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
                        _this.pageIndex = obj.curr
                        _this.pageSize = obj.limit
                        $("#iframe_page").attr('src',"${requestPrefix}/list?pageIndex="
                            + obj.curr + "&pageSize=" + obj.limit);
                        document.body.scrollTop = document.documentElement.scrollTop = 0;
                        setIframeHeight(document.getElementById('iframe_page'));
                        // getSourcePage(obj.curr, obj.limit)
                        // document.body.scrollTop = document.documentElement.scrollTop = 0;
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
                            if(list[i].description.length > 200){
                                list[i].description = list[i].description.substr(0, 200) + "..."
                            }
                            var content = '<div class="c_list_item">' +
                                '<div class="c_item_img">' +
                                '<img src=' + list[i].cover + '>' +
                                '</div>' +
                                '<div class="c_item_info">' +
                                '<div>' +
                                '<div class="c_item_title">' + list[i].title  + '</div>' +
                                '<div class="c_item_desc">' + list[i].description +
                                '</div>' +
                                '</div>' +
                                '<div class="c_item_info_bottom">' +
                                '<div class="c_item_info_date">' +
                                '2020-04-08' + '&nbsp;&nbsp;&nbsp;浏览量：'+ list[i].scanCount + '</div>' +
                                '<div class="c_item_scan_desc">' +
                                '<button type="button" onclick="sourceDetail('+ '\'' + list[i].id + '\'' +')" class="layui-btn layui-btn-sm">阅读全文</button>' +
                                '</div>' +
                                '</div>' +
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
                if(!data){
                    error("请求出现异常，请稍后再试！");
                }else{
                    error(data.msg);
                }
            }
        });
    }

    function registerHandle(id) {
        alert(id)
    }

    function changeType(typeId){
        $(".menu_choose").removeClass("menu_choose")
        $(".c_menu_item_" + typeId).addClass("menu_choose")
        <#--window.location.href = '${requestPrefix}/' + typeId + '/sources'-->
    }

    function sourceDetail(sourceId) {
        window.open('${requestPrefix}/' + sourceId + '/source-detail')
    }

    test.onclick = function(){
        document.body.scrollTop = document.documentElement.scrollTop = 0;
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
<style lang="scss">
.c_content {
    background-color: #ededed;
}
.iframe_content {
    background-color: #fff;
}
ul li {
    color: #555566;
    border: 1px solid #ddd;
    padding: 8px;
    margin-left: 6px;
    font-size: 13px;
}
ul li:hover {
    cursor: pointer;
    background-color: #393D49;
    color: #fff;
    border: 1px solid #393D49;
}
.menu_choose {
    background-color: #393D49;
    color: #fff;
    border: 1px solid #393D49;
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
    background-color: #fff;
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
.c_detail {
    width: 100%;
    background-color: #fff;
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
.c_item_img {
    width: 150px;
    height: 150px;
}
.c_item_img img {
    width: 150px;
    height: 150px;
}
.c_item_info {
    width: 600px;
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
    padding-top: 6px;
}
.c_item_info_bottom {
    font-size: 14px;
    color: #555555;
    display: flex;
    justify-content: space-between;
}
.c_item_scan_desc {
    color: #555555;
}
.c_item_info_date {
    padding-top: 6px;
    font-size: 12px;
}
</style>