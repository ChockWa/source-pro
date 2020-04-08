<#--<#assign sourceList = sourceInfo.records>-->
<#--<#assign total = sourceInfo.total>-->
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8"/>
    <title>简易群发工具</title>
    <#include "header.ftl"/>
</head>
<body>
<div id="c_list" class="c_list">
    <div class="c_list_item">
        <div class="c_item_img">
            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">
        </div>
        <div class="c_item_info">
            <div>
                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>
                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试
                    测测试测试测试测试测试测试
                </div>
            </div>
            <div class="c_item_info_bottom">
                <div class="c_item_info_date">2020-04-08</div>
                <div class="c_item_scan_desc">浏览量：20000&nbsp;
                    <button type="button" class="layui-btn layui-btn-sm">阅读全文</button>
                </div>
            </div>
        </div>
    </div>
<#--    <div class="c_list_item">-->
<#--        <div class="c_item_img">-->
<#--            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">-->
<#--        </div>-->
<#--        <div class="c_item_info">-->
<#--            <div>-->
<#--                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>-->
<#--                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测测试测试测试测试测试测试-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="c_item_scan_desc">浏览量：20000&nbsp;|&nbsp;评论：1000</div>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="c_list_item">-->
<#--        <div class="c_item_img">-->
<#--            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">-->
<#--        </div>-->
<#--        <div class="c_item_info">-->
<#--            <div>-->
<#--                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>-->
<#--                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测测试测试测试测试测试测试-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="c_item_scan_desc">浏览量：20000&nbsp;|&nbsp;评论：1000</div>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="c_list_item">-->
<#--        <div class="c_item_img">-->
<#--            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">-->
<#--        </div>-->
<#--        <div class="c_item_info">-->
<#--            <div>-->
<#--                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>-->
<#--                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测测试测试测试测试测试测试-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="c_item_scan_desc">浏览量：20000&nbsp;|&nbsp;评论：1000</div>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="c_list_item">-->
<#--        <div class="c_item_img">-->
<#--            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">-->
<#--        </div>-->
<#--        <div class="c_item_info">-->
<#--            <div>-->
<#--                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>-->
<#--                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测测试测试测试测试测试测试-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="c_item_scan_desc">浏览量：20000&nbsp;|&nbsp;评论：1000</div>-->
<#--        </div>-->
<#--    </div>-->
<#--    <div class="c_list_item">-->
<#--        <div class="c_item_img">-->
<#--            <img src="https://dss2.bdstatic.com/6Ot1bjeh1BF3odCf/it/u=82108016,1133623751&fm=74&app=80&f=JPEG&size=f121,121?sec=1880279984&t=3464b52fd8de009c06fa649947f88e2b">-->
<#--        </div>-->
<#--        <div class="c_item_info">-->
<#--            <div>-->
<#--                <div class="c_item_title">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试?</div>-->
<#--                <div class="c_item_desc">测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试-->
<#--                    测测试测试测试测试测试测试-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="c_item_scan_desc">浏览量：20000&nbsp;|&nbsp;评论：1000</div>-->
<#--        </div>-->
<#--    </div>-->
    <div id="pageId"></div>
</div>
</body>
</html>

<script src="../static/layui/layui.js"></script>
<script>
    // (function () {
    //     getSourcePage(1, 15)
    // })()

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
                                '<div class="c_item_info_date">' + '2020-04-08' + '</div>' +
                            '<div class="c_item_scan_desc">浏览量：' + list[i].scanCount + '&nbsp;' +
                                '<button type="button" class="layui-btn layui-btn-sm">阅读全文</button>' +
                                '</div>' +
                                '</div>' +
                                '</div>' +
                                '</div>'
                            html = html + content
                        }
                        $("#c_list").html(html)
                    }
                    getPageInfo(1, 15, data.data.total)
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
    .c_list {
        margin-bottom: 30px;
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
        font-size: 12px;
    }
    .c_item_info_date {
        padding-top: 6px;
    }
</style>