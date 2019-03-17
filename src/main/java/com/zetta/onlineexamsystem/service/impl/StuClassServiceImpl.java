package com.zetta.onlineexamsystem.service.impl;

import com.zetta.onlineexamsystem.mapper.StuClassMapper;
import com.zetta.onlineexamsystem.modle.StuClass;
import com.zetta.onlineexamsystem.modle.StuClassExample;
import com.zetta.onlineexamsystem.service.StuClassService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StuClassServiceImpl implements StuClassService {

    @Resource
    private StuClassMapper classMapper;


    @Override
    public List<StuClass> getClassNames() {
        StuClassExample example=new StuClassExample();
        return classMapper.selectByExample(example);
    }
}
