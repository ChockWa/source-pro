<#assign detailInfo = detailInfo >
<div class="c_source_detail">
    <div class="c_source_title">${detailInfo.title}</div>
    <div class="c_source_desc">2020-04-08&nbsp;&nbsp;&nbsp;浏览数：${detailInfo.scanCount}</div>
    <hr>
    <div class="c_source_content">${detailInfo.content}</div>
</div>
<style>
    .c_source_detail {
        background-color: #fff;
        width: 96%;
        margin: 0 auto;
        border-top: 1px solid #e6e6e6;
    }
    .c_source_title {
        font-size: 20px;
        font-weight: 600;
        padding-top: 10px;
    }
    .c_source_desc {
        padding-top: 10px;
    }
    .c_source_content {
        padding: 6px 0 70px 0;
    }
</style>