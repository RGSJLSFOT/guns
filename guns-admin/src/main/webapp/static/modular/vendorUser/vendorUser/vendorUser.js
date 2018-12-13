/**
 * 供应商员工管理初始化
 */
var VendorUser = {
    id: "VendorUserTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
VendorUser.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '供应商员工ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
            {title: '员工工号', field: 'userNO', visible: true, align: 'center', valign: 'middle'},
            {title: '密码', field: 'pwd', visible: true, align: 'center', valign: 'middle'},
            {title: '中文名', field: 'userNameCh', visible: true, align: 'center', valign: 'middle'},
            {title: '英文名', field: 'userNameEn', visible: true, align: 'center', valign: 'middle'},
            {title: '性别代码', field: 'gender', visible: false, align: 'center', valign: 'middle'},
            {title: '性别', field: 'genderName', visible: true, align: 'center', valign: 'middle'},
            {title: '领导人ID', field: 'leaderId', visible: false, align: 'center', valign: 'middle'},
            {title: '领导人名称', field: 'leaderName', visible: true, align: 'center', valign: 'middle'},
            {title: '职级', field: 'professionalLevel', visible: false, align: 'center', valign: 'middle'},
            {title: '职级', field: 'professionalLevelName', visible: true, align: 'center', valign: 'middle'},
            {title: '邮箱', field: 'email', visible: true, align: 'center', valign: 'middle'},
            {title: '联系电话', field: 'phone', visible: true, align: 'center', valign: 'middle'},
            {title: '角色ID', field: 'roleId', visible: false, align: 'center', valign: 'middle'},
            {title: '角色名称', field: 'roleName', visible: true, align: 'center', valign: 'middle'},
            {title: '供应商ID', field: 'vendorId', visible: false, align: 'center', valign: 'middle'},
            {title: '供应商名称', field: 'vendorName', visible: true, align: 'center', valign: 'middle'},
            {title: '项目ID', field: 'projectId', visible: false, align: 'center', valign: 'middle'},
            {title: '项目名称', field: 'projectName', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'hiringStatus', visible: false, align: 'center', valign: 'middle'},
            {title: '状态', field: 'hiringStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '岗位ID', field: 'positionId', visible: false, align: 'center', valign: 'middle'},
            {title: '岗位', field: 'positionName', visible: true, align: 'center', valign: 'middle'},
            {title: '入职时间', field: 'entryTime', visible: true, align: 'center', valign: 'middle'},
            {title: '头像', field: 'photo', visible: false, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '修改时间', field: 'uptdaeTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
VendorUser.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        VendorUser.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加供应商员工
 */
VendorUser.openAddVendorUser = function () {
    var index = layer.open({
        type: 2,
        title: '添加供应商员工',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/vendorUser/vendorUser_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看供应商员工详情
 */
VendorUser.openVendorUserDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '供应商员工详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/vendorUser/vendorUser_update/' + VendorUser.seItem.Id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除供应商员工
 */
VendorUser.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/vendorUser/delete", function (data) {
            Feng.success("删除成功!");
            VendorUser.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("vendorUserId",this.seItem.Id);
        ajax.start();
    }
};

/**
 * 查询供应商员工列表
 */
VendorUser.search = function () {
    var queryData = {};
    queryData['userNameCH'] = $("#userNameCH").val();
    VendorUser.table.refresh({query: queryData});
};

/**
 * 选择project的事件
 */
VendorUser.selectProj = function (projId) {
	$("#projectId").val(projId);
};

/**
 * 选择vendor的事件
 */
VendorUser.selectVendor = function (vendorId) {
	$("#vendorId").val(vendorId);
};

/**
 * 设置表名称
 *//*
VendorUser.setTableName = function (tableName) {
    var preSize = $("#ignoreTabelPrefix").val().length;
    $("#tableName").val(tableName);
    $("#className").val(Feng.underLineToCamel(tableName.substring(preSize)));
};*/


$(function () {
    var defaultColunms = VendorUser.initColumn();
    var table = new BSTable(VendorUser.id, "/vendorUser/list", defaultColunms);
    table.setPaginationType("client");
    VendorUser.table = table.init();
});
