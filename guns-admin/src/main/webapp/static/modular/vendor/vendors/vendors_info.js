/**
 * 初始化供应商详情对话框
 */
var VendorsInfoDlg = {
    vendorsInfoData : {}
};

/**
 * 清除数据
 */
VendorsInfoDlg.clearData = function() {
    this.vendorsInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
VendorsInfoDlg.set = function(key, val) {
    this.vendorsInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
VendorsInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
VendorsInfoDlg.close = function() {
    parent.layer.close(window.parent.Vendors.layerIndex);
}

/**
 * 收集数据
 */
VendorsInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('vendorNameCh')
    .set('vendorNameEn')
    .set('address')
    .set('phone')
    .set('Email')
    .set('responsiblePerson')
    .set('createTime')
    .set('updateTime');
}

/**
 * 提交添加
 */
VendorsInfoDlg.addSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.vendorsInfoData)){//校验
        return;
    }
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/vendors/add", function(data){
        Feng.success("添加成功!");
        window.parent.Vendors.table.refresh();
        VendorsInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.vendorsInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
VendorsInfoDlg.editSubmit = function() {
    this.clearData();
    this.collectData();
    if(!check(this.vendorsInfoData)){//校验
        return;
    }
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/vendors/update", function(data){
        Feng.success("修改成功!");
        window.parent.Vendors.table.refresh();
        VendorsInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.vendorsInfoData);
    ajax.start();
}

function check(data){
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    debugger
    if(!data.Email || !reg.test(data.Email)){
        Feng.info("请输入正确的邮箱格式!");
        return false;
    }
    
    reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    if(!data.vendorNameCh || !reg.test(data.vendorNameCh)){
         Feng.info("请输入正确的中文名称！");
         return false;
    }
    // reg = /^[a-zA-Z]+$/;
    // if(!data.vendorNameEn || !reg.test(data.vendorNameEn)){
    //      Feng.info("请输入正确的英文名称！");
    //      return false;
    // }
    reg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
    if(!data.phone || !reg.test(data.phone)){
        Feng.info("请输入正确的手机号码！");
        return false;
    }
    if(!data.responsiblePerson){
        Feng.info("请输入正确的负责人名称!");
        return false;
    }
    if(!data.address){
        Feng.info("请输入正确的地址!");
        return false;
    }
    return true;
 }


$(function() {

});
