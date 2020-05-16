package com.galaxy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("taxService")
public class TaxServiceController {

    /*纳税服务*/
    @GetMapping("frame")
    public String frame(){
        return "tax/frame";
    }
    /*纳税服务*/
    @GetMapping("left")
    public String left(){
        return "tax/left";
    }
    /*纳税服务*/
    @GetMapping("top")
    public String top(){
        return "tax/top";
    }

}
