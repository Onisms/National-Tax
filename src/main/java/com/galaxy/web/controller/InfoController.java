package com.galaxy.web.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.write.builder.ExcelWriterBuilder;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.galaxy.entity.*;
import com.galaxy.service.*;
import com.galaxy.web.Listener.AccountExcelListener;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("info")
@Slf4j
public class InfoController extends BaseController {

    @Resource
    private InfoService infoService;

    @Resource
    private CategoryService categoryService;

    @Resource
    private  AccountService accountService;

    @GetMapping("list")
    public String list(Model model, Integer current, Info info) {
        Wrapper<Info> wrapper = null;
        if (info.getName() != null){
            wrapper = new EntityWrapper<Info>().like("name", info.getName());
        }
        Page<Info> mapPage = infoService.selectPage(new Page<Info>(current, pageSize), wrapper);
        List<Info> infoList = mapPage.getRecords();
        for (Info infoDB : infoList) {
            Category category = categoryService.selectById(infoDB.getCategoryId());
            Account account = accountService.selectById(infoDB.getAccountId());
            infoDB.setCategoryName(category.getName());
            infoDB.setAccountName(account.getName());
        }
        model.addAttribute("mapPage", mapPage);
        return "info/list";
    }

    @GetMapping("insertPage")
    public String insertPage(Model model) {
        //查询所有信息分类
        List<Category> categoryList = categoryService.selectList(null);
        model.addAttribute("categoryList", categoryList);

        return "info/insert";
    }

    @PostMapping("insert")
    public String insert(Model model, Info info) {
        //用户id，从session中取出当前登录的id
        info.setAccountId(123);
        info.setCreateTime(new Date());
        info.setState("启用");

        boolean flag = infoService.insert(info);
        if (flag){
            return "redirect:list?current=1";
        } else {
            model.addAttribute("errorMsg", "添加失败");
            return "redirect:insertPage";
        }

    }

    @PostMapping("updateState")
    public String updateState(Integer id) {
        Info info = infoService.selectById(id);
        if ("停用".equals(info.getState())){
            info.setState("启用");
        }else{
            info.setState("停用");
        }

        infoService.updateById(info);

        return "redirect:list?current=1";
    }

    @PostMapping("updatePage")
    public String updatePage(Model model, Integer id){
        //查询所有信息分类
        List<Category> categoryList = categoryService.selectList(null);
        model.addAttribute("categoryList", categoryList);

        Info info = infoService.selectById(id);
        Account account = accountService.selectById(info.getAccountId());
        info.setAccountName(account.getName());
        model.addAttribute("info", info);

        return "info/update";
    }

    @PostMapping("update")
    public String update(Model model, Info info) {
        boolean flag = infoService.updateById(info);
        if (flag){
            return "redirect:list?current=1";
        } else {
            model.addAttribute("errorMsg", "修改失败");
            return "redirect:insertPage";
        }

    }


    @PostMapping("delete")
    public String delete(Integer id) {
        infoService.deleteById(id);
        return "redirect:list?current=1";
    }

    @PostMapping("deleteBatch")
    public String deleteBatch(Integer[] ids) {
        for (Integer id : ids) {
            infoService.deleteById(id);
        }
        return "redirect:list?current=1";
    }



}
