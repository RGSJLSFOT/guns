/**
 * 加班管理初始化
 */
var OverTime = {
    id: "OverTimeTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
OverTime.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: 'ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
            {title: '员工ID', field: 'userId', visible: false, align: 'center', valign: 'middle'},
            {title: '用户名称', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatus', visible: false, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'startTime', visible: true, align: 'center', valign: 'middle'},
            {title: '结束时间', field: 'endTime', visible: true, align: 'center', valign: 'middle'},
            {title: '加班时长', field: 'overTimeHour', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '修改时间', field: 'updateTime', visible: false, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
OverTime.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        OverTime.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加加班
 */
OverTime.openAddOverTime = function () {
    var index = layer.open({
        type: 2,
        title: '添加加班',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/overTime/overTime_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看加班详情
 */
OverTime.openOverTimeDetail = function () {
    if (this.check()) {
        var data = OverTime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能修改");
            return;
        }
        var index = layer.open({
            type: 2,
            title: '加班详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/overTime/overTime_update/' + OverTime.seItem.Id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除加班
 */
OverTime.delete = function () {
    if (this.check()) {
        var data = OverTime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能删除");
            return;
        }
        var ajax = new $ax(Feng.ctxPath + "/overTime/delete", function (data) {
            Feng.success("删除成功!");
            OverTime.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("overTimeId",this.seItem.Id);
        ajax.start();
    }
};

/**
 * 查询加班列表
 */
OverTime.search = function () {
    var queryData = {};
    queryData['startTime'] = $("#startTime").val();
    if($("#type")){
    	queryData['type'] = $("#type").val();
    }
    OverTime.table.refresh({query: queryData});
};



/**
 * 修改加班状态
 */
OverTime.updateStatus = function (status) {
	if (this.check()) {
		var ajax = new $ax(Feng.ctxPath + "/overTime/updateStatus", function (data) {
			Feng.success("状态修改成功!");
			OverTime.table.refresh();
		}, function (data) {
			Feng.error("状态修改失败!" + data.responseJSON.message + "!");
		});
		ajax.set('status',status);
		ajax.set("overTimeId",this.seItem.Id);
		ajax.start();
	}
};




$(function () {
    var defaultColunms = OverTime.initColumn();
    var table = new BSTable(OverTime.id, "/overTime/list", defaultColunms);
    table.setPaginationType("client");
    OverTime.table = table.init();
});
