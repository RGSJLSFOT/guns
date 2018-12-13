package com.stylefeng.guns.modular.leaveTime.service.impl;

import com.stylefeng.guns.modular.system.model.LeaveTime;
import com.stylefeng.guns.modular.system.dao.LeaveTimeMapper;
import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.leaveTime.service.ILeaveTimeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
@Service
public class LeaveTimeServiceImpl extends ServiceImpl<LeaveTimeMapper, LeaveTime> implements ILeaveTimeService {
	public List<Map<String, Object>> selectLeaveTimes(@Param("userId") String userId,@Param("leaveType") String leaveType, @Param("beginTime") String beginTime, @Param("endTime") String endTime){
    	return this.baseMapper.selectLeaveTimes(userId,leaveType, beginTime,endTime);
    }
	
	public List<Map<String, Object>> selectLeaveTimesToAudit(Integer leaveType,String leaveDate,Integer userId) {
        return this.baseMapper.selectLeaveTimesToAudit(leaveType,leaveDate,userId);
    }
	
	public List<Map<String, Object>> selectLeaveTimesAudited(Integer leaveType,String leaveDate,Integer userId) {
		return this.baseMapper.selectLeaveTimesAudited(leaveType,leaveDate,userId);
	}
	
	public int updateSubmitStatusById(Integer submitStatus,Integer Id){
		 return this.baseMapper.updateSubmitStatusById(submitStatus,Id);
	};
}
