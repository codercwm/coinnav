/**
 * Created by Administrator on 2019/4/12.
 */
function _self(obj){
    // var url_id = $(obj).prev('.url_id').val();
    var url_id = $(obj).siblings('.url_id').val();
    //glyphicon-star 收藏
    // var is_add = $(obj).is('.la-star');  //未收藏
    var is_add = $(obj).is('.glyphicon-star');  //未收藏
    //判断是否收藏了
    if(is_add){
        //从自定义删除
        $.ajax({
            type: "post",
            url: "/index/index/delSelf",
            data: {
                url_id:url_id,
            },
            dataType: "json",
            success: function(data){
                if(-1==data.code){
                    Frontend.loginFrame();
                    return;
                }
                if(data.code == 0){
                    $(obj).removeClass('glyphicon-star');
                    $(obj).addClass('glyphicon-star-empty');
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        })
    }else {
        //添加到自定义
        $.ajax({
            type: "post",
            url: "/index/index/addSelf",
            data: {
                url_id:url_id,
            },
            dataType: "json",
            success: function(data){
                if(-1==data.code){
                    Frontend.loginFrame();
                    return;
                }
                if(data.code == 0){
                    $(obj).removeClass('glyphicon-star-empty');
                    $(obj).addClass('glyphicon-star');
                    layer.msg(data.msg);
                }else{
                    layer.msg(data.msg);
                }
            }
        })
    }
}


//用户添加自己的站点
function addUserSite() {
    $.ajax({
        type: "post",
        url: "/index/index/addUserSite",
        data: {
            name:$('#site_name').val(),
            url:$('#site_url').val(),
        },
        dataType: "json",
        success: function(data){
            if(data.code == 0){
                parent.layer.msg(data.msg,{time:1000},function () {
                    window.parent.location.reload();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                });
            }else{
                parent.layer.msg(data.msg,{
                    time:2000   //2秒关闭(如果不配置,默认是3秒)
                });
            }
        }
    })
}