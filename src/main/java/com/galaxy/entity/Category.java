package com.galaxy.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @auther:IntelliJ IDEA
 * @description:
 * @author: Onisms
 * @date 2020/5/26 12:51
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category implements Serializable {

    private Integer Id;
    private String name;
}
