package com.stylefeng.guns.modular.system.warpper;

import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;
import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;

import java.util.List;
import java.util.Map;

/**
 * 用户管理的包装类
 *
 * @author fengshuonan
 * @date 2017年2月13日 下午10:47:03
 */
public class VendorUserWarpper extends BaseControllerWarpper {

    public VendorUserWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
    	map.put("genderName", ConstantFactory.me().getSexName((Integer) map.get("gender")));
    	map.put("leaderName", ConstantFactory.me().getUserNameByAccount(map.get("leaderId").toString()));
    	map.put("roleName", ConstantFactory.me().getRoleName(map.get("roleId").toString()));
    	map.put("vendorName", ConstantFactory.me().getVendorNameById((Integer)map.get("vendorId")));
    	map.put("projectName", ConstantFactory.me().getProjectNameById((Integer)map.get("projectId")));
    	map.put("hiringStatusName", ConstantFactory.me().getVendorUserStatusName((Integer) map.get("hiringStatus")));
    	map.put("positionName", ConstantFactory.me().getVendorUserPositionName((Integer)map.get("positionId")));
    	map.put("professionalLevelName", ConstantFactory.me().getProfessionalLevelName(map.get("professionalLevel").toString()));
    }
}
