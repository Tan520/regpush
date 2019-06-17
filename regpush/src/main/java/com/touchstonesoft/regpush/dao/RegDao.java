package com.touchstonesoft.regpush.dao;

import com.touchstonesoft.regpush.pojo.RegInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface RegDao {

    int insertOne(RegInfo regInfo);
}
