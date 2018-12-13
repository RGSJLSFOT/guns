package com.stylefeng.guns.modular.system.dao;

import com.stylefeng.guns.modular.system.model.VendorUser;

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
public interface VendorUserMapper extends BaseMapper<VendorUser> {
	VendorUser selectByUserNO(@Param("userNO")String userNO);
}
