package com.stylefeng.guns.modular.worktime.controller;

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
import com.stylefeng.guns.core.util.DateUtils;
import com.stylefeng.guns.core.util.ToolUtil;
import com.stylefeng.guns.modular.auditRecord.service.ISubmitRecordService;
import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.model.Worktime;
import com.stylefeng.guns.modular.system.warpper.WorkTimeWrapper;
import com.stylefeng.guns.modular.vendorUser.service.IVendorUserService;
import com.stylefeng.guns.modular.worktime.service.IWorktimeService;

/**
 * 工时控制器
 *
 * @author fengshuonan
 * @Date 2018-12-05 17:42:25
 */
@Controller
@RequestMapping("/worktime")
public class WorktimeController extends BaseController {

    private String PREFIX = "/worktime/worktime/";

    @Autowired
    private IWorktimeService worktimeService;
    @Autowired
    private IVendorUserService vendorUserService;
    @Autowired
    private ISubmitRecordService submitRecordService;
    /**
     * 跳转到工时首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "worktime.html";
    }

    /**
     * 跳转到添加工时
     */
    @RequestMapping("/worktime_add")
    public String worktimeAdd() {
        return PREFIX + "worktime_add.html";
    }

    /**
     * 跳转到修改工时
     */
    @RequestMapping("/worktime_update/{worktimeId}")
    public String worktimeUpdate(@PathVariable Integer worktimeId, Model model) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Worktime worktime = worktimeService.selectById(worktimeId);
        model.addAttribute("item",worktime);
        model.addAttribute("startTime",sdf.format(worktime.getStartTime()).split(" ")[1]);
        model.addAttribute("endTime",sdf.format(worktime.getEndTime()).split(" ")[1]);
        model.addAttribute("userName", ConstantFactory.me().getUserNameById((Integer)worktime.getUserId()));
        LogObjectHolder.me().set(worktime);
        return PREFIX + "worktime_edit.html";
    }

    /**
     * 获取工时列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String content,String workDate,Integer type,Model model) {
    	Integer userId = AuthKit.getUser().getId();
    	
    	//如果是沃尔玛员工则显示下面供应商员工提交的单据
    	
    	List<Map<String, Object>> Worktimes;
    	
    	if(AuthKit.getUser().getRoleList().contains(9)){//角色中包含本部职员
    		if(type!=null && type == 1){
    			Worktimes =  worktimeService.selectWorkTimesAudited(content,workDate,userId);
    		}else{
    			Worktimes =  worktimeService.selectWorkTimesToAudit(content,workDate,userId);
    		}
    	}else{ 
    		EntityWrapper<Worktime> entityWrapper = new EntityWrapper<Worktime>();
        	Wrapper<Worktime> result = entityWrapper.eq("userId", userId);
        	if(!ToolUtil.isEmpty(content)){
        		result = result.like("content", content);
            }
        	if(!ToolUtil.isEmpty(workDate)){
            	result = result.eq("workDate", workDate);
            }
    		Worktimes = worktimeService.selectMaps(result);
    	}
    	return new WorkTimeWrapper(Worktimes).warp();
    }

    /**
     * 新增工时
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Worktime worktime) {
    	worktime.setWeek(DateUtils.getWeekOfDate( worktime.getWorkDate()));
    	worktime.setUserId(AuthKit.getUser().getId());
        worktimeService.insert(worktime);
        return SUCCESS_TIP;
    }

    /**
     * 删除工时
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer worktimeId) {
        worktimeService.deleteById(worktimeId);
        return SUCCESS_TIP;
    }

    /**
     * 修改工时
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Worktime worktime) {
    	worktime.setWeek(DateUtils.getWeekOfDate(worktime.getWorkDate()));
        worktimeService.updateById(worktime);
        return SUCCESS_TIP;
    }
    
    /**
     * 提交/审核加班
     */
    @RequestMapping(value = "/updateStatus")
    @ResponseBody
    public int updateStatus(@RequestParam Integer status,@RequestParam Integer workTimeId) {
    	int i = worktimeService.updateSubmitStatusById(status,workTimeId);
    	
    	//插入审核记录表
    	if(i > 0){
    		if(status == 1){
    			SubmitRecord submitRecord = new SubmitRecord();
	    		VendorUser vendorUser = vendorUserService.selectByUserNO(AuthKit.getUser().getAccount());
	    		submitRecord.setType(1);
	    		submitRecord.setYwId(workTimeId);
	    		submitRecord.setSubmitUserId(AuthKit.getUser().getId());
	    		submitRecord.setAuditUserId(vendorUser.getLeaderId());
	    		submitRecordService.insert(submitRecord);
    		}else if(status == 2 || status == 3 ){
    			SubmitRecord submitRecord = submitRecordService.selectByTypeAndYwId(1, workTimeId);
	    		submitRecord.setAuditUserId(AuthKit.getUser().getId());
	    		submitRecord.setAuditTime(new Date());
	    		submitRecord.setAuditResult(ConstantFactory.me().getSubmitStatusName(status));
	    		submitRecordService.updateById(submitRecord);
    		}
    	}
    	return i;
    }

    /**
     * 工时详情
     */
    @RequestMapping(value = "/detail/{worktimeId}")
    @ResponseBody
    public Object detail(@PathVariable("worktimeId") Integer worktimeId) {
        return worktimeService.selectById(worktimeId);
    }
}
