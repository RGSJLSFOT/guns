package com.stylefeng.guns.modular.auditRecord.service;

import com.stylefeng.guns.modular.system.model.SubmitRecord;
import com.stylefeng.guns.modular.system.model.VendorUser;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author guangsen
 * @since 2018-12-12
 */
public interface ISubmitRecordService extends IService<SubmitRecord> {
	SubmitRecord selectByTypeAndYwId(@Param("type")Integer type,@Param("ywId") Integer ywId);
}
