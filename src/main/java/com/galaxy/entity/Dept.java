package com.galaxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * (TaxDept)实体类
 *
 * @author makejava
 * @since 2020-05-16 08:34:22
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dept implements Serializable {

    private Integer id;
    
    private String name;



}