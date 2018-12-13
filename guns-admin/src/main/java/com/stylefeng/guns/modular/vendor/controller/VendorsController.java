package com.stylefeng.guns.modular.vendor.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.util.ToolUtil;

import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.Vendors;
import com.stylefeng.guns.modular.vendor.service.IVendorsService;

/**
 * 供应商控制器
 *
 * @author fengshuonan
 * @Date 2018-12-05 17:41:38
 */
@Controller
@RequestMapping("/vendors")
public class VendorsController extends BaseController {

    private String PREFIX = "/vendor/vendors/";

    @Autowired
    private IVendorsService vendorsService;

    /**
     * 跳转到供应商首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "vendors.html";
    }

    /**
     * 跳转到添加供应商
     */
    @RequestMapping("/vendors_add")
    public String vendorsAdd() {
        return PREFIX + "vendors_add.html";
    }

    /**
     * 跳转到修改供应商
     */
    @RequestMapping("/vendors_update/{vendorsId}")
    public String vendorsUpdate(@PathVariable Integer vendorsId, Model model) {
        Vendors vendors = vendorsService.selectById(vendorsId);
        model.addAttribute("item",vendors);
        LogObjectHolder.me().set(vendors);
        return PREFIX + "vendors_edit.html";
    }

    /**
     * 获取供应商列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
    	if(ToolUtil.isEmpty(condition)){
    		return vendorsService.selectList(null);
        }else{
        	EntityWrapper<Vendors> entityWrapper = new EntityWrapper<Vendors>();
        	Wrapper<Vendors> result = entityWrapper.like("vendorNameCh", condition);
        	
        	return vendorsService.selectList(result);
        }
    }

    /**
     * 新增供应商
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Vendors vendors) {
        vendorsService.insert(vendors);
        return SUCCESS_TIP;
    }

    /**
     * 删除供应商
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer vendorsId) {
        vendorsService.deleteById(vendorsId);
        return SUCCESS_TIP;
    }

    /**
     * 修改供应商
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Vendors vendors) {
        vendorsService.updateById(vendors);
        return SUCCESS_TIP;
    }

    /**
     * 供应商详情
     */
    @RequestMapping(value = "/detail/{vendorsId}")
    @ResponseBody
    public Object detail(@PathVariable("vendorsId") Integer vendorsId) {
        return vendorsService.selectById(vendorsId);
    }
}
