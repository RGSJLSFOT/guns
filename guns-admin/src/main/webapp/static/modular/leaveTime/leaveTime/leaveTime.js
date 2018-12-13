/**
 * 请假管理初始化
 */
var LeaveTime = {
    id: "LeaveTimeTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
LeaveTime.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: 'ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
            {title: '用户ID', field: 'userId', visible: false, align: 'center', valign: 'middle'},
            {title: '用户名称', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatus', visible: false, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'startTime', visible: true, align: 'center', valign: 'middle'},
            {title: '结束时间', field: 'endTime', visible: true, align: 'center', valign: 'middle'},
            {title: '请假类型', field: 'leaveType', visible: false, align: 'center', valign: 'middle'},
            {title: '请假类型', field: 'leaveTypeName', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: true, align: 'center', valign: 'middle'},
            {title: '修改时间', field: 'updateTime', visible: true, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
LeaveTime.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        LeaveTime.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加请假
 */
LeaveTime.openAddLeaveTime = function () {
    var index = layer.open({
        type: 2,
        title: '添加请假',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/leaveTime/leaveTime_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看请假详情
 */
LeaveTime.openLeaveTimeDetail = function () {
    if (this.check()) {
        var data = LeaveTime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能修改");
            return;
        }
        var index = layer.open({
            type: 2,
            title: '请假详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/leaveTime/leaveTime_update/' + LeaveTime.seItem.Id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除请假
 */
LeaveTime.delete = function () {
    if (this.check()) {
        var data = LeaveTime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能删除");
            return;
        }
        var ajax = new $ax(Feng.ctxPath + "/leaveTime/delete", function (data) {
            Feng.success("删除成功!");
            LeaveTime.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("leaveTimeId",this.seItem.Id);
        ajax.start();
    }
};

/**
 * 查询请假列表
 */
LeaveTime.search = function () {
    var queryData = {};
    queryData['leaveType'] = $("#leaveType").val();
    queryData['leaveDate'] = $("#leaveDate").val();
    if($("#type")){
    	queryData['type'] = $("#type").val();
    }
    LeaveTime.table.refresh({query: queryData});
};

/**
 * 修改请假状态
 */
LeaveTime.updateStatus = function (status) {
	if (this.check()) {
		var ajax = new $ax(Feng.ctxPath + "/leaveTime/updateStatus", function (data) {
			Feng.success("状态修改成功!");
			LeaveTime.table.refresh();
		}, function (data) {
			Feng.error("状态修改失败!" + data.responseJSON.message + "!");
		});
		ajax.set('status',status);
		ajax.set("leaveTimeId",this.seItem.Id);
		ajax.start();
	}
};

$(function () {
    var defaultColunms = LeaveTime.initColumn();
    var table = new BSTable(LeaveTime.id, "/leaveTime/list", defaultColunms);
    table.setPaginationType("client");
    LeaveTime.table = table.init();
});
