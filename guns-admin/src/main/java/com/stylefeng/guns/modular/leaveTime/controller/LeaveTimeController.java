package com.stylefeng.guns.modular.leaveTime.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.stylefeng.guns.core.base.controller.BaseController;
import com.stylefeng.guns.core.common.annotion.Permission;
import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.datascope.DataScope;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import com.stylefeng.guns.core.log.LogObjectHolder;
import com.stylefeng.guns.core.shiro.AuthKit;
import com.stylefeng.guns.core.util.ToolUtil;

import org.springframework.web.bind.annotation.RequestParam;
import com.stylefeng.guns.modular.system.model.LeaveTime;
import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.model.Worktime;
import com.stylefeng.guns.modular.system.warpper.LeaveTimeWarpper;
import com.stylefeng.guns.modular.system.warpper.UserWarpper;
import com.stylefeng.guns.modular.vendorUser.service.IVendorUserService;
import com.stylefeng.guns.modular.auditRecord.service.ISubmitRecordService;
import com.stylefeng.guns.modular.leaveTime.service.ILeaveTimeService;

/**
 * 请假控制器
 *
 * @author fengshuonan
 * @Date 2018-12-06 10:20:51
 */
@Controller
@RequestMapping("/leaveTime")
public class LeaveTimeController extends BaseController {

    private String PREFIX = "/leaveTime/leaveTime/";

    @Autowired
    private ILeaveTimeService leaveTimeService;
    @Autowired
    private IVendorUserService vendorUserService;
    @Autowired
    private ISubmitRecordService submitRecordService;
    /**
     * 跳转到请假首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "leaveTime.html";
    }

    /**
     * 跳转到添加请假
     */
    @RequestMapping("/leaveTime_add")
    public String leaveTimeAdd(Model model) {
    	model.addAttribute("userName", ConstantFactory.me().getUserNameById((Integer)AuthKit.getUser().getId()));
        return PREFIX + "leaveTime_add.html";
    }

    /**
     * 跳转到修改请假
     */
    @RequestMapping("/leaveTime_update/{Id}")
    public String leaveTimeUpdate(@PathVariable Integer Id, Model model) {
        LeaveTime leaveTime = leaveTimeService.selectById(Id);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        model.addAttribute("startTime",sdf.format(leaveTime.getStartTime()));
        model.addAttribute("endTime",sdf.format(leaveTime.getEndTime()));
        model.addAttribute("item",leaveTime);
        model.addAttribute("userName",leaveTime.getUserId());
        LogObjectHolder.me().set(leaveTime);
        return PREFIX + "leaveTime_edit.html";
    }

    /**
     * 查询请假信息列表
     */
    @RequestMapping("/list")
    @ResponseBody
    public Object list(Integer leaveType,String leaveDate, Integer type) {
        //Integer userId = AuthKit.getUser().getId();
        String userId = AuthKit.getUser().getAccount();
        List<Map<String, Object>> leaveimes;
    	if(AuthKit.getUser().getRoleList().contains(9)){//角色中包含本部职员
    		if(type!=null && type == 1){
    			leaveimes =  leaveTimeService.selectLeaveTimesAudited(leaveType,leaveDate,userId);
    		}else{
    			leaveimes =  leaveTimeService.selectLeaveTimesToAudit(leaveType,leaveDate,userId);
    		}
    	}else{ 
    		EntityWrapper<LeaveTime> entityWrapper = new EntityWrapper<LeaveTime>();
        	Wrapper<LeaveTime> result = entityWrapper.eq("userId", userId);;
        	if(!ToolUtil.isEmpty(leaveType)){
            	result = result.eq("leaveType", leaveType);
            }
        	if(!ToolUtil.isEmpty(leaveDate)){
            	result = result.like("startTime", leaveDate);
            }
    		leaveimes =  leaveTimeService.selectMaps(result);
    	}
    	
        return new LeaveTimeWarpper(leaveimes).warp();
    }
    
    /**
     * 新增请假
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(LeaveTime leaveTime) {
    	leaveTime.setUserId(AuthKit.getUser().getAccount());
        leaveTimeService.insert(leaveTime);
        return SUCCESS_TIP;
    }

    /**
     * 删除请假
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer leaveTimeId) {
        leaveTimeService.deleteById(leaveTimeId);
        return SUCCESS_TIP;
    }

    /**
     * 修改请假
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(LeaveTime leaveTime) {
        leaveTimeService.updateById(leaveTime);
        return SUCCESS_TIP;
    }
    
    /**
     * 提交/审核请假
     */
    @RequestMapping(value = "/updateStatus")
    @ResponseBody
    public int updateStatus(@RequestParam Integer status,@RequestParam Integer leaveTimeId) {
    	
    	
    	int i = leaveTimeService.updateSubmitStatusById(status,leaveTimeId);
    	//插入审核记录表
    	if(i > 0){
    		if(status == 1){
    			SubmitRecord submitRecord = new SubmitRecord();
	    		VendorUser vendorUser = vendorUserService.selectByUserNO(AuthKit.getUser().getAccount());
	    		submitRecord.setType(3);
	    		submitRecord.setYwId(leaveTimeId);
	    		submitRecord.setSubmitUserId(AuthKit.getUser().getAccount());
	    		submitRecord.setAuditUserId(vendorUser.getLeaderId());
	    		submitRecordService.insert(submitRecord);
    		}else if(status == 2 || status == 3 ){
    			SubmitRecord submitRecord = submitRecordService.selectByTypeAndYwId(3, leaveTimeId);
	    		submitRecord.setAuditUserId(AuthKit.getUser().getAccount());
	    		submitRecord.setAuditTime(new Date());
	    		submitRecord.setAuditResult(ConstantFactory.me().getSubmitStatusName(status));
	    		submitRecordService.updateById(submitRecord);
    		}
    	}
    	return i;
    }
    /**
     * 请假详情
     */
    @RequestMapping(value = "/detail/{Id}")
    @ResponseBody
    public Object detail(@PathVariable("Id") Integer Id) {
        return leaveTimeService.selectById(Id);
    }
}
