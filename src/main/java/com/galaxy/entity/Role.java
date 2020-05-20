package com.galaxy.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * (TaxRole)实体类
 *
 * @author makejava
 * @since 2020-05-16 11:37:11
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
//@TableName(resultMap = "map")
public class Role implements Serializable {

    private Integer id;
    /**
    * 姓名
    */
    private String name;
    /**
    * 状态
    */
    private String state;

    @TableField(exist = false)
    private List<Privilege> privilegeList;


}