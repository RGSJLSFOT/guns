package com.stylefeng.guns.modular.vendorUser.service.impl;

import com.stylefeng.guns.modular.system.model.VendorUser;
import com.stylefeng.guns.modular.system.dao.VendorUserMapper;
import com.stylefeng.guns.modular.vendorUser.service.IVendorUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
public class VendorUserServiceImpl extends ServiceImpl<VendorUserMapper, VendorUser> implements IVendorUserService {
	public VendorUser selectByUserNO(String userNO){
		return this.baseMapper.selectByUserNO(userNO);
	};
}
