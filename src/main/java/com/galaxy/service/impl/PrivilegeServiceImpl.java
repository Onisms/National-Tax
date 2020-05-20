package com.galaxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.galaxy.dao.PrivilegeDao;
import com.galaxy.entity.Privilege;
import com.galaxy.service.PrivilegeService;
import org.springframework.stereotype.Service;

@Service
public class PrivilegeServiceImpl extends ServiceImpl<PrivilegeDao, Privilege> implements PrivilegeService {

}
