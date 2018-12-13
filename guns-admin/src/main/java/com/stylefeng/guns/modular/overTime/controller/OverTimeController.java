package com.stylefeng.guns.modular.overTime.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.shiro.AuthKit;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.auditRecord.service.ISubmitRecordService;
import com.stylefeng.guns.modular.overTime.service.IOverTimeService;
import com.stylefeng.guns.modular.system.model.OverTime;
import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.warpper.OverTimeWrapper;
import com.stylefeng.guns.modular.vendorUser.service.IVendorUserService;

/**
 * 加班控制器
 *
 * @author fengshuonan
 * @Date 2018-12-06 10:14:31
 */
@Controller
@RequestMapping("/overTime")
public class OverTimeController extends BaseController {

    private String PREFIX = "/overTime/overTime/";

    @Autowired
    private IOverTimeService overTimeService;
    @Autowired
    private IVendorUserService vendorUserService;
    @Autowired
    private ISubmitRecordService submitRecordService;
    
    /**
     * 跳转到加班首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "overTime.html";
    }

    /**
     * 跳转到添加加班
     */
    @RequestMapping("/overTime_add")
    public String overTimeAdd() {
        return PREFIX + "overTime_add.html";
    }

    /**
     * 跳转到修改加班
     */
    @RequestMapping("/overTime_update/{overTimeId}")
    public String overTimeUpdate(@PathVariable Integer overTimeId, Model model) {
        OverTime overTime = overTimeService.selectById(overTimeId);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        model.addAttribute("startTime",sdf.format(overTime.getStartTime()));
        model.addAttribute("endTime",sdf.format(overTime.getEndTime()));
        model.addAttribute("item",overTime);
        model.addAttribute("userName", ConstantFactory.me().getUserNameById((Integer)overTime.getUserId()));
        LogObjectHolder.me().set(overTime);
        if(overTime.getSubmitStatus() == 0 || overTime.getSubmitStatus() ==3){
        	return PREFIX + "overTime_edit.html";
        }else{
        	return null;
        }
    }

    /**
     * 获取加班列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String startTime,Integer type) {
        Integer userId = AuthKit.getUser().getId();
    	List<Map<String, Object>> overTimes;
    	
    	if(AuthKit.getUser().getRoleList().contains(9)){//角色中包含本部职员
    		if(type!=null && type == 1){
    			overTimes =  overTimeService.selectOverTimesAudited(startTime,userId);
    		}else{
    			overTimes =  overTimeService.selectOverTimesToAudit(startTime,userId);
    		}	
    	}else{ 
    		EntityWrapper<OverTime> entityWrapper = new EntityWrapper<OverTime>();
        	Wrapper<OverTime> result = entityWrapper.eq("userId", userId);
        	
        	if(!ToolUtil.isEmpty(startTime)){
            	result = entityWrapper.eq("userId", userId).like("startTime", startTime);
            }
    		overTimes =  overTimeService.selectMaps(result);
    	}
    	
    	return new OverTimeWrapper(overTimes).warp();
    }

    /**
     * 新增加班
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(OverTime overTime) {
    	overTime.setUserId(AuthKit.getUser().getId());
        overTimeService.insert(overTime);
        return SUCCESS_TIP;
    }

    /**
     * 删除加班
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer overTimeId) {
        overTimeService.deleteById(overTimeId);
        return SUCCESS_TIP;
    }

    /**
     * 修改加班
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(OverTime overTime) {
        overTimeService.updateById(overTime);
        return SUCCESS_TIP;
    }
    
    /**
     * 提交/审核加班
     */
    @RequestMapping(value = "/updateStatus")
    @ResponseBody
    public int updateStatus(@RequestParam Integer status,@RequestParam Integer overTimeId) {
    	int i = overTimeService.updateSubmitStatusById(status,overTimeId);
    	//插入审核记录表
    	if(i > 0){
    		if(status == 1){
    			SubmitRecord submitRecord = new SubmitRecord();
	    		VendorUser vendorUser = vendorUserService.selectByUserNO(AuthKit.getUser().getAccount());
	    		submitRecord.setType(2);
	    		submitRecord.setYwId(overTimeId);
	    		submitRecord.setSubmitUserId(AuthKit.getUser().getId());
	    		submitRecord.setAuditUserId(vendorUser.getLeaderId());
	    		submitRecordService.insert(submitRecord);
    		}else if(status == 2 || status == 3 ){
    			SubmitRecord submitRecord = submitRecordService.selectByTypeAndYwId(2, overTimeId);
	    		submitRecord.setAuditUserId(AuthKit.getUser().getId());
	    		submitRecord.setAuditTime(new Date());
	    		submitRecord.setAuditResult(ConstantFactory.me().getSubmitStatusName(status));
	    		submitRecordService.updateById(submitRecord);
    		}
    	}
    	return i;
    }

    /**
     * 加班详情
     */
    @RequestMapping(value = "/detail/{overTimeId}")
    @ResponseBody
    public Object detail(@PathVariable("overTimeId") Integer overTimeId) {
        return overTimeService.selectById(overTimeId);
    }
}
