package com.stylefeng.guns.modular.vendorUser.service;
 
import com.baomidou.mybatisplus.mapper.SqlRunner;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 获取数据库所有的项目
 *
 * @author guangsen
 * @date 2018-12-07-下午1:37
 */
@Service
public class ProjService {

    /**
     * 获取所有项目的信息
     */
    public List<Map<String, Object>> getAllProjects() {
        String sql = "select Id,projectKey,projectName,responsiblePersion from tbl_project  ";
        return SqlRunner.db().selectList(sql);
    }
    
    /**
     * 获取所有供应商的信息
     */
    public List<Map<String, Object>> getAllVendors() {
    	String sql = "select Id,vendorNameCh,vendorNameEn from tbl_vendors  ";
    	return SqlRunner.db().selectList(sql);
    }
}