package com.galaxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (TaxRolePrivilege)实体类
 *
 * @author makejava
 * @since 2020-05-16 16:09:13
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RolePrivilege implements Serializable {
    private Integer roleId;
    private Integer privilegeId;

}