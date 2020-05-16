package com.galaxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.galaxy.dao.AccountDao;
import com.galaxy.dao.DeptDao;
import com.galaxy.entity.Account;
import com.galaxy.entity.Dept;
import com.galaxy.service.AccountService;
import com.galaxy.service.DeptService;
import org.springframework.stereotype.Service;

@Service
public class DeptServiceImpl extends ServiceImpl<DeptDao, Dept> implements DeptService {

}
