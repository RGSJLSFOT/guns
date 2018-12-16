package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author guangsen
 * @since 2018-12-06
 */
@TableName("tbl_overTime")
public class OverTime extends Model<OverTime> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;
    private String userId;
    private Date startTime;
    private Date endTime;
    private Date createTime;
    private Date updateTime;
    private Integer submitStatus = 0;
    private Integer overTimeHour = 0;

    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.Id;
    }

    @Override
    public String toString() {
        return "OverTime{" +
        "Id=" + Id +
        ", userId=" + userId +
        ", startTime=" + startTime +
        ", endTime=" + endTime +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        ", submitStatus=" + submitStatus +
        "}";
    }

	public Integer getSubmitStatus() {
		return submitStatus;
	}

	public void setSubmitStatus(Integer submitStatus) {
		this.submitStatus = submitStatus;
	}

	public Integer getOverTimeHour() {
		return overTimeHour;
	}

	public void setOverTimeHour(Integer overTimeHour) {
		this.overTimeHour = overTimeHour;
	}
}
