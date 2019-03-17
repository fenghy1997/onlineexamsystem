package com.zetta.onlineexamsystem.service.impl;

import com.zetta.onlineexamsystem.mapper.StuUserMapper;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.modle.StuUserExample;
import com.zetta.onlineexamsystem.service.StuUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class StuUserServiceImpl implements StuUserService {

    @Resource
    private StuUserMapper userMapper;

    @Override
    public StuUser login(StuUser user) {
        StuUserExample example=new StuUserExample();
        StuUserExample.Criteria criteria=example.createCriteria();
        criteria.andUserNumEqualTo(user.getUserNum());
        criteria.andUserPassEqualTo(user.getUserPass());
        List<StuUser> stuUsers = userMapper.selectByExample(example);
        if(stuUsers.size()>0){
            return stuUsers.get(0);
        }
        return null;
    }
}
