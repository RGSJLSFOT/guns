package com.stylefeng.guns.modular.vendorUser.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.common.constant.state.ManagerStatus;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.shiro.AuthKit;
import com.stylefeng.guns.core.util.ToolUtil;

import org.springframework.web.bind.annotation.RequestParam;

import com.stylefeng.guns.modular.system.model.LeaveTime;
import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.warpper.LeaveTimeWarpper;
import com.stylefeng.guns.modular.system.warpper.VendorUserWarpper;
import com.stylefeng.guns.modular.vendorUser.service.IVendorUserService;
import com.stylefeng.guns.modular.vendorUser.service.ProjService;

/**
 * 供应商员工控制器
 *
 * @author fengshuonan
 * @Date 2018-12-06 16:03:01
 */
@Controller
@RequestMapping("/vendorUser")
public class VendorUserController extends BaseController {

    private String PREFIX = "/vendorUser/vendorUser/";

    @Autowired
    private IVendorUserService vendorUserService;

    @Autowired
    private ProjService projService;
    /**
     * 跳转到供应商员工首页
     */
    @RequestMapping("")
    public String index(Model model) {
    	
        return PREFIX + "vendorUser.html";
    }

    /**
     * 跳转到添加供应商员工
     */
    @RequestMapping("/vendorUser_add")
    public String vendorUserAdd(Model model) {
    	model.addAttribute("leaderName", ConstantFactory.me().getUserNameById(AuthKit.getUser().getId()));
    	model.addAttribute("vendors", projService.getAllVendors());
    	model.addAttribute("projects", projService.getAllProjects());
        return PREFIX + "vendorUser_add.html";
    }

    /**
     * 跳转到修改供应商员工
     */
    @RequestMapping("/vendorUser_update/{vendorUserId}")
    public String vendorUserUpdate(@PathVariable Integer vendorUserId, Model model) {
    	model.addAttribute("vendors", projService.getAllVendors());
    	model.addAttribute("projects", projService.getAllProjects());
        VendorUser vendorUser = vendorUserService.selectById(vendorUserId);
        model.addAttribute("item",vendorUser);
        model.addAttribute("leaderName",ConstantFactory.me().getUserNameByAccount(vendorUser.getLeaderId()));
        LogObjectHolder.me().set(vendorUser);
        return PREFIX + "vendorUser_edit.html";
    }

    /**
     * 获取供应商员工列表
     *//*
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
        return vendorUserService.selectList(null);
    }
	*/
    
    @RequestMapping(value = "/list")
	@ResponseBody
    public Object list(String userNameCH) {
        //Integer id = AuthKit.getUser().getId();
        String account = AuthKit.getUser().getAccount();
    	EntityWrapper<VendorUser> entityWrapper = new EntityWrapper<VendorUser>();
    	Wrapper<VendorUser> result = entityWrapper.eq("leaderId", account); 
    	if(!ToolUtil.isEmpty(userNameCH)){
        	result = result.like("userNameCH", userNameCH);
        }
        List<Map<String, Object>> vendorusers = vendorUserService.selectMaps(result);
        
        return new VendorUserWarpper(vendorusers).warp();
    }
    
    /**
     * 新增供应商员工
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(VendorUser vendorUser) {
		vendorUser.setSalt(AuthKit.getRandomSalt(5));
		vendorUser.setPwd(AuthKit.md5(vendorUser.getPwd(), vendorUser.getSalt()));
		vendorUser.setLeaderId(AuthKit.getUser().getAccount());
        vendorUserService.insert(vendorUser);
        return SUCCESS_TIP;
    }

    /**
     * 删除供应商员工
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer vendorUserId) {
        vendorUserService.deleteById(vendorUserId);
        return SUCCESS_TIP;
    }

    /**
     * 修改供应商员工
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(VendorUser vendorUser) {
    	if(!"******".equals(vendorUser.getPwd())){
	    	vendorUser.setSalt(AuthKit.getRandomSalt(5));
			vendorUser.setPwd(AuthKit.md5(vendorUser.getPwd(), vendorUser.getSalt()));
		}
        vendorUserService.updateById(vendorUser);
        return SUCCESS_TIP;
    }

    /**
     * 供应商员工详情
     */
    @RequestMapping(value = "/detail/{vendorUserId}")
    @ResponseBody
    public Object detail(@PathVariable("vendorUserId") Integer vendorUserId) {
        return vendorUserService.selectById(vendorUserId);
    }
}
