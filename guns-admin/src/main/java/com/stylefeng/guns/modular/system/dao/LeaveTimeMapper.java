package com.stylefeng.guns.modular.system.dao;

import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.system.model.LeaveTime;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
public interface LeaveTimeMapper extends BaseMapper<LeaveTime> {
	 List<Map<String, Object>> selectLeaveTimes(@Param("userId") String userId,@Param("leaveType") String leaveType, @Param("beginTime") String beginTime, @Param("endTime") String endTime);
	
	 public List<Map<String, Object>> selectLeaveTimesToAudit(@Param("leaveType")Integer leaveType,@Param("leaveDate")String leaveDate,@Param("userId")Integer userId);
	
	 public List<Map<String, Object>> selectLeaveTimesAudited(@Param("leaveType")Integer leaveType,@Param("leaveDate")String leaveDate,@Param("userId")Integer userId);
		
	 public int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);
}
