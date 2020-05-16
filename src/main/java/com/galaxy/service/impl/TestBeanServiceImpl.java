package com.galaxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.galaxy.dao.TestBeanDao;
import com.galaxy.entity.TestBean;
import com.galaxy.service.TestBeanService;
import org.springframework.stereotype.Service;

@Service
public class TestBeanServiceImpl extends ServiceImpl<TestBeanDao, TestBean> implements TestBeanService {

}
