/**
 * 初始化加班详情对话框
 */
var OverTimeInfoDlg = {
    overTimeInfoData : {}
};

/**
 * 清除数据
 */
OverTimeInfoDlg.clearData = function() {
    this.overTimeInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OverTimeInfoDlg.set = function(key, val) {
    this.overTimeInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
OverTimeInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
OverTimeInfoDlg.close = function() {
    parent.layer.close(window.parent.OverTime.layerIndex);
}

/**
 * 收集数据
 */
OverTimeInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('userId')
    .set('startTime')
    .set('endTime')
    .set('overTimeHour')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
OverTimeInfoDlg.addSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.overTimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/overTime/add", function(data){
        Feng.success("添加成功!");
        window.parent.OverTime.table.refresh();
        OverTimeInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });

    ajax.set(this.overTimeInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
OverTimeInfoDlg.editSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.overTimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/overTime/update", function(data){
        Feng.success("修改成功!");
        window.parent.OverTime.table.refresh();
        OverTimeInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.overTimeInfoData);
    ajax.start();
}

function check(data){
   if(!data.startTime){
        Feng.info("请输入正确的开始时间！");
        return false;
   }
   if(!data.endTime){
        Feng.info("请输入正确的结束时间！");
        return false;
   }
   if(data.startTime > data.endTime){
	   Feng.info("结束时间要大于开始时间");
	   return false;
   }
   
   return true;
 }

$(function() {

});
