package com.galaxy.entity;

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

    private Integer id;
    private String name;
    private String password;
    private Integer deptId;
    private Integer roleId;
    private Integer gender;
    private String email;
    private String mobile;
    private Date birthday;
    private String state;
    private String remark;
    private String headImg;


}