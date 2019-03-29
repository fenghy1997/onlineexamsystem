package com.zetta.onlineexamsystem.mapper;

import com.zetta.onlineexamsystem.modle.StuScore;
import com.zetta.onlineexamsystem.modle.StuScoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StuScoreMapper {
    long countByExample(StuScoreExample example);

    int deleteByExample(StuScoreExample example);

    int deleteByPrimaryKey(Long scoreId);

    int insert( StuScore record);

    int insertBatch(@Param("stuScores") List<StuScore> stuScores);

    int insertSelective(StuScore record);

    List<String> selectScoreClassName(@Param("stuScore") StuScore stuScore);

    List<StuScore> selectByExample(StuScoreExample example);

    StuScore selectByPrimaryKey(Long scoreId);

    int updateByExampleSelective(@Param("record") StuScore record, @Param("example") StuScoreExample example);

    int updateByExample(@Param("record") StuScore record, @Param("example") StuScoreExample example);

    int updateByPrimaryKeySelective(StuScore record);

    int updateByPrimaryKey(StuScore record);
}