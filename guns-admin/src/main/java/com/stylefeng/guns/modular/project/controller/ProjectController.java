package com.stylefeng.guns.modular.project.controller;

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

import com.stylefeng.guns.modular.system.model.OverTime;
import com.stylefeng.guns.modular.system.model.Project;
import com.stylefeng.guns.modular.project.service.IProjectService;

/**
 * 产品项目控制器
 *
 * @author fengshuonan
 * @Date 2018-12-06 10:31:06
 */
@Controller
@RequestMapping("/project")
public class ProjectController extends BaseController {

    private String PREFIX = "/project/project/";

    @Autowired
    private IProjectService projectService;

    /**
     * 跳转到产品项目首页
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "project.html";
    }

    /**
     * 跳转到添加产品项目
     */
    @RequestMapping("/project_add")
    public String projectAdd() {
        return PREFIX + "project_add.html";
    }

    /**
     * 跳转到修改产品项目
     */
    @RequestMapping("/project_update/{projectId}")
    public String projectUpdate(@PathVariable Integer projectId, Model model) {
        Project project = projectService.selectById(projectId);
        model.addAttribute("item",project);
        LogObjectHolder.me().set(project);
        return PREFIX + "project_edit.html";
    }

    /**
     * 获取产品项目列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(String condition) {
    	EntityWrapper<Project> entityWrapper = new EntityWrapper<Project>();
    	Wrapper<Project> result = null;
    	
    	if(!ToolUtil.isEmpty(condition)){
    		result = entityWrapper.like("projectName", condition); // or like("projectKey", condition)
        }
    	
        return projectService.selectList(result);
    }

    /**
     * 新增产品项目
     */
    @RequestMapping(value = "/add")
    @ResponseBody
    public Object add(Project project) {
        projectService.insert(project);
        return SUCCESS_TIP;
    }

    /**
     * 删除产品项目
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Object delete(@RequestParam Integer projectId) {
        projectService.deleteById(projectId);
        return SUCCESS_TIP;
    }

    /**
     * 修改产品项目
     */
    @RequestMapping(value = "/update")
    @ResponseBody
    public Object update(Project project) {
        projectService.updateById(project);
        return SUCCESS_TIP;
    }

    /**
     * 产品项目详情
     */
    @RequestMapping(value = "/detail/{projectId}")
    @ResponseBody
    public Object detail(@PathVariable("projectId") Integer projectId) {
        return projectService.selectById(projectId);
    }
}
