package com.galaxy.entity;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * (TaxAccount)实体类
 *
 * @author makejava
 * @since 2020-05-16 08:34:22
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Account implements Serializable {

    @ExcelProperty(value = "编号")
    private Integer id;
    @ExcelProperty(value = "姓名")
    private String name;
    @ExcelProperty(value = "密码")
    private String password;
    @ExcelProperty(value = "部门")
    private Integer deptId;
    @ExcelProperty(value = "角色")
    private Integer roleId;
    @ExcelProperty(value = "性别")
    private Integer gender;
    @ExcelProperty(value = "邮箱")
    private String email;
    @ExcelProperty(value = "编号")
    private String mobile;
    @ExcelProperty(value = "注册日期")
    private Date birthday;
    @ExcelProperty(value = "状态")
    private String state;
    @ExcelProperty(value = "备注")
    private String remark;
    @ExcelProperty(value = "图片")
    private String headImg;

    @TableField(exist = false)
    private String deptName;
    @TableField(exist = false)
    private String roleName;
}