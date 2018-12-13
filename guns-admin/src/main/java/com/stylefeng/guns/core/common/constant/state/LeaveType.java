package com.stylefeng.guns.core.common.constant.state;

/**
 * 管理员的状态
 *
 * @author fengshuonan
 * @Date 2017年1月10日 下午9:54:13
 */
public enum LeaveType {

    TX(0, "调休"), SJ(1, "事假"), BJ(2, "病假"),NJ(3, "年假");

    int code;
    String message;

    LeaveType(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static String valueOf(Integer value) {
        if (value == null) {
            return "";
        } else {
            for (LeaveType ms : LeaveType.values()) {
                if (ms.getCode() == value) {
                    return ms.getMessage();
                }
            }
            return "";
        }
    }
}
