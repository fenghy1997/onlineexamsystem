package com.zetta.onlineexamsystem.service.impl;

import com.zetta.onlineexamsystem.mapper.StuClassMapper;
import com.zetta.onlineexamsystem.mapper.StuScoreMapper;
import com.zetta.onlineexamsystem.modle.StuClass;
import com.zetta.onlineexamsystem.modle.StuScore;
import com.zetta.onlineexamsystem.modle.StuScoreExample;
import com.zetta.onlineexamsystem.service.StuScoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class StuScoreServiceImpl implements StuScoreService {

    @Resource
    private StuScoreMapper stuScoreMapper;
    @Resource
    private StuClassMapper stuClassMapper;


    /**
     * 文件上传，文件的格式不能够修改
     * @param lists
     * @return
     */
    @Override
    @Transactional
    public Boolean importScoreExcel(List<List<String>> lists,Integer year, Integer team) {
        String className ="";
        if(lists.size()>0 && lists.get(2)!=null && lists.get(2).get(12)!=null){
            className= lists.get(2).get(12);
        }

        StuScoreExample example=new StuScoreExample();
        StuScoreExample.Criteria criteria=example.createCriteria();
        criteria.andScoreTimeEqualTo(year);
        criteria.andScoreTeamEqualTo(team);
        criteria.andClassNameEqualTo(className);
        List<StuScore> stuScores1 = stuScoreMapper.selectByExample(example);
        if(stuScores1.size()>0){
            stuScoreMapper.deleteByExample(example);
            return insertScore(lists, year, team,className);
        }else {
            if(insertScore(lists, year, team,className)){
                StuClass stuClass=new StuClass();
                stuClass.setClassName(className);
                stuClass.setCreateTime(new Date());
                return stuClassMapper.insert(stuClass)>0;
            }else {
                return false;
            }

        }
    }

    private boolean insertScore(List<List<String>> lists, Integer year, Integer team,String className) {
        String teamName="";
        if(team!=null && team==1){
            teamName="一";
        }else {
            teamName="二";
        }
        List<StuScore> stuScores=new LinkedList<>();
        List<String> projects=new LinkedList<>();
        for (int i = 0; i < lists.size(); i++) {
            //判断文件日期的正确性
            if(i==1){
                String s = lists.get(1).get(1);
                Integer substring = Integer.valueOf(s.substring(0, s.indexOf("-")));
                String teams =s.substring(s.indexOf("第")+1,s.indexOf("期")-1);
                if(!year.equals(substring)){
                    return false;
                }
                if(!teamName.equals(teams)){
                    return false;
                }
            }

            //添加科目信息到list
            if(i==3){
                List<String> strings = lists.get(3);
                if (strings.size()>0){
                    for (int i1 = 0; i1 < strings.size(); i1++) {
                        if(i1>3){
                            projects.add(strings.get(i1));
                        }
                    }
                }
            }

            String over = lists.get(i).get(1);
            //结束读取
            if("课程/环节平均成绩".equals(over)){
                break;
            }

            //读取成绩
            if(i>4){
                List<String> scores = lists.get(i);
                String userNum=scores.get(2)==null?"":scores.get(2);
                for (int i1 = 0; i1 < scores.size(); i1++) {
                    if(i1>3 && i1<19){
                        if(scores.get(i1)==null || "".equals(scores.get(i1))){
                            break;
                        }
                        StuScore stuScore=new StuScore();
                        stuScore.setUserNum(userNum);
                        stuScore.setClassName(className);
                        stuScore.setScoreClassName(projects.get(i1-4)==null?"":projects.get(i1-4));
                        stuScore.setScoreNum(new BigDecimal(scores.get(i1)==null?"":scores.get(i1)));
                        stuScore.setScoreTeam(team);
                        stuScore.setScoreTime(year);
                        stuScore.setCreateTime(new Date());
                        stuScore.setScoreAvgCredit(new BigDecimal(scores.get(22)==null?"":scores.get(22)));
                        stuScore.setScoreAvgNum(new BigDecimal(scores.get(20)==null?"":scores.get(20)));
                        stuScore.setScoreGpa(new BigDecimal(scores.get(21)==null?"":scores.get(21)));
                        stuScore.setScoreTotalNum(new BigDecimal(scores.get(19)==null?"":scores.get(19)));
                        stuScores.add(stuScore);
                    }
                }
            }

        }
        return stuScoreMapper.insertBatch(stuScores)>0;
    }
}
