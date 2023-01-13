package entity;

import java.util.Date;
import java.io.Serializable;

/**
 * 平安工单激活反馈参数(DFeedbackParam)实体类
 *
 * @author makejava
 * @since 2022-12-23 14:09:07
 */
public class DFeedbackParam implements Serializable {
    private static final long serialVersionUID = 498130703513151231L;
    /**
     * id
     */
    private Integer id;
    /**
     * 工单ID
     */
    private Integer orderId;
    /**
     * 工单申请编号
     */
    private String sqbh;
    /**
     * 车架号
     */
    private String vin;
    /**
     * 实际按照地址
     */
    private String actualInstallAddress;
    /**
     * 实际安装人
     */
    private String actualInstallName;
    /**
     * 创建时间
     */
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getSqbh() {
        return sqbh;
    }

    public void setSqbh(String sqbh) {
        this.sqbh = sqbh;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public String getActualInstallAddress() {
        return actualInstallAddress;
    }

    public void setActualInstallAddress(String actualInstallAddress) {
        this.actualInstallAddress = actualInstallAddress;
    }

    public String getActualInstallName() {
        return actualInstallName;
    }

    public void setActualInstallName(String actualInstallName) {
        this.actualInstallName = actualInstallName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

