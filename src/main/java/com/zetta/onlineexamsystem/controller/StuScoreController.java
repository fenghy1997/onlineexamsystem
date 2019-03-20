package com.zetta.onlineexamsystem.controller;


import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.StuScore;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.service.StuScoreService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("v1/api/score")
public class StuScoreController {

    @Resource
    private StuScoreService stuScoreService;

    @GetMapping("/getAllScores")
    public RestResponse<Object> getAllScores(@RequestParam("year")Integer year,@RequestParam("team")Integer team){
        RestResponse<Object> response=new RestResponse<>();
        List<StuScore> stuScores=stuScoreService.getAllScoresWithPerson(year,team);
        if(stuScores!=null && stuScores.size()>0){
            response.setResult(stuScores);
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }
        return response;
    }
}