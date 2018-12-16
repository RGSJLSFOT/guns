package com.stylefeng.guns.modular.system.model;

import java.util.Date;
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
@TableName("tbl_vendorUser")
public class VendorUser extends Model<VendorUser> {

    private static final long serialVersionUID = 1L;

    private Integer Id;
    private String userNO;
    private String pwd;
    private String userNameCh;
    private String userNameEn;
    private Integer gender;
    private String leaderId;
    private String professionalLevel;
    private String email;
    private String phone;
    private Integer roleId;
    private Integer vendorId;
    private Integer projectId;
    private Integer hiringStatus;
    private Integer positionId;
    private Date entryTime;
    private String photo;
    private Date createTime;
    private Date uptdaeTime;
    private String salt;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getUserNO() {
        return userNO;
    }

    public void setUserNO(String userNO) {
        this.userNO = userNO;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getUserNameCh() {
        return userNameCh;
    }

    public void setUserNameCh(String userNameCh) {
        this.userNameCh = userNameCh;
    }

    public String getUserNameEn() {
        return userNameEn;
    }

    public void setUserNameEn(String userNameEn) {
        this.userNameEn = userNameEn;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getLeaderId() {
        return leaderId;
    }

    public void setLeaderId(String leaderId) {
        this.leaderId = leaderId;
    }

    public String getProfessionalLevel() {
        return professionalLevel;
    }

    public void setProfessionalLevel(String professionalLevel) {
        this.professionalLevel = professionalLevel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Integer getVendorId() {
        return vendorId;
    }

    public void setVendorId(Integer vendorId) {
        this.vendorId = vendorId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getHiringStatus() {
        return hiringStatus;
    }

    public void setHiringStatus(Integer hiringStatus) {
        this.hiringStatus = hiringStatus;
    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Date getEntryTime() {
        return entryTime;
    }

    public void setEntryTime(Date entryTime) {
        this.entryTime = entryTime;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUptdaeTime() {
        return uptdaeTime;
    }

    public void setUptdaeTime(Date uptdaeTime) {
        this.uptdaeTime = uptdaeTime;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }

    @Override
    public String toString() {
        return "VendorUser{" +
        "Id=" + Id +
        ", userNO=" + userNO +
        ", pwd=" + pwd +
        ", userNameCh=" + userNameCh +
        ", userNameEn=" + userNameEn +
        ", gender=" + gender +
        ", leaderId=" + leaderId +
        ", professionalLevel=" + professionalLevel +
        ", email=" + email +
        ", phone=" + phone +
        ", roleId=" + roleId +
        ", vendorId=" + vendorId +
        ", projectId=" + projectId +
        ", hiringStatus=" + hiringStatus +
        ", positionId=" + positionId +
        ", entryTime=" + entryTime +
        ", photo=" + photo +
        ", createTime=" + createTime +
        ", uptdaeTime=" + uptdaeTime +
        "}";
    }

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}
}
