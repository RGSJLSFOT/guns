package com.stylefeng.guns.modular.leaveTime.service;

import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.system.model.LeaveTime;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
public interface ILeaveTimeService extends IService<LeaveTime> {
	/**
     * 根据条件查询请假列表
     */
    List<Map<String, Object>> selectLeaveTimes(@Param("userId") String userId,@Param("leaveType") String leaveType, @Param("beginTime") String beginTime, @Param("endTime") String endTime);
    
    List<Map<String, Object>> selectLeaveTimesToAudit(@Param("leaveType")Integer leaveType,@Param("leaveDate")String leaveDate,@Param("userId") Integer userId);

    List<Map<String, Object>> selectLeaveTimesAudited(@Param("leaveType")Integer leaveType,@Param("leaveDate")String leaveDate,@Param("userId") Integer userId);
	
	int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);

}
