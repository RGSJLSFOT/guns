package com.stylefeng.guns.modular.system.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.stylefeng.guns.modular.system.model.OverTime;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
public interface OverTimeMapper extends BaseMapper<OverTime> {

	public List<Map<String, Object>> selectOverTimesToAudit(@Param("startTime") String startTime, @Param("userId")Integer userId);
	
	public List<Map<String, Object>> selectOverTimesAudited(@Param("startTime") String startTime, @Param("userId")Integer userId);
	
	public int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);
}
