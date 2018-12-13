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
 * @since 2018-12-12
 */
@TableName("tbl_submitRecord")
public class SubmitRecord extends Model<SubmitRecord> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;
    private Integer type;
    private Integer ywId;
    private Integer submitUserId;
    private Date submitTime;
    private Integer auditUserId;
    private Date auditTime;
    private String auditResult;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getYwId() {
        return ywId;
    }

    public void setYwId(Integer ywId) {
        this.ywId = ywId;
    }

    public Integer getSubmitUserId() {
        return submitUserId;
    }

    public void setSubmitUserId(Integer submitUserId) {
        this.submitUserId = submitUserId;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public Integer getAuditUserId() {
        return auditUserId;
    }

    public void setAuditUserId(Integer auditUserId) {
        this.auditUserId = auditUserId;
    }

    public Date getAuditTime() {
        return auditTime;
    }

    public void setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }

    public String getAuditResult() {
        return auditResult;
    }

    public void setAuditResult(String auditResult) {
        this.auditResult = auditResult;
    }

    @Override
    protected Serializable pkVal() {
        return this.Id;
    }

    @Override
    public String toString() {
        return "SubmitRecord{" +
        "Id=" + Id +
        ", type=" + type +
        ", ywId=" + ywId +
        ", submitUserId=" + submitUserId +
        ", submitTime=" + submitTime +
        ", auditUserId=" + auditUserId +
        ", auditTime=" + auditTime +
        ", auditResult=" + auditResult +
        "}";
    }
}
