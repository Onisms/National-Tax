package com.galaxy.web.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;

@Controller
@PropertySource("classpath:db.properties")
public class BaseController {

    @Value("${mybatis.pageSize}")
    int pageSize;
}
