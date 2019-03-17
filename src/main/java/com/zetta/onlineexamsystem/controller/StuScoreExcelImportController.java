package com.zetta.onlineexamsystem.controller;


import com.alibaba.excel.support.ExcelTypeEnum;
import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.service.StuScoreService;
import com.zetta.onlineexamsystem.util.EasyExcelUtil;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.InputStream;
import java.util.List;

@RestController
@RequestMapping("v1/api/excel")
public class StuScoreExcelImportController {

     @Resource
     private StuScoreService stuScoreService;

    @RequestMapping(value = "/excelImport",method = RequestMethod.POST)
    public RestResponse<Object> excelImport(@RequestParam("excelFile") MultipartFile excelFile,
                                            @RequestParam("year") Integer year,
                                            @RequestParam("team") Integer team){
        RestResponse<Object> response=new RestResponse<>();
        try {
            String originalFilename = excelFile.getOriginalFilename();
            String substring = originalFilename.substring(originalFilename.indexOf(".")+1);
            InputStream inputStream = excelFile.getInputStream();
            List<List<String>> lists = EasyExcelUtil.readExcelWithStringList(inputStream, ExcelTypeEnum.valueOf(substring.toUpperCase()));
            Boolean isTrue=stuScoreService.importScoreExcel(lists,year,team);
            if(isTrue){
                response.setResultCode(StatusCode.OK.code());
                response.setResultMsg("上传成功！");
            }else {
                response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
                response.setResultMsg("上传失败！");
            }
            return response;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  response;
    }
}
