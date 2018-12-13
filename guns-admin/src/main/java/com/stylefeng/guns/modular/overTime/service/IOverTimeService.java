package com.stylefeng.guns.modular.overTime.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.service.IService;
import com.stylefeng.guns.modular.system.model.OverTime;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
public interface IOverTimeService extends IService<OverTime> {
	List<Map<String, Object>> selectOverTimesToAudit(@Param("startTime") String startTime,@Param("userId") Integer userId);
	
	List<Map<String, Object>> selectOverTimesAudited(@Param("startTime") String startTime,@Param("userId") Integer userId);
	
	int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);
}
