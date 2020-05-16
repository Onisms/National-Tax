package com.galaxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.galaxy.dao.AccountDao;
import com.galaxy.dao.TestBeanDao;
import com.galaxy.entity.Account;
import com.galaxy.entity.TestBean;
import com.galaxy.service.AccountService;
import com.galaxy.service.TestBeanService;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl extends ServiceImpl<AccountDao, Account> implements AccountService {

}
