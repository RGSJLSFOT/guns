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
public class LeaveTimeWarpper extends BaseControllerWarpper {

    public LeaveTimeWarpper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
        map.put("leaveTypeName", ConstantFactory.me().getLeaveTypeName((Integer) map.get("leaveType")));
        map.put("submitStatusName", ConstantFactory.me().getSubmitStatusName((Integer) map.get("submitStatus")));
        map.put("userName", ConstantFactory.me().getUserNameById((Integer)map.get("userId")));
    }

}
