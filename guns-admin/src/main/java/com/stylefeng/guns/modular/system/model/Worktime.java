package com.stylefeng.guns.modular.system.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
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
@TableName("tbl_worktime")
public class Worktime extends Model<Worktime> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;
    private String userId;
    private String week;
    private Date workDate;
    private Date startTime;
    private Date endTime;
    private BigDecimal workTime;
    private BigDecimal overTime;
    private String content;
    private Date createTime;
    private Date updateTime;
    private Integer submitStatus = 0;


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

    public String getWeek() {
        return week;
    }

    public void setWeek(String week) {
        this.week = week;
    }

    public Date getWorkDate() {
        return workDate;
    }

    public void setWorkDate(Date workDate) {
        this.workDate = workDate;
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

    public BigDecimal getWorkTime() {
        return workTime;
    }

    public void setWorkTime(BigDecimal workTime) {
        this.workTime = workTime;
    }

    public BigDecimal getOverTime() {
        return overTime;
    }

    public void setOverTime(BigDecimal overTime) {
        this.overTime = overTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
        return "Worktime{" +
        "Id=" + Id +
        ", userId=" + userId +
        ", week=" + week +
        ", workDate=" + workDate +
        ", startTime=" + startTime +
        ", endTime=" + endTime +
        ", workTime=" + workTime +
        ", overTime=" + overTime +
        ", content=" + content +
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
}
