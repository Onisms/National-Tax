package com.galaxy.web.controller;

import com.baomidou.mybatisplus.plugins.Page;
import com.galaxy.entity.TestBean;
import com.galaxy.service.TestBeanService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("testBean")
public class TestBeanController {

    @Resource
    private TestBeanService testBeanService;

    @GetMapping("insertPage")
    public String insertPage() {
        return "testBean/insert";
    }

    @PostMapping("insert")
    public String insert(TestBean testBean, Model model) {
        boolean insert = testBeanService.insert(testBean);
        if (testBean.getId() != null) {
            //回显了id,代表添加成功
            return "redirect:list?current=1";
        } else {
            model.addAttribute("errorMsg","添加失败");
            return "testBean/insert";
        }
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        testBeanService.deleteById(id);
        return "redirect:../list?current=1";
    }

    @GetMapping("updatePage")
    public String updatePage(Integer id,Model model) {
        TestBean testBean = testBeanService.selectById(id);
        model.addAttribute("testBean",testBean);
        return "testBean/update";
    }

    @PostMapping("update")
    public String update(TestBean testBean, Model model) {
        boolean flag = testBeanService.updateById(testBean);
        if (flag) {
            //回显了id,代表修改成功
            return "redirect:list?current=1";
        } else {
            model.addAttribute("errorMsg","修改失败");
            return "testBean/update";
        }
    }

    @GetMapping("list")
    public String selectPage(Integer current, Model model, TestBean testBean) {
        Page<TestBean> mapPage = testBeanService.selectPage(new Page<>(current, 5), null);
        model.addAttribute("mapPage",mapPage);
        return "testBean/list";
    }


}
