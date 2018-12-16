package com.stylefeng.guns.modular.worktime.service.impl;

import com.stylefeng.guns.modular.system.model.Worktime;
import com.stylefeng.guns.core.datascope.DataScope;
import com.stylefeng.guns.modular.system.dao.WorktimeMapper;
import com.stylefeng.guns.modular.worktime.service.IWorktimeService;
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
 * @author stylefeng
 * @since 2018-12-05
 */
@Service
public class WorktimeServiceImpl extends ServiceImpl<WorktimeMapper, Worktime> implements IWorktimeService {
	public List<Map<String, Object>> selectWorkTimesToAudit(String content,String workDate, String userId) {
        return this.baseMapper.selectWorkTimesToAudit(content, workDate, userId);
    }
	public List<Map<String, Object>> selectWorkTimesAudited(String content,String workDate,String userId){
		return this.baseMapper.selectWorkTimesAudited(content, workDate, userId);
	};
	public int updateSubmitStatusById(Integer submitStatus,Integer Id){
		 return this.baseMapper.updateSubmitStatusById(submitStatus,Id);
	};
}
