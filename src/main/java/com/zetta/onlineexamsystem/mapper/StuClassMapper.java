package com.zetta.onlineexamsystem.mapper;

import com.zetta.onlineexamsystem.modle.StuClass;
import com.zetta.onlineexamsystem.modle.StuClassExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StuClassMapper {
    long countByExample(StuClassExample example);

    int deleteByExample(StuClassExample example);

    int deleteByPrimaryKey(Long classId);

    int insert(StuClass record);

    int insertSelective(StuClass record);

    List<StuClass> selectByExample(StuClassExample example);

    StuClass selectByPrimaryKey(Long classId);

    int updateByExampleSelective(@Param("record") StuClass record, @Param("example") StuClassExample example);

    int updateByExample(@Param("record") StuClass record, @Param("example") StuClassExample example);

    int updateByPrimaryKeySelective(StuClass record);

    int updateByPrimaryKey(StuClass record);
}