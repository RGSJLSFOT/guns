/**
 * 初始化工时详情对话框
 */
var WorktimeInfoDlg = {
    worktimeInfoData : {}
};

/**
 * 清除数据
 */
WorktimeInfoDlg.clearData = function() {
    this.worktimeInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WorktimeInfoDlg.set = function(key, val) {
    this.worktimeInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
WorktimeInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
WorktimeInfoDlg.close = function() {
    parent.layer.close(window.parent.Worktime.layerIndex);
}

/**
 * 收集数据
 */
WorktimeInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('userId')
    .set('submitStatus')
    .set('week')
    .set('workDate')
    .set('startTime')
    .set('endTime')
    .set('workTime')
    //.set('overTime')
    .set('content')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
WorktimeInfoDlg.addSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.worktimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/worktime/add", function(data){
        Feng.success("添加成功!");
        window.parent.Worktime.table.refresh();
        WorktimeInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.worktimeInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
WorktimeInfoDlg.editSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.worktimeInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/worktime/update", function(data){
        Feng.success("修改成功!");
        window.parent.Worktime.table.refresh();
        WorktimeInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.worktimeInfoData);
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
   if(!data.workTime){
        Feng.info("请输入正确的工作时长！");
        return false;
   }
   if(!data.workDate){
        Feng.info("请输入正确的日期！");
        return false;
   }
   return true;
}

$(function() {
});

var weekArr = ["日","一","二","三","四","五","六"];

function calcWorkTime(){
    $("#workTime").val(DateUtils.getHour($("#startTime").val(),$("#endTime").val()));//根据开始时间和结束时间算出工作时长
}
