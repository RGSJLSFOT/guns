package com.stylefeng.guns.modular.auditRecord.service.impl;

import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.dao.SubmitRecordMapper;
import com.stylefeng.guns.modular.auditRecord.service.ISubmitRecordService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-12
 */
@Service
public class SubmitRecordServiceImpl extends ServiceImpl<SubmitRecordMapper, SubmitRecord> implements ISubmitRecordService {
	public SubmitRecord selectByTypeAndYwId(Integer type,Integer ywId){
		return this.baseMapper.selectByTypeAndYwId(type,ywId);
	};
}
