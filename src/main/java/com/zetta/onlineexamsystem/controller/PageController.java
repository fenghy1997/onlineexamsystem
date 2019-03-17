package com.zetta.onlineexamsystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PageController {

    @RequestMapping("/")
    public String getIndex(){
        return  "index";
    }

    /**
     * 获取菜单栏
     * @param request
     * @return
     */
    @RequestMapping("/personCon")
    public String sendPerson(HttpServletRequest request){
        return "WEB-INF/pages/home";
    }

    @RequestMapping("/welcome")
    public String welcome(HttpServletRequest request) {
        return "WEB-INF/pages/welcome";
    }

    @RequestMapping("/personScoreAna.html")
    public String personScoreAna(HttpServletRequest request) {
        return "WEB-INF/pages/personScoreAna";
    }

    @RequestMapping("/excelImportWithScore.html")
    public String excelImportWithScore(HttpServletRequest request) {
        return "WEB-INF/pages/excelImportWithScore";
    }
}
