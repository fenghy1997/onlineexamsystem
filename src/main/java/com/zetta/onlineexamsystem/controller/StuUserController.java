package com.zetta.onlineexamsystem.controller;

import com.zetta.onlineexamsystem.commons.RestResponse;
import com.zetta.onlineexamsystem.commons.StatusCode;
import com.zetta.onlineexamsystem.modle.StuUser;
import com.zetta.onlineexamsystem.service.StuUserService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("v1/api/user")
public class StuUserController {

    @Resource
    private StuUserService userService;

    /**
     * 用户登录
     * @param user
     * @param request
     * @return
     */
    @PostMapping("/login")
    public RestResponse<Object> login(StuUser user, HttpServletRequest request){
        RestResponse<Object> response=new RestResponse<>();
        StuUser stuUser=userService.login(user);
        if(stuUser!=null){
            HttpSession session = request.getSession();
            session.setAttribute("userinfo",stuUser);
            response.setResult(stuUser);
            response.setResultCode(StatusCode.OK.code());
            response.setResultMsg(StatusCode.OK.message());
        }else {
            response.setResult(new StuUser());
            response.setResultCode(StatusCode.INVALID_PARAMS_CONVERSION.code());
            response.setResultMsg(StatusCode.INVALID_PARAMS_CONVERSION.message());
        }

        return response;
    }

    /**
     * 退出系统
     * @param request
     * @return
     */
    @RequestMapping("/logout")
    public RestResponse<Object> logout2(HttpServletRequest request) {
        RestResponse<Object> response=new RestResponse<>();
        request.getSession().invalidate();
        response.setResultCode(StatusCode.OK.code());
        response.setResultMsg(StatusCode.OK.message());
        return response;
    }
}
