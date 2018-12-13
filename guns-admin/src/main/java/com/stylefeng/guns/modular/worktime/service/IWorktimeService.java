package com.stylefeng.guns.modular.worktime.service;

import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.system.model.Worktime;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-05
 */
public interface IWorktimeService extends IService<Worktime> {
	List<Map<String, Object>> selectWorkTimesToAudit(@Param("content") String content,@Param("workDate") String workDate,@Param("userId") Integer userId);
	
    List<Map<String, Object>> selectWorkTimesAudited(@Param("content") String content,@Param("workDate") String workDate,@Param("userId") Integer userId);
	
    int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);
}
