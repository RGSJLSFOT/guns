package com.stylefeng.guns.modular.vendorUser.service;

import com.stylefeng.guns.modular.system.model.VendorUser;

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
public interface IVendorUserService extends IService<VendorUser> {
	VendorUser selectByUserNO(@Param("userNO")String userNO);
}
