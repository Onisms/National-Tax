package com.galaxy.web.controller;

import com.galaxy.entity.Account;
import com.galaxy.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("account")
public class AccountController {
    @Resource
    private AccountService accountService;

    /*登录页面*/
    @GetMapping("loginPage")
    public String loginPage(){
        return "loginPage";
    }
    /*登录功能*/
    @PostMapping("login")
    public String login(Account account){
        System.out.println("登录成功");
        return "home/home";
    }









}
