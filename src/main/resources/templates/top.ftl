<div class="c_top">
    <div class="c_logo_top">
        <div>
            此处省略标题
        </div>
        <div>
            <ul>
                <li><a>首页</a></li>
                <li><a>注册</a></li>
                <li><a>登录</a></li>
            </ul>
        </div>
    </div>
</div>

<script>
    <#--function getTypes() {-->
    <#--    loading()-->
    <#--    $.ajax({-->
    <#--        url: "${requestPrefix}" + "/type/list",-->
    <#--        type:"Get",-->
    <#--        contentType: "application/json;charset=utf-8",-->
    <#--        dataType:"json",-->
    <#--        success: async function(data){-->
    <#--            if(data.code === 0){-->
    <#--                layer.close(loading)-->
    <#--            }else{-->
    <#--                layer.close(loading)-->
    <#--                error(data.msg)-->
    <#--            }-->
    <#--        },-->
    <#--        error:function(data){-->
    <#--            layer.close(loading)-->
    <#--            error(data.msg);-->
    <#--        }-->
    <#--    });-->
    <#--}-->
</script>

<style lang="scss">
    .c_top {
        width: 100%;
    }
    .c_logo_top {
        max-width: 1060px;
        min-width: 1060px;
        height: 50px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
    }
    ul {
        display: flex;
        padding: 14px !important;
    }
    ul li {
        padding-right: 12px;
        color: #555566;
    }
    ul li a {
        color: #555555;
    }
    ul li a:hover {
        cursor: pointer;
        color: #bbb;
    }
</style>