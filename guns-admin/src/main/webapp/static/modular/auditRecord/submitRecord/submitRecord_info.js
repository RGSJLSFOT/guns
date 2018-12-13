/**
 * 初始化审核记录详情对话框
 */
var SubmitRecordInfoDlg = {
    submitRecordInfoData : {}
};

/**
 * 清除数据
 */
SubmitRecordInfoDlg.clearData = function() {
    this.submitRecordInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
SubmitRecordInfoDlg.set = function(key, val) {
    this.submitRecordInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
SubmitRecordInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
SubmitRecordInfoDlg.close = function() {
    parent.layer.close(window.parent.SubmitRecord.layerIndex);
}

/**
 * 收集数据
 */
SubmitRecordInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('type')
    .set('ywId')
    .set('submitUserId')
    .set('submitTime')
    .set('auditUserId')
    .set('auditTime')
    .set('auditResult');
}

/**
 * 提交添加
 */
SubmitRecordInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/submitRecord/add", function(data){
        Feng.success("添加成功!");
        window.parent.SubmitRecord.table.refresh();
        SubmitRecordInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.submitRecordInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
SubmitRecordInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();

    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/submitRecord/update", function(data){
        Feng.success("修改成功!");
        window.parent.SubmitRecord.table.refresh();
        SubmitRecordInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.submitRecordInfoData);
    ajax.start();
}

$(function() {

});
