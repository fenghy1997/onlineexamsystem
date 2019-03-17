package com.zetta.onlineexamsystem.service;

import java.util.List;

public interface StuScoreService {
    Boolean importScoreExcel(List<List<String>> lists,Integer year, Integer team);
}
