/**
 * 工时管理初始化
 */
var Worktime = {
    id: "WorktimeTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Worktime.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '工时ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
            {title: '用户ID', field: 'userId', visible: false, align: 'center', valign: 'middle'},
            {title: '用户名称', field: 'userName', visible: true, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatus', visible: false, align: 'center', valign: 'middle'},
            {title: '状态', field: 'submitStatusName', visible: true, align: 'center', valign: 'middle'},
            {title: '星期', field: 'week', visible: true, align: 'center', valign: 'middle'},
            {title: '日期', field: 'workDate', visible: false, align: 'center', valign: 'middle'},
            {title: '日期', field: 'workDateStr', visible: true, align: 'center', valign: 'middle'},
            {title: '开始时间', field: 'startTime', visible: true, align: 'center', valign: 'middle'},
            {title: '结束时间', field: 'endTime', visible: true, align: 'center', valign: 'middle'},
            {title: '工作时长', field: 'workTime', visible: true, align: 'center', valign: 'middle'},
            // {title: '加班时长', field: 'overTime', visible: true, align: 'center', valign: 'midddle'},
            {title: '工作内容', field: 'content', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: false, align: 'center', valign: 'middle'},
            {title: '修改时间', field: 'updateTime', visible: false, align: 'center', valign: 'middle'}
    ];
};


/**
 * 检查是否选中
 */
Worktime.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Worktime.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加工时
 */
Worktime.openAddWorktime = function () {
    var index = layer.open({
        type: 2,
        title: '添加工时',
        area: ['800px', '430px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/worktime/worktime_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看工时详情
 */
Worktime.openWorktimeDetail = function () {
    if (this.check()) {
        var data = Worktime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能修改");
            return;
        }
        var index = layer.open({
            type: 2,
            title: '工时详情',
            area: ['800px', '430px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/worktime/worktime_update/' + Worktime.seItem.Id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除工时
 */
Worktime.delete = function () {
    if (this.check()) {
        var data = Worktime.seItem;
        if(data.submitStatus == 1 || data.submitStatus == 2){
            Feng.info("已提交状态下不能删除");
            return;
        }
        var ajax = new $ax(Feng.ctxPath + "/worktime/delete", function (data) {
            Feng.success("删除成功!");
            Worktime.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("worktimeId",this.seItem.Id);
        ajax.start();
    }
};

/**
 * 查询工时列表
 */
Worktime.search = function () {
    var queryData = {};
    queryData['content'] = $("#content").val();
    queryData['workDate'] = $("#workDate").val();
    if($("#type")){
    	queryData['type'] = $("#type").val();
    }
    Worktime.table.refresh({query: queryData});
};

/**
 * 修改工时状态状态
 */
Worktime.updateStatus = function (status) {
	if (this.check()) {
		var ajax = new $ax(Feng.ctxPath + "/worktime/updateStatus", function (data) {
			Feng.success("状态修改成功!");
			Worktime.table.refresh();
		}, function (data) {
			Feng.error("状态修改失败!" + data.responseJSON.message + "!");
		});
		ajax.set('status',status);
		ajax.set("workTimeId",this.seItem.Id);
		ajax.start();
	}
};

$(function () {
    var defaultColunms = Worktime.initColumn();
    var table = new BSTable(Worktime.id, "/worktime/list", defaultColunms);
    table.setPaginationType("client");
    Worktime.table = table.init();
});

