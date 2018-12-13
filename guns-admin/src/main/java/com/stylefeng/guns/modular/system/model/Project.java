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
@TableName("tbl_project")
public class Project extends Model<Project> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "Id", type = IdType.AUTO)
    private Integer Id;
    private String projectName;
    private String projectKey;
    private String responsiblePersion;
    private Integer parentId;
    private String description;
    private Date createTime;
    private Date updateTime;


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectKey() {
        return projectKey;
    }

    public void setProjectKey(String projectKey) {
        this.projectKey = projectKey;
    }

    public String getResponsiblePersion() {
        return responsiblePersion;
    }

    public void setResponsiblePersion(String responsiblePersion) {
        this.responsiblePersion = responsiblePersion;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
        return "Project{" +
        "Id=" + Id +
        ", projectName=" + projectName +
        ", projectKey=" + projectKey +
        ", responsiblePersion=" + responsiblePersion +
        ", parentId=" + parentId +
        ", description=" + description +
        ", createTime=" + createTime +
        ", updateTime=" + updateTime +
        "}";
    }
}
