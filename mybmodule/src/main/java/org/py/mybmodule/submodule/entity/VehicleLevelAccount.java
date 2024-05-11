package org.py.mybmodule.submodule.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 车辆账号对应层级表
 * </p>
 *
 * @author author
 * @since 2022-11-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value="VehicleLevelAccount对象", description="车辆账号对应层级表")
public class VehicleLevelAccount implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "车架号")
    private String vin;

    @ApiModelProperty(value = "账号名称")
    private String account;

    @ApiModelProperty(value = "用户id")
    private Integer userId;

    @ApiModelProperty(value = "账号名称")
    private String saccount;

    @ApiModelProperty(value = "二级用户id")
    private Integer suserId;


}
