package com.galaxy.entity;

import com.baomidou.mybatisplus.annotations.TableField;
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
public class Info implements Serializable {

    private Integer Id;
    private Integer categoryId;
    private String refer;
    private String name;
    private String content;
    private String remark;
    private Integer accountId;
    private Date createTime;
    private String state;

    @TableField(exist = false)
    private String categoryName;
    @TableField(exist = false)
    private String accountName;
}
