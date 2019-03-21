package com.zetta.onlineexamsystem.service.impl;

import com.zetta.onlineexamsystem.mapper.StuUserMapper;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.modle.StuUserExample;
import com.zetta.onlineexamsystem.service.StuUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@Transactional
public class StuUserServiceImpl implements StuUserService {

    @Resource
    private StuUserMapper userMapper;

    @Resource
    private HttpServletRequest request;

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

    @Override
    public Boolean registerUser(StuUser stu, String  yanzhenma) {

        if(stu.getYzm()!=null && stu.getYzm().equals(yanzhenma)){
            stu.setStatus("2");
            return userMapper.insert(stu)>0;
        }
        return false;
    }
    @Override
    public Boolean  resetPwd(StuUser stu, String  yanzhenma){

        if(stu.getYzm()!=null && stu.getYzm().equals(yanzhenma)){
            StuUser stuUser=(StuUser)request.getSession().getAttribute("userinfo");
            stuUser.setUserPass(stu.getUserPass());
           return userMapper.updateByPrimaryKey(stuUser)>0;
        }
        return false;
    }
    @Override
    public Boolean  forgetPwd(StuUser stu, String  yanzhenma){

        if(stu.getYzm()!=null && stu.getYzm().equals(yanzhenma)){
            StuUser stuUser=(StuUser)request.getSession().getAttribute("userinfo");
            stuUser.setUserPass(stu.getUserPass());
            return userMapper.updateByPrimaryKey(stuUser)>0;
        }
        return false;
    }

    @Override
    public Boolean selectByEmail(StuUser stu,String  yanzhenma) {
        if(stu.getYzm()!=null && stu.getYzm().equals(yanzhenma)){
            StuUserExample example=new StuUserExample();
            StuUserExample.Criteria criteria=example.createCriteria();
            criteria.andUserEmailEqualTo(stu.getUserEmail());
            List<StuUser> stuUsers = userMapper.selectByExample(example);
            if(stuUsers.size()>0){
                StuUser stuUser = stuUsers.get(0);
                stuUser.setUserPass(stu.getUserPass());
                return userMapper.updateByPrimaryKey(stuUser)>0;
            }
        }
        return null;
    }


}
