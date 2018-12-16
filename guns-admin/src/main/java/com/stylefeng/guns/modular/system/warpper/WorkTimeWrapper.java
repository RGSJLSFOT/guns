package com.stylefeng.guns.modular.system.warpper;

import java.util.List;
import java.util.Map;

import com.stylefeng.guns.core.base.warpper.BaseControllerWarpper;
import com.stylefeng.guns.core.common.constant.factory.ConstantFactory;

public class WorkTimeWrapper extends BaseControllerWarpper {

    public WorkTimeWrapper(List<Map<String, Object>> list) {
        super(list);
    }

    @Override
    public void warpTheMap(Map<String, Object> map) {
    	map.put("submitStatusName", ConstantFactory.me().getSubmitStatusName((Integer) map.get("submitStatus")));
    	//map.put("userName", ConstantFactory.me().getUserNameById((Integer)map.get("userId")));
    	map.put("userName", map.get("userId"));
    	map.put("workDateStr", map.get("workDate").toString());
    }
}