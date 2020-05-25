package com.galaxy.web.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.event.AnalysisEventListener;
import com.alibaba.excel.read.builder.ExcelReaderBuilder;
import com.alibaba.excel.write.builder.ExcelWriterBuilder;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.galaxy.entity.*;
import com.galaxy.service.AccountService;
import com.galaxy.service.DeptService;
import com.galaxy.service.RoleService;
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
import java.io.Serializable;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("account")
@Slf4j
public class AccountController extends BaseController {
    @Resource
    private AccountService accountService;

    @Resource
    private DeptService deptService;

    @Resource
    private RoleService roleService;

    @Resource
    private AccountExcelListener accountExcelListener;

    /*登录页面*/
    @GetMapping("loginPage")
    public String loginPage() {
        return "loginPage";
    }

    /*登录功能*/
    @PostMapping("login")
    public String login(Account account) {
        System.out.println("登录成功");
        return "home/home";
    }

    @GetMapping("list")
    public String list(Model model, Integer current, Account account) {
        Wrapper<Account> wrapper = null;
        //条件查询
        if (account.getName() != null) {
            wrapper = new EntityWrapper<Account>().like("name", account.getName());
        }
        //带条件的分页查询数据
        Page<Account> mapPage = accountService.selectPage(new Page<Account>(current, pageSize), wrapper);
        List<Account> accountList = mapPage.getRecords();
        for (Account accountDB : accountList){
            //需要查询角色名称和部门名称
            Dept dept = deptService.selectById(accountDB.getDeptId());
            Role role = roleService.selectById(accountDB.getRoleId());
            //查询所有的角色名称
            //List<Role> roleList = roleService.selectList(new EntityWrapper<Role>().eq("state", "正常"));
            //使用属性驱动，讲获取到的名称的值，进行复制操作
            accountDB.setDeptName(dept.getName());
            accountDB.setRoleName(role.getName());

        }
        model.addAttribute("mapPage", mapPage);
        return "account/list";
    }


    @GetMapping("insertPage")
    public String insertPage(Model model) {
        //查询部门
        List<Dept> deptList = deptService.selectList(null);
        //查询角色
//        List<Role> role = roleService.selectList(null);
        //查询所有有效角色
        List<Role> roleList = roleService.selectList(new EntityWrapper<Role>().eq("state", "有效"));
        //发送到前段页面
        model.addAttribute("deptList", deptList);
        model.addAttribute("roleList", roleList);
        return "account/insert";
    }

    @PostMapping("insert")
    public String insert(String name, String password, Integer deptId, Integer roleId, Integer gender,
                         String email, String mobile, String birthday, String state, String remark,
                         MultipartFile headImg, Model model, HttpServletRequest request) {

        Account account = null;
        String headImgStr = null;
        try {
            //获取服务器文件路径
            String path = request.getServletContext().getRealPath("/WEB-INF/upload/");
            System.out.println(path);

            //优化日期格式
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String dateDirStr = format.format(new Date());
            File dateDir = new File(path, dateDirStr);
            if (!dateDir.exists()) dateDir.mkdir();

            if (headImg.getSize() > 0) {
                //优化文件名
                String filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +
                        UUID.randomUUID().toString().replace("-", "");
                String extension = FilenameUtils.getExtension(headImg.getOriginalFilename());
                filename = filename + "." + extension;
                //文件上传
                headImg.transferTo(new File(dateDir, filename));

                headImgStr = dateDirStr + "/" + filename;
            }

                account = new Account(0, name, password, deptId, roleId, gender, email, mobile,
                        format.parse(birthday), state, remark, headImgStr, null, null);
            } catch (IOException e) {
                    log.error("文件上传失败");
                  e.printStackTrace();
            } catch (ParseException e) {
            log.error("日期类型转换失败");
            e.printStackTrace();
            }

            boolean flag = accountService.insert(account);
            if (flag){
                return "redirect:list?current=1";
            }else {
                model.addAttribute("errorMsg", "新增异常");
                return "redirect:insertPage";
            }
    }

    @PostMapping("delete")
    public String delete(Integer id) {
        accountService.deleteById(id);
        return "redirect:list?current=1";
    }

    @PostMapping("deleteBatch")
    public String deleteBatch(Integer[] ids) {
        for (Integer id : ids) {
            accountService.deleteById(id);
        }
        return "redirect:list?current=1";
    }

    @PostMapping("updatePage")
    public String updatePage(Model model, int id){
        //查询部门
        List<Dept> deptList = deptService.selectList(null);
        List<Role> roleList = roleService.selectList(new EntityWrapper<Role>().eq("state", "有效"));

        model.addAttribute("deptList", deptList);
        model.addAttribute("roleList", roleList);

        Account account = accountService.selectById(id);
        model.addAttribute("account", account);

        return "account/update";
    }

    @PostMapping("update")
    public String update(Integer id, Integer deptId, String name, String password, Integer gender, Integer roleId,
                         String email, String mobile, String birthday, String state, String remark,
                         MultipartFile headImg, Model model, HttpServletRequest request) {
        Account account = null;
        String headImgStr = accountService.selectById(id).getHeadImg();
        try{
        //获取服务器文件路径
        String path = request.getServletContext().getRealPath("/WEB-INF/upload/");
        System.out.println(path);

            //优化日期路径
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String dateDirStr = format.format(new Date());
            File dateDir = new File(path, dateDirStr);
            if (!dateDir.exists()) dateDir.mkdir();

            if (headImg.getSize() > 0) {
                //有文件上传
                //优化文件名
                String filename = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())
                        + UUID.randomUUID().toString().replace("-", "");
                String extension = FilenameUtils.getExtension(headImg.getOriginalFilename());
                filename = filename + "." + extension;
                //文件上传
                headImg.transferTo(new File(dateDir, filename));

                headImgStr = dateDirStr + "/" + filename;
            }

            account = new Account(id, name, password, deptId, roleId, gender, email, mobile,
                format.parse(birthday), state, remark, headImgStr, null, null);
        } catch (ParseException e) {
            log.error("文件上传失败");
            e.printStackTrace();
        } catch (IOException e) {
            log.error("日期类型转换失败");
            e.printStackTrace();
        }

        boolean flag = accountService.updateById(account);
            if (flag){
                return "redirect:list?current=1";
            } else {
                model.addAttribute("errorMsg", "修改异常");
                return "redirect:updatePage";
            }

    }


    @PostMapping("importExcel")
    public String importExcel(MultipartFile accountExcel){
        try {
            ExcelReaderBuilder builder = EasyExcel.read(accountExcel.getInputStream(), Account.class, accountExcelListener);
            builder.sheet().doRead();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:list?current=1";
    }



    @PostMapping("exportExcel")
    public void exportExcel(HttpServletResponse response){

        //准备数据 从数据库里拿出来
        List<Account> accountList = accountService.selectList(null);

        //提供下载
        try {
            //设置下载参数
            response.setContentType("application/vnd.ms-excel");//MIME类型 告诉浏览器是什么类型
            response.setCharacterEncoding("UTF-8");
            //防止中文乱码
            String fileTimeName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
            String fileName = URLEncoder.encode("用户信息_" + fileTimeName, "UTF-8");
            //设置响应头-----让文件以附件的形式下载
            response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + fileName + ".xlsx");
            //使用EasyExcel进行文件的编写
            ExcelWriterBuilder builder = EasyExcel.write(response.getOutputStream(), Account.class);
            builder.sheet("用户信息表").doWrite(accountList);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }




}
