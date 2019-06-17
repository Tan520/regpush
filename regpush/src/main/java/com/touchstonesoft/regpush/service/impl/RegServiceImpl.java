package com.touchstonesoft.regpush.service.impl;

import com.touchstonesoft.regpush.dao.RegDao;
import com.touchstonesoft.regpush.pojo.RegInfo;
import com.touchstonesoft.regpush.service.RegService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegServiceImpl implements RegService {

    private RegDao regDao;

    @Autowired
    public RegServiceImpl(RegDao regDao) {
        this.regDao = regDao;
    }

    @Override
    public boolean addRegInfo(RegInfo regInfo) {
        //System.out.println(12);
        return regDao.insertOne(regInfo) == 1;
    }
}
