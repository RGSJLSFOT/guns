/**
 * 初始化产品项目详情对话框
 */
var ProjectInfoDlg = {
    projectInfoData : {}
};

/**
 * 清除数据
 */
ProjectInfoDlg.clearData = function() {
    this.projectInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProjectInfoDlg.set = function(key, val) {
    this.projectInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
ProjectInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
ProjectInfoDlg.close = function() {
    parent.layer.close(window.parent.Project.layerIndex);
}

/**
 * 收集数据
 */
ProjectInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('projectName')
    .set('projectKey')
    .set('responsiblePersion')
    .set('parentId')
    .set('description')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
ProjectInfoDlg.addSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.projectInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/project/add", function(data){
        Feng.success("添加成功!");
        window.parent.Project.table.refresh();
        ProjectInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.projectInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
ProjectInfoDlg.editSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.projectInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/project/update", function(data){
        Feng.success("修改成功!");
        window.parent.Project.table.refresh();
        ProjectInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.projectInfoData);
    ajax.start();
}

function check(data){
    if(!data.projectName){
        Feng.info("请输入正确的项目名称！");
        return false;
    }
   if(!data.projectKey){
        Feng.info("请输入正确的项目KEY！");
        return false;
   }
   if(!data.responsiblePersion){
        Feng.info("请输入正确的负责人！");
        return false;
   }
   if(!data.description){
        Feng.info("请输入正确的描述！");
        return false;
   }
   return true;
 }


$(function() {

});
