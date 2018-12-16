package com.stylefeng.guns.modular.system.dao;

import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.system.model.Worktime;

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
public interface WorktimeMapper extends BaseMapper<Worktime> {
	public List<Map<String, Object>> selectWorkTimesToAudit(@Param("content") String content,@Param("workDate") String workDate, @Param("userId")String userId);
	
	public List<Map<String, Object>> selectWorkTimesAudited(@Param("content") String content,@Param("workDate") String workDate, @Param("userId")String userId);
	
	public int updateSubmitStatusById(@Param("submitStatus") Integer submitStatus,@Param("Id") Integer Id);
}
