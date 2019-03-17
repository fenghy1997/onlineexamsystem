package com.zetta.onlineexamsystem.controller;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.StuClass;
import com.zetta.onlineexamsystem.service.StuClassService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("v1/api/class")
public class StuClassController {

    @Resource
    private StuClassService stuClassService;

    @GetMapping("/getClassName")
    public RestResponse<Object> getClassName(){
        RestResponse<Object> response=new RestResponse<>();
        List<StuClass> classes=stuClassService.getClassNames();
        response.setResult(classes);
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }
}
