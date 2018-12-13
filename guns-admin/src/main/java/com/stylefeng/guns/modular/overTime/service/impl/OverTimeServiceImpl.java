package com.stylefeng.guns.modular.overTime.service.impl;

import com.stylefeng.guns.modular.system.model.OverTime;
import com.stylefeng.guns.modular.system.dao.OverTimeMapper;
import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.overTime.service.IOverTimeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
@Service
public class OverTimeServiceImpl extends ServiceImpl<OverTimeMapper, OverTime> implements IOverTimeService {
	public List<Map<String, Object>> selectOverTimesToAudit(String startTime, Integer userId) {
        return this.baseMapper.selectOverTimesToAudit(startTime, userId);
    }
	public List<Map<String, Object>> selectOverTimesAudited(String startTime, Integer userId) {
		return this.baseMapper.selectOverTimesAudited(startTime, userId);
	}
	
	public int updateSubmitStatusById(Integer submitStatus,Integer Id){
		 return this.baseMapper.updateSubmitStatusById(submitStatus,Id);
	};
}
