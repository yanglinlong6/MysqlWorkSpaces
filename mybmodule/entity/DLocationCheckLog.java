package entity;

import java.util.Date;
import java.io.Serializable;

/**
 * 设备定位验证日志表(DLocationCheckLog)实体类
 *
 * @author makejava
 * @since 2022-12-23 11:16:34
 */
public class DLocationCheckLog implements Serializable {
    private static final long serialVersionUID = 330238196240758948L;
    /**
     * id
     */
    private Integer id;
    /**
     * 设备号
     */
    private String sn;
    /**
     * 设备定位备注
     */
    private String remark;
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

    public String getSn() {
        return sn;
    }

    public void setSn(String sn) {
        this.sn = sn;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}

