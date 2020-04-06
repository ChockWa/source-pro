let loader

(function () {
    layui.use("layer", function () {
        loader = layui.layer
    })
})()

function loading() {
    return loader.load(2, {shade: [0.6, '#ccc']})
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