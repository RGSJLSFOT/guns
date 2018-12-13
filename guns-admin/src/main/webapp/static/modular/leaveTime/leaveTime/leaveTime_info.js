/**
 * 初始化请假详情对话框
 */
var LeaveTimeInfoDlg = {
    leaveTimeInfoData : {}
};

/**
 * 清除数据
 */
LeaveTimeInfoDlg.clearData = function() {
    this.leaveTimeInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
LeaveTimeInfoDlg.set = function(key, val) {
    this.leaveTimeInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
LeaveTimeInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
LeaveTimeInfoDlg.close = function() {
    parent.layer.close(window.parent.LeaveTime.layerIndex);
}

/**
 * 收集数据
 */
LeaveTimeInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('userId')
    .set('startTime')
    .set('endTime')
    .set('leaveType')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
LeaveTimeInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();
    if(!check(this.leaveTimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/leaveTime/add", function(data){
        Feng.success("添加成功!");
        window.parent.LeaveTime.table.refresh();
        LeaveTimeInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.leaveTimeInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
LeaveTimeInfoDlg.editSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.leaveTimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/leaveTime/update", function(data){
        Feng.success("修改成功!");
        window.parent.LeaveTime.table.refresh();
        LeaveTimeInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.leaveTimeInfoData);
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
	   Feng.info("结束时间不能小于开始时间");
	   return false;
   }
   return true;
 }

$(function() {
	$("#startTime").val($("#startTimeStr").val());
	$("#endTime").val($("#endTimeStr").val());
});
