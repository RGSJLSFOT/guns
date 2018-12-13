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
 * @author stylefeng
 * @since 2018-12-05
 */
@TableName("tbl_vendors")
public class Vendors extends Model<Vendors> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;
    private String vendorNameCh;
    private String vendorNameEn;
    private String address;
    private String phone;
    private String Email;
    private String responsiblePerson;
    private Date createTime;
    private Date updateTime;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getVendorNameCh() {
        return vendorNameCh;
    }

    public void setVendorNameCh(String vendorNameCh) {
        this.vendorNameCh = vendorNameCh;
    }

    public String getVendorNameEn() {
        return vendorNameEn;
    }

    public void setVendorNameEn(String vendorNameEn) {
        this.vendorNameEn = vendorNameEn;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getResponsiblePerson() {
        return responsiblePerson;
    }

    public void setResponsiblePerson(String responsiblePerson) {
        this.responsiblePerson = responsiblePerson;
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
        return "Vendors{" +
        "Id=" + Id +
        ", vendorNameCh=" + vendorNameCh +
        ", vendorNameEn=" + vendorNameEn +
        ", address=" + address +
        ", phone=" + phone +
        ", Email=" + Email +
        ", responsiblePerson=" + responsiblePerson +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
