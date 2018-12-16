/**
 * 初始化供应商员工详情对话框
 */
var VendorUserInfoDlg = {
    vendorUserInfoData : {}
};

/**
 * 清除数据
 */
VendorUserInfoDlg.clearData = function() {
    this.vendorUserInfoData = {};
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
VendorUserInfoDlg.set = function(key, val) {
    this.vendorUserInfoData[key] = (typeof val == "undefined") ? $("#" + key).val() : val;
    return this;
}

/**
 * 设置对话框中的数据
 *
 * @param key 数据的名称
 * @param val 数据的具体值
 */
VendorUserInfoDlg.get = function(key) {
    return $("#" + key).val();
}

/**
 * 关闭此对话框
 */
VendorUserInfoDlg.close = function() {
    parent.layer.close(window.parent.VendorUser.layerIndex);
}

/**
 * 收集数据
 */
VendorUserInfoDlg.collectData = function() {
    this
    .set('Id')
    .set('userNO')
    .set('pwd')
    .set('userNameCh')
    .set('userNameEn')
    .set('gender')
    .set('leaderId')
    .set('professionalLevel')
    .set('email')
    .set('phone')
    .set('roleId')
    .set('vendorId')
    .set('projectId')
    .set('hiringStatus')
    .set('positionId')
    .set('entryTime')
    .set('photo')
    .set('createTime')
    .set('uptdaeTime');
}

/**
 * 提交添加
 */
VendorUserInfoDlg.addSubmit = function() {

    this.clearData();
    this.collectData();
    if(!check(this.vendorUserInfoData)){
        return;
    }//校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/vendorUser/add", function(data){
        Feng.success("添加成功!");
        window.parent.VendorUser.table.refresh();
        VendorUserInfoDlg.close();
    },function(data){
        Feng.error("添加失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.vendorUserInfoData);
    ajax.start();
}

/**
 * 提交修改
 */
VendorUserInfoDlg.editSubmit = function() {

    this.clearData();
    this.collectData();
    if(!check(this.vendorUserInfoData)){
        return;
    }
    this.vendorUserInfoData.roleId =$("#role").val();
    this.vendorUserInfoData.positionId =$("#position").val();
    this.vendorUserInfoData.vendorId =$("#vendor").val();
    this.vendorUserInfoData.gender =$("#genderName").val();
    this.vendorUserInfoData.projectId =$("#project").val();
    this.vendorUserInfoData.professionalLevel =$("#professionalLevelName").val();
    this.vendorUserInfoData.hiringStatus =$("#hiringStatusName").val();
    
    //校验
    //提交信息
    var ajax = new $ax(Feng.ctxPath + "/vendorUser/update", function(data){
        Feng.success("修改成功!");
        window.parent.VendorUser.table.refresh();
        VendorUserInfoDlg.close();
    },function(data){
        Feng.error("修改失败!" + data.responseJSON.message + "!");
    });
    ajax.set(this.vendorUserInfoData);
    ajax.start();
}

function check(data){
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    if(!data.email || !reg.test(data.email)){
        Feng.info("请输入正确的邮箱格式!");
        return false;
    }
    reg = /[\u4E00-\u9FA5\uF900-\uFA2D]/;
    if(!data.userNameCh || !reg.test(data.userNameCh)){
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
    // if(!data.responsiblePerson){
    //     Feng.info("请输入正确的负责人名称!");
    //     return false;
    // }
    if(!data.vendorId){
        Feng.info("请输入正确的供应商!");
        return false;
    }
    if(!data.projectId){
        Feng.info("请输入正确的项目!");
        return false;
    }
    if(!data.entryTime){
        Feng.info("请输入正确的入职时间!");
        return false;
    }
    if(!data.pwd){
        Feng.info("请输入正确的密码!");
        return false;
    }
    if(!data.userNO){
        Feng.info("请输入正确的员工工号!");
        return false;
    }
    return true;
 }



$(function() {
	 //初始化性别选项
    $("#role").val($("#roleId").val());
    $("#position").val($("#positionId").val());
    $("#vendor").val($("#vendorId").val());
    $("#genderName").val($("#gender").val());
    $("#project").val($("#projectId").val());
    $("#professionalLevelName").val($("#professionalLevel").val());
    $("#hiringStatusName").val($("#hiringStatus").val());
    
});
