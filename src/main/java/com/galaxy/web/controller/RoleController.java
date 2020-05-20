package com.galaxy.web.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.galaxy.entity.Privilege;
import com.galaxy.entity.Role;
import com.galaxy.entity.RolePrivilege;
import com.galaxy.service.PrivilegeService;
import com.galaxy.service.RolePrivilegeService;
import com.galaxy.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController extends BaseController {

    @Resource
    public RoleService roleService;

    @Resource
    public PrivilegeService privilegeService;

    @Resource
    public RolePrivilegeService rolePrivilegeService;

    @GetMapping("list")
    public String list(Model model, Integer current, Role role){
        Wrapper<Role> wrapper = null;
        //条件查询
        if (role.getName() != null) {
            wrapper = new EntityWrapper<Role>().like("name", role.getName());
        }
        Page<Role> mapPage = roleService.selectPage(new Page<>(current, pageSize), wrapper);
        List<Role> roleList = mapPage.getRecords();
        for (Role roleDB : roleList) {
            List<RolePrivilege> rolePrivilegeList = rolePrivilegeService.selectList(
                    new EntityWrapper<RolePrivilege>().eq("role_id", roleDB.getId()));
            List<Privilege> privilegeList = new ArrayList<>();
            for (RolePrivilege rolePrivilege : rolePrivilegeList){
//                privilegeList.addAll(privilegeService.selectList(
//                        new EntityWrapper<Privilege>().eq("id", rolePrivilege.getPrivilegeId())));
                Privilege privilege = privilegeService.selectById(rolePrivilege.getPrivilegeId());
                privilegeList.add(privilege);
            }
            roleDB.setPrivilegeList(privilegeList);
        }
        model.addAttribute("mapPage", mapPage);
        return "role/list";
    }

    @GetMapping("insertPage")
    public String insertPage(Model model){
        List<Privilege> privilegeList = privilegeService.selectList(null);
        model.addAttribute("privilegeList", privilegeList);
        return "role/insert";
    }

    @PostMapping("insert")
    public String insert(Role role, Integer[] privilegeIds){
        boolean flag = roleService.insert(role);
        //如果角色添加成功，则赋予权限
        if (flag && privilegeIds != null){
            for (Integer privilegeId : privilegeIds) {
               rolePrivilegeService.insert(new RolePrivilege(role.getId(), privilegeId));
            }
        }
        return "redirect:list?current=1";
    }

    @PostMapping("updatePage")
    public String updatePage(Model model, Integer id){
        Role role = roleService.selectById(id);
        model.addAttribute("role", role);

        List<Privilege> privilegeList = privilegeService.selectList(null);
        model.addAttribute("privilegeList",privilegeList);
        List<RolePrivilege> rolePrivilegeList = rolePrivilegeService.selectList(
                new EntityWrapper<RolePrivilege>().eq("role_id", id));
        String pids = "";
       for (RolePrivilege rolePrivilege : rolePrivilegeList){
           pids += rolePrivilege.getPrivilegeId() + ",";
       }
       model.addAttribute("pids",pids);
        return "role/update";
    }

    @PostMapping("update")
    public String update(Role role,Integer[] privilegeIds){
        boolean flag = roleService.updateById(role);
        //如果角色修改成功，则修改权限
        if (flag && privilegeIds != null){
            rolePrivilegeService.delete(
                    new EntityWrapper<RolePrivilege>().eq("role_id",role.getId()));
            for (Integer privilegeId : privilegeIds) {
                rolePrivilegeService.insert(new RolePrivilege(role.getId(), privilegeId));
            }
        }
        return "redirect:list?current=1";
    }

    @PostMapping("delete")
    public String delete(Integer id){
        boolean flag = roleService.deleteById(id);
        if (flag) {
            rolePrivilegeService.delete(new EntityWrapper<RolePrivilege>().eq("role_id", id));
        }
        return "redirect:list?current=1";
    }

    @PostMapping("deleteBatch")
    public String deleteBatch(Integer[] ids){
            for (Integer id : ids) {
                    boolean flag = roleService.deleteById(id);
                if (flag){
                    rolePrivilegeService.delete(new EntityWrapper<RolePrivilege>().eq("role_id", id));
            }
        }
        return "redirect:list?current=1";
    }

}
