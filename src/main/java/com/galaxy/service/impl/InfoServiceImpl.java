package com.galaxy.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.galaxy.dao.InfoDao;
import com.galaxy.entity.Info;
import com.galaxy.service.InfoService;
import org.springframework.stereotype.Service;

@Service
public class InfoServiceImpl extends ServiceImpl<InfoDao, Info> implements InfoService {

}
