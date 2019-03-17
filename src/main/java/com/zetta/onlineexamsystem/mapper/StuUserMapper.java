package com.zetta.onlineexamsystem.mapper;

import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.modle.StuUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StuUserMapper {
    long countByExample(StuUserExample example);

    int deleteByExample(StuUserExample example);

    int deleteByPrimaryKey(Long userId);

    int insert(StuUser record);

    int insertSelective(StuUser record);

    List<StuUser> selectByExample(StuUserExample example);

    StuUser selectByPrimaryKey(Long userId);

    int updateByExampleSelective(@Param("record") StuUser record, @Param("example") StuUserExample example);

    int updateByExample(@Param("record") StuUser record, @Param("example") StuUserExample example);

    int updateByPrimaryKeySelective(StuUser record);

    int updateByPrimaryKey(StuUser record);
}