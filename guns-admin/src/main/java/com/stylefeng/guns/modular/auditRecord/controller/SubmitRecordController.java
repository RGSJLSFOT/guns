package com.stylefeng.guns.modular.auditRecord.controller;

import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.auditRecord.service.ISubmitRecordService;

/**
 * 审核记录控制器
 *
 * @author fengshuonan
 * @Date 2018-12-12 10:20:36
 */
@Controller
@RequestMapping("/submitRecord")
public class SubmitRecordController extends BaseController {

    private String PREFIX = "/auditRecord/submitRecord/";

    @Autowired
    private ISubmitRecordService submitRecordService;

    /**
     * 跳转到审核记录首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "submitRecord.html";
    }

    /**
     * 跳转到添加审核记录
     */
    @RequestMapping("/submitRecord_add")
    public String submitRecordAdd() {
        return PREFIX + "submitRecord_add.html";
    }

    /**
     * 跳转到修改审核记录
     */
    @RequestMapping("/submitRecord_update/{submitRecordId}")
    public String submitRecordUpdate(@PathVariable Integer submitRecordId, Model model) {
        SubmitRecord submitRecord = submitRecordService.selectById(submitRecordId);
        model.addAttribute("item",submitRecord);
        LogObjectHolder.me().set(submitRecord);
        return PREFIX + "submitRecord_edit.html";
    }

    /**
     * 获取审核记录列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return submitRecordService.selectList(null);
    }

    /**
     * 新增审核记录
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(SubmitRecord submitRecord) {
        submitRecordService.insert(submitRecord);
        return SUCCESS_TIP;
    }

    /**
     * 删除审核记录
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer submitRecordId) {
        submitRecordService.deleteById(submitRecordId);
        return SUCCESS_TIP;
    }

    /**
     * 修改审核记录
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(SubmitRecord submitRecord) {
        submitRecordService.updateById(submitRecord);
        return SUCCESS_TIP;
    }

    /**
     * 审核记录详情
     */
    @RequestMapping(value = "/detail/{submitRecordId}")
    @ResponseBody
    public Object detail(@PathVariable("submitRecordId") Integer submitRecordId) {
        return submitRecordService.selectById(submitRecordId);
    }
}
