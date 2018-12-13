package com.stylefeng.guns.modular.system.dao;

import com.stylefeng.guns.modular.system.model.SubmitRecord;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author guangsen
 * @since 2018-12-12
 */
public interface SubmitRecordMapper extends BaseMapper<SubmitRecord> {
	SubmitRecord selectByTypeAndYwId(@Param("type") Integer type,@Param("ywId") Integer ywId);
}
