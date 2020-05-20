package com.galaxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (TaxPrivilege)实体类
 *
 * @author makejava
 * @since 2020-05-16 11:37:11
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Privilege implements Serializable {

    private Integer id;
    private String name;
    private String code;

}