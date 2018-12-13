/**
 * 产品项目管理初始化
 */
var Project = {
    id: "ProjectTable",	//表格id
    seItem: null,		//选中的条目
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
Project.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
            {title: '项目ID', field: 'Id', visible: false, align: 'center', valign: 'middle'},
            {title: '项目名称', field: 'projectName', visible: true, align: 'center', valign: 'middle'},
            {title: '项目KEY', field: 'projectKey', visible: true, align: 'center', valign: 'middle'},
            {title: '负责人', field: 'responsiblePersion', visible: true, align: 'center', valign: 'middle'},
            {title: '父级项目ID', field: 'parentId', visible: false, align: 'center', valign: 'middle'},
            {title: '项目描述', field: 'description', visible: true, align: 'center', valign: 'middle'},
            {title: '创建时间', field: 'createTime', visible: false, align: 'center', valign: 'middle'},
            {title: '修改时间', field: 'updateTime', visible: false, align: 'center', valign: 'middle'}
    ];
};

/**
 * 检查是否选中
 */
Project.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        Project.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加产品项目
 */
Project.openAddProject = function () {
    var index = layer.open({
        type: 2,
        title: '添加产品项目',
        area: ['800px', '420px'], //宽高
        fix: false, //不固定
        maxmin: true,
        content: Feng.ctxPath + '/project/project_add'
    });
    this.layerIndex = index;
};

/**
 * 打开查看产品项目详情
 */
Project.openProjectDetail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '产品项目详情',
            area: ['800px', '420px'], //宽高
            fix: false, //不固定
            maxmin: true,
            content: Feng.ctxPath + '/project/project_update/' + Project.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除产品项目
 */
Project.delete = function () {
    if (this.check()) {
        var ajax = new $ax(Feng.ctxPath + "/project/delete", function (data) {
            Feng.success("删除成功!");
            Project.table.refresh();
        }, function (data) {
            Feng.error("删除失败!" + data.responseJSON.message + "!");
        });
        ajax.set("projectId",this.seItem.id);
        ajax.start();
    }
};

/**
 * 查询产品项目列表
 */
Project.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    Project.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = Project.initColumn();
    var table = new BSTable(Project.id, "/project/list", defaultColunms);
    table.setPaginationType("client");
    Project.table = table.init();
});
