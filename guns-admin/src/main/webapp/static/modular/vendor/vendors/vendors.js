/**
 * 供应商管理初始化
 */
var Vendors = {
    id: "VendorsTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Vendors.initColumn = function () {
    return [
         {field: 'selectItem', radio: true},
	        {title: '供应商ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
	        {title: '中文名称', field: 'vendorNameCh', visible: true, align: 'center', valign: 'middle'},
	        {title: '英文名称', field: 'vendorNameEn', visible: true, align: 'center', valign: 'middle'},
	        {title: '地址', field: 'address', visible: true, align: 'center', valign: 'middle'},
	        {title: '联系电话', field: 'phone', visible: true, align: 'center', valign: 'middle'},
	        {title: '电子邮箱', field: 'Email', visible: true, align: 'center', valign: 'middle'},
	        {title: '负责人', field: 'responsiblePerson', visible: true, align: 'center', valign: 'middle'},
	        {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
	        {title: '修改时间', field: 'updateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Vendors.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Vendors.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加供应商
 */
Vendors.openAddVendors = function () {
    var index = layer.open({
        type: 2,
        title: '添加供应商',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/vendors/vendors_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看供应商详情
 */
Vendors.openVendorsDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '供应商详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/vendors/vendors_update/' + this.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除供应商
 */
Vendors.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/vendors/delete", function (data) {
            Feng.success("删除成功!");
            Vendors.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("vendorsId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询供应商列表
 */
Vendors.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Vendors.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Vendors.initColumn();
    var table = new BSTable(Vendors.id, "/vendors/list", defaultColunms);
    table.setPaginationType("client");
    Vendors.table = table.init();
});

