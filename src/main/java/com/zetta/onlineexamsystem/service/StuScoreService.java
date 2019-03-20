package com.zetta.onlineexamsystem.service;

import com.zetta.onlineexamsystem.modle.StuScore;

import java.util.List;

public interface StuScoreService {
    Boolean importScoreExcel(List<List<String>> lists,Integer year, Integer team);

    List<StuScore> getAllScoresWithPerson(Integer year,Integer team);
}
